package com.hanul.iot;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import member.MemberServiceImpl;
import member.MemberVO;
import notice.NoticePage;
import notice.NoticeServiceImpl;
import notice.NoticeVO;

@Controller
public class NoticeController {
	@Autowired private NoticeServiceImpl service;
	@Autowired private MemberServiceImpl member;
	@Autowired private CommonService common;
	@Autowired private NoticePage page;
	
	//공지사항 목록화면 요청//////////////////////////////////////////////////////
	@RequestMapping("/list.no")
	public String list(Model model, HttpSession session, @RequestParam(defaultValue = "1") int curPage) {
		//공지사항 클릭 하면 admin으로 자동 로그인
		HashMap<String, String> map = new HashMap<String, String>();
		//HashMap : 데이터를 담을 자료 구조
		map.put("id", "admin");
		map.put("pw", "1234");
		session.setAttribute("login_info", member.member_login(map));
		session.setAttribute("category", "no");
		//DB에서 공지 글 목록을 조회해와 목록 화면에 출력
		page.setCurPage(curPage);
		model.addAttribute("page", service.notice_list(page));
		
		return "notice/list";
	}
	
	//신규 공지 글 작성 화면 요청//////////////////////////////////////////////////////
	@RequestMapping("/new.no")
	public String notice() {
		return "notice/new";
	}
	
	//신규 공지 글 저장 처리 요청//////////////////////////////////////////////////////
	@RequestMapping("/insert.no")
	public String insert(MultipartFile file, NoticeVO vo, HttpSession session) {
		//첨부한 파일을 서버 시스템에 업로드하는 처리
		if( !file.isEmpty() ) {
			vo.setFilepath(common.upload("notice", file, session));
			vo.setFilename(file.getOriginalFilename());
		}
		
		vo.setWriter( ((MemberVO) session.getAttribute("login_info")).getId() );
		//화면에서 입력한 정보를 DB에 저장한 후
		service.notice_insert(vo);
		//목록 화면으로 연결
		return "redirect:list.no";
	}
	
	//공지글 상세 화면 요청//////////////////////////////////////////////////////
	@RequestMapping("/detail.no")
	public String detail(int id, Model model) {
		//선택한 공지글에 대한 조회수 증가 처리
		service.notice_read(id);
		
		//선택한 공지글 정보를 DB에서 조회해와 상세 화면에 출력
		model.addAttribute("vo", service.notice_detail(id));
		model.addAttribute("crlf", "\r\n");
		
		return "notice/detail";
	} //detail()
	
	//첨부파일 다운로드 요청//////////////////////////////////////////////////////
	@ResponseBody @RequestMapping("/download.no")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		NoticeVO vo = service.notice_detail(id);
		common.download(vo.getFilename(), vo.getFilepath(), session, response);
	} //download()
	
	//공지글 삭제 처리 요청//////////////////////////////////////////////////////
	@RequestMapping("/delete.no")
	public String delete(int id, HttpSession session) {
		//선택한 공지글에 첨부된 파일이 있다면 서버의 물리적 영역에서 해당 파일도 삭제한다
		NoticeVO vo = service.notice_detail(id);
		if(vo.getFilepath() != null) {
			File file = new File(session.getServletContext().getRealPath("resources") + vo.getFilepath());
			if( file.exists() ) { file.delete(); }
		}
		
		//선택한 공지글을 DB에서 삭제한 후 목록 화면으로 연결
		service.notice_delete(id);
		
		return "redirect:list.no";
	} //delete()
	
	//공지글 수정 화면 요청//////////////////////////////////////////////////////
	@RequestMapping("/modify.no")
	public String modify(int id, Model model) {
		//선택한 공지글 정보를 DB에서 조회해와 수정화면에 출력
		model.addAttribute("vo", service.notice_detail(id));
		return "notice/modify";
	} //modify()
	
	//공지글 수정 처리 요청//////////////////////////////////////////////////////
	@RequestMapping("/update.no")
	public String update(NoticeVO vo, MultipartFile file, HttpSession session, String attach) {
		//원래 공지글의 첨부 파일 관련 정보를 조회
		NoticeVO notice = service.notice_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") + notice.getFilepath();
		
		//파일을 첨부한 경우 - 없었는데 첨부 / 있던 파일을 바꿔서 첨부
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("notice", file, session));
			
			//원래 있던 첨부 파일은 서버에서 삭제
			if( notice.getFilename() != null ) {
				File f = new File(uuid);
				if ( f.exists() ) { f.delete(); }
			}
			
		} else {
			//원래 있던 첨부 파일을 삭제됐거나 원래부터 첨부 파일이 없었던 경우
			if(attach.isEmpty()) {
				//원래 있던 첨부 파일은 서버에서 삭제
				if( notice.getFilename() != null ) {
					File f = new File(uuid);
					if ( f.exists() ) { f.delete(); }
				}
				
			//원래 있던 첨부 파일을 그대로 사용하는 경우
			} else {
				vo.setFilename(notice.getFilename());
				vo.setFilepath(notice.getFilepath());
			}
			
		}
		
		//화면에서 변경한 정보를 DB에 저장한 후 상세 화면으로 연결
		service.notice_update(vo);
		
		return "redirect:detail.no?id=" + vo.getId();
	} //update()
	
	//공지글 답글 쓰기 화면 요청=============================================================================================
	@RequestMapping("/reply.no")
	public String reply(Model model, int id) {
		//원글의 정보를 답글 쓰기 화면에서 알 수 있도록 한다.
		model.addAttribute("vo", service.notice_detail(id));
		
		return "notice/reply";
	} //reply()

	//공지글 신규 답글 저장 처리 요청=============================================================================================
	@RequestMapping("/reply_insert.no")
	public String reply_insert(NoticeVO vo, HttpSession session, MultipartFile file) {
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("notice", file, session));
		}
		vo.setWriter( ((MemberVO)session.getAttribute("login_info")).getId() );
		
		//화면에서 입력한 정보를 DB에 저장한 후 목록화면으로 연결
		service.notice_reply_insert(vo);
		return "redirect:list.no";
	} //reply_insert()
} //class