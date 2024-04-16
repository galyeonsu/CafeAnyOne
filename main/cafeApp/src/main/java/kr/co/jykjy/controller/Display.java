package kr.co.jykjy.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Attach;



@WebServlet("/display")
public class Display extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Attach dto = new Attach();
		
		String path = req.getParameter("path");
		String origin = req.getParameter("origin");
		String uuid = req.getParameter("uuid");
		String image = req.getParameter("image");
		
		dto.setUuid(uuid);
		dto.setFilePath(path);
		dto.setOrigin(origin);
		
		OutputStream os = resp.getOutputStream();  
		byte[] bytes = Files.readAllBytes(dto.toFile().toPath());
		resp.setContentType(Files.probeContentType(dto.toFile().toPath()));
		os.write(bytes);
	}
}
