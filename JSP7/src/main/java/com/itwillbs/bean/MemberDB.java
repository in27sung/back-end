package com.itwillbs.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 회원(itwill_member)에 관련된 모든 디비에 관한 처리동작을 수행 
 */
public class MemberDB {
	
	public void insertMember(MemberBean memberB) throws Exception{
	  
	//2) 전달받은 정보를 mySQL(DB)에 저장
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "Dlstjd1915";
	
	// 1. Driver load
	Class.forName(DRIVER);
	System.out.println("Success Driver load");
	
	// 2. Connect DB
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("Success DataBase connect");
	
	// 3. SQL statement & pstmt object
	String sql = "insert into itwill_member (id, pass, name, age, gender, email, regdate) values(?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 3-1.? values
 	pstmt.setString(1, memberB.getId()); // set + datatype 
 	pstmt.setString(2, memberB.getPass());
 	pstmt.setString(3, memberB.getName());
 	pstmt.setInt(4, memberB.getAge());
 	pstmt.setString(5, memberB.getGender());
 	pstmt.setString(6, memberB.getEmail());
 	pstmt.setTimestamp(7, memberB.getRegdate());

	// 4. SQL 구문 실행
	pstmt.executeUpdate();
	System.out.println("Complete sign up");
	}
	
	// Login checking method 
	public int loginCheck(MemberBean memberB) throws Exception {
		
		int result = -1; // 로그인 처리 결과 저장 (1(login success), 0(incorrect password), -1(incorrect id))
		
		// DB information
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		
		// Load drive
		Class.forName(DRIVER);
		System.out.println("DB: Complete dirver load");
		
		// connect DB
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB: Complete connection.");
		
		// SQL statement & pstmt object
		String sql = "select pass from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// ? value 
		pstmt.setString(1, memberB.getId());		
		
		// execute SQL 
		ResultSet rs = pstmt.executeQuery();

		// Data processing 
		if(rs.next()) {
			// compare password with DB 
			if(memberB.getPass().equals(rs.getString("pass"))) {
				result = 1;
			}
			else {
				result = 0;
			}
		}
		else { // 회원정보x -> loginPro.jsp 전달 
			result = -1;
		}
		
		System.out.println("DB: Complete log in check");
		System.out.println("LogIn code: " + result);
		return result;
	}
	public MemberBean getMember(String id) throws Exception {

		// 회원정보를 저장하는 instance 생성
		MemberBean memberB = new MemberBean();
		
		// DB connect info
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		
		// Load driver
		Class.forName(DRIVER);
		
		// Connect database
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("Connection: " + con);
		
		// SQL 구문 & pstmt 객체 
		String sql = "select * from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		// SQL 실행
		ResultSet rs = pstmt.executeQuery();
		
		// Date processing 
		if(rs.next()){
	
			// 사용자가 필요한 정보를 MemberBean객체에 저장 
			memberB.setId(rs.getString("id"));
			memberB.setPass(rs.getString("pass"));
			memberB.setName(rs.getString("name"));
			memberB.setGender(rs.getString("gender"));
			memberB.setAge(rs.getInt("age"));
			memberB.setEmail(rs.getString("email"));
			memberB.setRegdate(rs.getTimestamp("regdate"));
			
		}
		return memberB;
	}
	
	public int updateMember(MemberBean memberB) throws Exception {
		int result = -1;
		
		// Get DB information 
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		
		// Load driver
		Class.forName(DRIVER);
		
		// Connect DB
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("Connection: " + con);
		
		// Update SQL statement & pstmt 객체
		// 본인 여부 확인 후 정보 수정 
		String sql = "select pass from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// Update ??
		pstmt.setString(1, memberB.getId());
		
		// Execute DB 
		ResultSet rs = pstmt.executeQuery();
		
		// Data processing
		if(rs.next()) {
			if(memberB.getPass().equals(rs.getString("pass"))) {

				sql = "update itwill_member set name=?, age=?, gender=?  where id=?";
				pstmt = con.prepareStatement(sql); 
				
				// Update ?
				pstmt.setString(1, memberB.getName()); 
				pstmt.setInt(2, memberB.getAge()); 
				pstmt.setString(3, memberB.getGender());
				pstmt.setString(4, memberB.getId());
				
				// Execute SQL
				pstmt.executeUpdate();
				
				result = 1;
			}
			else {
				result = 0;
			}
		}
		else {
			result = -1;
		}
		
		System.out.println("DB: 회원정보 수정완료 code: "+ result);
		
		return result;
	}//updateMember
	
	public int deleteMember(MemberBean memberB) throws Exception {
		int result = -1;
		
		// Get DB information 
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		
		// Load driver
		Class.forName(DRIVER);
		
		// Connect DB
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("Connection: " + con);
		
		// Update SQL 구문 & pstmt 객체
		// 본인 여부 확인 후 정보 수정 
		String sql = "select pass from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// Update ???
		pstmt.setString(1, memberB.getId());
		
		//Excute DB 
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			if(memberB.getPass().equals(rs.getString("pass"))) {
				sql = "delete from itwill_member where id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, memberB.getId());
				
				// SQL 실행 (return = 1) 실행 row의 수 
				result = pstmt.executeUpdate();
			//result = 1;
			}
			else {
			result = 0;
			}
		}
		else {
			result = -1;
		}
		System.out.println("Complete delte account. code: " + result);
		return result;
		}//deleteMember
	
	// int[] arr = new int[6]; => 고정길이
	// ArrayList -> 가변길이 배열
	//MemberBean[] mb = new MemberBean[?]; (사용불가)
	public ArrayList getMemberList() throws Exception {
		
		ArrayList memberList = new ArrayList();
		
		// DB connecting information 
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		
		// Load Driver
		Class.forName(DRIVER);
		System.out.println("Success Driver load");
		
		// Connection DB
		Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("Success DB connect");
		System.out.println("connection: " + con);
		
		// SQL statement & pstmt 객체
		//String sql = "select * from itwill_member";
		String sql = "select * from itwill_member where id != 'admin'";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// Execute SQL
		ResultSet rs = pstmt.executeQuery();
		
		// Data processing
		while(rs.next()) {
			// (rs -> MemberBean -> ArrayList)
			
			//MemberBean object
			MemberBean memberBean = new MemberBean();
			
			memberBean.setId(rs.getString("id"));
			memberBean.setPass(rs.getString("pass"));
			memberBean.setName(rs.getString("name"));
			memberBean.setAge(rs.getInt("age"));
			memberBean.setGender(rs.getString("gender"));
			memberBean.setEmail(rs.getString("email"));
			memberBean.setRegdate(rs.getTimestamp("regdate"));
			
			// Instance가 다음 차례로 넘어가면 데이터가 날아가니 ArrayList에 저장 
			// memberList[0] = memberB; - 일반배열 
			memberList.add(memberBean); //dynamic array
		}//while
		
		System.out.println("DB: Complete save account list");
		System.out.println("DB: " + memberList.size());// 배열의 갯수 

	
		return memberList;
	}//getMemberList
	
	// Login checking method 
	public int idCheck(MemberBean memberB) throws Exception {
		
		int result = -1; // 로그인 처리 결과 저장 (1(login success), 0(incorrect password), -1(incorrect id))
		
		// DB information
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		
		// Load drive
		Class.forName(DRIVER);
		System.out.println("DB: Complete dirver load");
		
		// connect DB
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB: Complete connection.");
		
		// SQL statement & pstmt object
		String sql = "select pass from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// ? value 
		pstmt.setString(1, memberB.getId());		
		
		// execute SQL 
		ResultSet rs = pstmt.executeQuery();
		
		// Data processing 
		if(rs.next()) {
			// compare password with DB 
			result = 1;
		}
		else {
			result = 0;
		}
		return result;
	}
	// Password checking method 
		public int pwCheck(MemberBean memberB) throws Exception {
			
			int result = -1; // 로그인 처리 결과 저장 (1(login success), 0(incorrect password), -1(incorrect id))
			
			// DB information
			final String DRIVER = "com.mysql.cj.jdbc.Driver";
			final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
			final String DBID = "root";
			final String DBPW = "Dlstjd1915";
			
			// Load drive
			Class.forName(DRIVER);
			System.out.println("DB: Complete dirver load");
			
			// connect DB
			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("DB: Complete connection.");
			
			// SQL statement & pstmt object
			String sql = "select id from itwill_member where pass=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// ? value 
			pstmt.setString(1, memberB.getPass());		
			
			// execute SQL 
			ResultSet rs = pstmt.executeQuery();
			
			// Data processing 
			if(rs.next()) {
				// compare id with DB 
				result = 1;
			}
			else {
				result = 0;
			}
			return result;
		}
		
		public int emailCheck(MemberBean memberB) throws Exception {
		    int result = -1; // Login result storage (1: email exists, 0: email does not exist, -1: error)

		    // DB information
		    final String DRIVER = "com.mysql.cj.jdbc.Driver";
		    final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		    final String DBID = "root";
		    final String DBPW = "Dlstjd1915";

		    // Load driver
		    Class.forName(DRIVER);
		    System.out.println("DB: Complete driver load");

		    try (Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		         PreparedStatement pstmt = con.prepareStatement("SELECT id FROM itwill_member WHERE email = ?")) {

		        // Set parameter
		        pstmt.setString(1, memberB.getEmail()); // Trim the email to avoid issues with spaces

		        // Execute SQL
		        ResultSet rs = pstmt.executeQuery();

		        // Data processing
		        if (rs.next()) {
		            result = 1; // Email exists
		        } else {
		            result = 0; // Email does not exist
		        }
		    } catch (SQLException e) {
		        System.err.println("Database error: " + e.getMessage());
		        // Handle exception (you can also log this exception using a logger)
		        result = -1; // Indicate an error occurred
		    }

		    return result;
		}
}
