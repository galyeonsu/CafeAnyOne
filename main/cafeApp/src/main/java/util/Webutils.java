package util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Member;


public class Webutils {
	public static final String CONTEXT_PATH = "/";
	
	public static Member getMember(HttpServletRequest req) {
		Member member = null;         
		if(req.getSession().getAttribute("member") != null) {    
			member = (Member)req.getSession().getAttribute("member");  
		}
		return member;
	}
	
	public static void alert(HttpServletResponse resp, String msg, String url, boolean back) throws IOException{
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter(); //HTTP 응답의 출력 스트림을 가져옴 출력 스트림을 사용하여 클라이언트에게 HTML 내용을 전송
		pw.println("<script>");
		pw.println("alert('"+msg+"')");
		if(url != null) {
			pw.println("location.href = '" + url + "'"); //url 변수가 null이 아닌 경우 location.href를 사용하여 페이지를 이동
		}
		if(back) {
			pw.println("history.back();"); //back 변수가 true인 경우 브라우저의 이전 페이지로 이동하도록 JavaScript를 생성
		}
		pw.println("</script>");
	}
	
	
	public static void alert(HttpServletResponse resp, String msg) throws IOException {
		alert(resp, msg, null); // url 매개변수의 값이 null 특정 url로 넘어가지 않고 현재 페이지에 머문다는뜻
	}

	public static void alert(HttpServletResponse resp, String msg, String url) throws IOException {
		alert(resp, msg, url, false); // false는 사용자가 경고 창을 확인한 후 브라우저의 뒤로 가기 버튼을 눌러도 이전 페이지로 이동하지 않도록 함
	
	}

	public static void alert(HttpServletResponse resp, String msg, boolean back) throws IOException {
		alert(resp, msg, null, true); //true는 boolean back 의 매개변수 뒤로가기 동작 활성
	}
}

