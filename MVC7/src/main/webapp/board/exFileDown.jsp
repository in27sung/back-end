<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exFileDown.jsp</title>
</head>
<body>
	<h2> 파일 다운로드 처리하는 페이지</h2>
	
	<%
		// 다운로드할 파일명 
		String fileName = request.getParameter("fileName");
		
		// 다운로드할 파일의 위치(파일을 저장하는 폴더명)
		String savePath = "upload";
		
		// 프로젝트정보를 가져오기 
		ServletContext CTX = getServletContext();
		String downloadPath = CTX.getRealPath(savePath);
		
		System.out.println("dowloadPath: " + downloadPath);
		
		// 다운로드 폴더명 + 다운로드 파일명
		
		String filePath = downloadPath + "/" +fileName;
		System.out.println("filePath: " + filePath);
		
		// 파일데이터를 전송하기위한 배열
		byte[] b = new byte[4096]; // 4KB
		
		// 파일 입력스트림 객체
		FileInputStream fis = new FileInputStream(filePath);
		
		// 전송하려는 파일의 MIME타입을 확인 
		String mimeType = CTX.getMimeType(filePath);
		System.out.println(mimeType);
		if(mimeType == null) { 
			mimeType = "application/octet-stream";
			// application/octet-stream (잘 알려지지 않은 이진 파일)
			// 브라우저에서는 자동실행 x
		}
		
		// 전송하려는 데이터타입에 따른 응답데이터 형태를 변경 
		response.setContentType(mimeType);
		
		/************************************************************************************/
		// 한글처리 인코딩
		String agent = request.getHeader("User-Agent");
		boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
		
		if(ieBrowser){
			fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+","%20");
		}else{
			// ie 아닌 다른 모든 브라우저 
			fileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
		}
		
		/************************************************************************************/
	
		response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
		// -> 모든 파일의 다운로드 형태를 다운로드 창으로 실행하게설정 
		
		// 데이터 출력(다운로드)
		ServletOutputStream out2 = response.getOutputStream();
		
		int data = 0;
		while((data = fis.read(b,0,b.length)) != -1) { 
			// 파일을 읽어올때 파일의 끝(-1)이 아닌경우 반복  
			out2.write(b,0,data);
		}
		out2.flush(); // 배열에 빈공간을 공백으로 채워서 전달 
		out2.close();
		fis.close();
	%>
</body>
</html>