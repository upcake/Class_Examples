package com.hanul.iot;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import member.MemberServiceImpl;
import member.MemberVO;

@Controller
public class MemberController {
	@Autowired private MemberServiceImpl service;
	@Autowired private CommonService common;
	
	//로그인 요청
	@ResponseBody @RequestMapping("/login")
	public String login(String id, String pw, HttpSession session) {
		//화면에서 입력한 아이디와 비밀번호가 일치하는 회원 정보가 DB에 있는지 확인하여
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pw", pw);
		MemberVO vo = service.member_login(map);

		//일치하는 회원 정보가 있다면 회원 정보를 세션에 담는다
		session.setAttribute("login_info", vo);
		
		return vo == null ? "false" : "true";
	}
	
	//로그아웃 요청
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession session) {
		session.removeAttribute("login_info");
	}
	
	//회원가입 화면 요청
	@RequestMapping("/member")
	public String member(HttpSession session) {
		session.setAttribute("category", "join");
		
		return "member/join";
	}
	

	//아이디 중복확인 요청
	@ResponseBody @RequestMapping("/id_check")
	public boolean id_check(String id) {
		return service.member_id_check(id);
	}
	
	//회원가입 처리 요청
	//RequestMapping에 한글이 깨지지않게 utf-8 설정
	@ResponseBody @RequestMapping(value= "/join", produces= "text/html; charset= utf-8")
	public String join(MemberVO vo, HttpServletRequest request, HttpSession session) {
		String msg = "<script type='text/javascript'>";
		//화면에서 입력한 정보를 DB에 저장한 후 홈 화면으로 연결
		if(service.member_insert(vo)) {
			//메일 전송
			common.sendEmail(vo.getEmail(), vo.getName(), session);
			msg += "alert('회원가입을 축하드립니다!'); location='" + request.getContextPath() + "'";
		} else {
			msg += "alert('회원가입에 실패했습니다!'); history.go(-1)";
		}
		msg += "</script>";
		return msg;
	}
	
}

/* 이클립스 디버깅
		F5 해당 라인 시작, 함수가 있다면 함수 속으로 들어간다.
		F6 해당 라인 시작, 함수가 있어도 들어가지 않고 결과만 가지고 현재 라인 끝까지 실행.
		F7 현재 함수의 끝까지 실행하여 현재 함수를 벗어난다.
		F8 다음 브레이크 포인트까지 한번엔 실행

*/