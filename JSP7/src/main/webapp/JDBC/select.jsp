<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>select.jsp</h1>
	
	<h2> DB에 접속해서 데이터를 조회 (Read)</h2>
	
	<%
		// 디비연결에 필요한 정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		// 1. 드라이버 로드 
		Class.forName(DRIVER);
		System.out.println("Success Driver load");
		// 2. connect DB
		Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("Success DB connect");
		System.out.println("con: " + con);
		// 3. SQL 구문 & pstmt 객체
		String sql = "select * from test3";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		
		// 4. SQL구문 실행
		ResultSet rs = pstmt.executeQuery(); //결과: 레코드셋 생성
	%>
	<table border="1">
		<tr>
			<td>idx</td>
			<td>name</td>
			<td>jumin</td>
		</tr>	
	<% 	
		
		// 5. 데이터 처리(select 결과를 출력) recordSet
		while(rs.next()){// 커서를 다음으로 이동시켜서 정보가 있을 때 ture, 없을 때 flase 
			// re.next() == true (해당 데이터가 존재한다/ 특정데이터(row)가 활성화)
			
			// rs에 활성화된 정보를 가져오기
			// rs.getxxx() depend on data type
			//rs.getInt(int columnIndex 컬럼의 위치);// method 이름이 같음(overloading)
			//rs.getInt(String columnLabel 컬럼의 이름 );
/* 			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String jumin = rs.getString("jumin"); */
			int idx = rs.getInt(1);
			String name = rs.getString(2);
			String jumin = rs.getString(3);
			
			System.out.println("idx: " + idx);
			System.out.println("name: " + name);
			System.out.println("jumin: " + jumin);
			
			// 화면에 출력 
/* 			out.println("idx: " + idx);
			out.println("name: " + name);
			out.println("jumin: " + jumin);
			out.println("<hr>"); */
			%>
				<tr>
					<td><%=idx %></td>
					<td><%=name %></td>
					<td><%=jumin %></td>
				
				</tr>
			
			<% 
			}
		
		
		System.out.println("Success DB select");
	%>
	
	</table>
	
	
	
	
</body>
</html>