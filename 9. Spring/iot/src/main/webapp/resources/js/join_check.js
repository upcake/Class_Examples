/**
 * 회원가입시 각 항목에 대한 입력 유효성 판단 
 */
var space = /\s/g;
var title = "";
var join = {
	common: {
		empty: {code: 'invalid', desc: title + '입력하세요.'},
		space: {code: 'invalid', desc: '공백 없이 입력하세요.'},
		min: {code: 'invalid', desc: '최소 5자 이상 입력하세요.'},
		max: {code: 'invalid', desc: '최대 10자 이내로 입력하세요.'}
	},
	
	id: {
		valid: { code:'valid', desc: '아이디를 중복확인하세요.' },
		invalid: { code:'invalid', desc: '아이디는 영문 소문자, 숫자만 입력하세요.' },
		usable: { code: 'valid', desc: '사용 가능한 아이디입니다.'},
		unusable: { code: 'invalid', desc: '이미 사용 중인 아이디입니다.	' }
	},
	
	id_usable: function(data) {
		if(data) return this.id.usable;
		else return this.id.unusable;
	},
	
	id_status: function(id) {
		var reg = /[^a-z0-9]/g;
		title = $('[name = id]').attr('title');
		if(id == '') { 
			return this.common.empty;
		} else if(id.match(space)) {
			return this.common.space;
		} else if(reg.test(id)) {
			return this.id.invalid;
		} else if(id.length < 5) {
			return this.common.min;
		} else if(id.length > 10) {
			return this.common.max;
		} else {
			return this.id.valid;
		}
	},
	
	pw: {
		valid: { code:'valid', desc: '사용 가능한 비밀번호입니다.' },
		invalid: { code:'invalid', desc: '비밀번호는 영문 대/소문자, 숫자만 입력하세요.' },
		lack: { code:'invalid', desc: '비밀번호는 영문 대/소문자, 숫자를 모두 포함해야 합니다.' },
		equal: { code: 'valid', desc: '비밀번호가 일치합니다.' },
		notEqual: { code: 'invalid', desc: '비밀번호가 일치하지 않습니다.' }
	},
	
	pw_status: function(pw) {
		var reg = /[^a-zA-Z0-9]/g;
		title = $('[name = pw]').attr('title');
		var upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
		if(pw == '') return this.common.empty;
		else if(pw.match(space)) return this.common.space;
		else if(reg.test(pw)) return this.pw.invalid;
		else if(pw.length < 5) return this.common.min;
		else if(pw.length > 10) return this.common.max;
		else if ( !upper.test(pw) || !lower.test(pw) || !digit.test(pw) ) return this.pw.lack;
		else return this.pw.valid;
	},
	
	pw_ck_status: function(pw_ck) {
		title = $('[name = pw_ck]').attr('title');
		if ( pw_ck=='' ) return this.common.empty;
		else if(pw_ck == $('[name=pw]').val() ) return this.pw.equal;
		else return this.pw.notEqual; 
	},
	
	email: {
		valid: { code: 'valid', desc: '유효한 이메일입니다.' },
		invalid: { code: 'invalid', desc: '유효하지 않은 이메일입니다.' }
	},
	
	email_status: function(email) {
		var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		title = $('[name = email]').attr('title');
		if( email == '' ) return this.common.empty;
		else if(email.match(space)) return this.common.space;
		else if( reg.test(email) ) return this.email.valid;
		else return this.email.invalid;  
	},
	
	tag_status: function(tag) {
		var data = tag.val();
		tag = tag.attr('name');
		if(tag == 'id') {
			data = this.id_status(data);
		} else if(tag == 'pw') {
			data = this.pw_status(data);
		} else if(tag == 'pw_ck') {
			data = this.pw_ck_status(data);
		} else if(tag == 'email') {
			data = this.email_status(data);
		} 
		return data;
	}
}