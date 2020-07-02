package com.hanul.iot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	//로그인 요청
	@RequestMapping("/login")
	public String login(String id, String pw) {
		//화면에서 입력한 아이디와 비밀번호가 일치하는 회원 정보가 DB에 있는지 확인하여
		//일치하는 회원 정보가 있다면 회원 정보를 세션에 담는다
		
		return "";
	}
}