package com.hanul.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.MemberVO;

//컨트롤러 객체 생성 @Controller
@Controller
public class TestController {
	
	//어떤 요청에 대해 연결할 것인지 지정 @RequestMapping()
	//어노테이션이 올바르게 되었을때와 아닐때의 404에러 메시지가 다르다
	@RequestMapping("/first")
	public String view(Model model) {
		//addAttribute("어떻게 부를것인가", 어떤 데이터를)
		//어트리뷰트로 전달된 데이터는 EL로 표현 가능
		model.addAttribute("today", 
				new SimpleDateFormat("yyyy년 MM월 dd일").format(new Date()));
		
		return "index";	//first란 요청에 대해 index.jsp로 응답
	}
	
	@RequestMapping("/second")
	public ModelAndView view() {
		//모델앤뷰 객체를 생성해준다.
		ModelAndView mav = new ModelAndView();
		mav.addObject("now", 
				new SimpleDateFormat("a hh시 mm분 ss초").format(new Date()));
		
		//second가 index.jsp로 연결되게끔 지정
		mav.setViewName("index");
		
		return mav;
	}
	
	@RequestMapping("/join")
	public String join() {
		//데이터를 입력할 곳이기 때문에 전달할 데이터가 없음
		
		return "member/join";
	}
	
	//HttpServletRequest로 form의 데이터를 접근
	@RequestMapping("/joinRequest")
	public String join(HttpServletRequest request, Model model) {
		//데이터를 전달할 때에는 모델에 담아서전달하는데 전달할 데이터는 request에 담겨있다.
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("gender", request.getParameter("gender"));
		model.addAttribute("email", request.getParameter("email"));
		model.addAttribute("method", "HttpServletRequest");
		
		return "member/info";
	}
	
	//@RequestParam으로 form의 데이터를 접근
	@RequestMapping("/joinRequestParam")
	public String join(Model model, String name,
			@RequestParam("gender") String g, String email) {
			//지정해도 되지만 지정하지 않아도 기본적으로 @RequestParam 처리가 된다.
			//form 태그의 name 속성과 통일을 하면 RequestParam의 매개 변수로 지정을 하지 않아도 되지만,
			//name 속성과 매개 변수의 이름을 다르게 설정하면 RequestParam의 매개 변수로 지정을 해주어야 한다.
		
		model.addAttribute("name", name);
		model.addAttribute("gender", g);
		model.addAttribute("email", email);
		model.addAttribute("method", "@RequestParam");
		
		return "member/info";
	}
	
	//데이터 객체(VO)로 form의 데이터를 접근
	/* 기존에는 이렇게 하나 join()의 매개변수에 MemberVO vo가 있다면 하지않아도 된다.
	public String join() {
		MemberVO vo = new MemberVO();
		vo.set ~~~
	}
	*/
	@RequestMapping("/joinDataObject")
	public String join(MemberVO vo, Model model) {
		model.addAttribute("vo", vo);
		model.addAttribute("method", "데이터 객체");
		
		return "member/info";
	}
	
	//@PathVariable로 form의 데이터를 접근
	@RequestMapping("/joinPathVariable/{n}/{gender}/{email}/")
	public String join(@PathVariable("n") String name, Model model,
			@PathVariable String gender, @PathVariable String email) {
		//@PathVariable은 파라미터마다 어노테이션을 따로 지정해주어야한다.
		//Model의 위치는 파라미터 처음, 중간, 끝, 어디여도 상관없다
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		model.addAttribute("method", "@PathVariable");
		
		return "member/info";
	}
	//20/06/30=====================================================================================	
	//로그인 화면
	@RequestMapping("/login")
	public String login() {
		
		
		return "member/login";
	}
	
	//로그인 결과 화면 
	@RequestMapping("/login_result")
	public String login_result(String id, String pwd) {
		//아이디, 비번 일치시 home 화면으로 연결,
		//				일치하지 않는 경우 로그인 화면으로
		//DB에서 읽어온 데이터가 hong, 1234라고 가정
		if(id.equals("hong") && pwd.equals("1234")) {
//			return "home"; //forward : 요청 url이 유지되나 응답에 해당하는 url이 서로 상이한 경우 변하지 않는다.
			return "redirect:/";	//home.jsp의 요청 url은 '/'
		} else {
//			return "member/login"; //forward
			return "redirect:login";	//login.jsp의 요청 url
		}
	}
}