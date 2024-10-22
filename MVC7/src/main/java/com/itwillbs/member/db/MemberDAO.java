package com.itwillbs.member.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * DAO(Data Access Object): 데이터 처리 객체
 * 
 * -> DB(mysql) 사용되는 정보를 처리하는 객체 -> DB관련 동작 모두를 실행
 * 
 * 
 */
public class MemberDAO {

	// 공통변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// DB connecting information - getConnection()
	public Connection getConnection() throws Exception {

		// DB information
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";

		// Load drive
		Class.forName(DRIVER);
		System.out.println("DAO: Complete driver load");

		// connect DB
		con = DriverManager.getConnection(DBURL, DBID, DBPW);

		return con;

	}// getConnection()

	// DB 자원해체 - closeDB()
	public void closeDB() {
		// 예외 여부와 상관없이 반드시 실행해야하는 코드
		// -> 자원해제
		try { // f2 + click // close method 자체가 예외처리를 필요로 함
			if (rs != null)
				rs.close(); // {} 생략
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAO: 자원해체 완료!");
	} // closeDB()

	// 회원정보 가입 - insertMember(dto)
	public void insertMember(MemberDTO dto) throws SQLException {
		System.out.println("DAO: inserMember(MemberDTO dto) 실행");

		try {
			// Load driver
			// connect DB
			con = getConnection();

			// SQL statement & pstmt object
			sql = "insert into itwill_member (id, pass, name, age, gender, email, regdate) values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setInt(4, dto.getAge());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getEmail());
			pstmt.setTimestamp(7, dto.getRegdate());

			// execute SQL
			pstmt.executeUpdate();

			System.out.println("DAO: Complete create account");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

	} // inserMember(dto)

	// 아이디 여부 체크 - idCheck(dto)
	public int idCheck(MemberDTO dto) {
		int result = -1; // -1, 0, 1

		try {
			// 1. Connect DB
			con = getConnection();
			// SQL statement (select) & pstmt 객체
			sql = "select pass from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			// SQL 실행
			rs = pstmt.executeQuery();
			// 데이터 처리 -> 로그인 판단 결과 리턴
			if (rs.next()) {
				// Check id exist
				result = 1;
			} else {
				// No Id
				result = -1;
			}
			System.out.println("DAO: 아이디 체크 완료(" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	} // 아이디 여부 체크 - idCheck(dto)

	// 로그인 여부 체크 - loginMember(dto)
	public int loginMember(MemberDTO dto) {
		int result = -1; // -1, 0, 1

		try {
			// 1. Connect DB
			con = getConnection();
			// SQL statement (select) & pstmt 객체
			sql = "select pass from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			// SQL 실행
			rs = pstmt.executeQuery();
			// 데이터 처리 -> 로그인 판단 결과 리턴
			if (rs.next()) {
				if (dto.getPass().equals(rs.getString("pass"))) {
					// 로그인 성공
					result = 1;
				} else {
					// 비민번호 오류
					result = 0;
				}
			} else {
				// 회원정보 없음
				result = -1;
			}

			System.out.println("DAO: 로그인 체크 완료(" + result + ")");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 여부와 상관없이 반드시 실행해야하는 코드
			// -> 자원해제
			try { // f2 + click
				if (rs != null)
					rs.close(); // {} 생략
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	} // 로그인 여부 체크 - loginMember(dto)

	// 특정 사용자 정보 조회 - getMember(id)
	public MemberDTO getMember(String id) {

		// 결과를 저장하는 객체
		MemberDTO dto = null;

		try {
			// 1.2. Connect DB
			con = getConnection();

			// 3. SQL 구문(select) & pstmt 객체
			sql = "select * from itwill_member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			// 4. SQL 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// sql 구문 실행결과가 있을 때, 정보를 DTO에 저장
				dto = new MemberDTO();

				// rs -> dto저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));
			}
			System.out.println("DAO: 회원정보 저장 완료");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}

		//
		return dto;
	}// 특정 사용자 정보 조회 - getMember(id)

	// 회원정보 수정 - updateMember(dto)
	public int updateMember(MemberDTO dto) {
		int result = -1;

		try {
			// Connect DB
			con = getConnection();

			// SQL statement(select) & pstmt 객체
			sql = "select pass from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());

			// SQL 실행
			rs = pstmt.executeQuery();

			// 데이터 처리
			if (rs.next()) {
				if (dto.getPass().equals(rs.getString("pass"))) {
					// SQL statement(update) & pstmt 객체
					sql = "update itwill_member set name=?, gender=?, age=? where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getGender());
					pstmt.setInt(3, dto.getAge());
					pstmt.setString(4, dto.getId());

					// SQL 실행
					result = pstmt.executeUpdate();
				} else {
					// 비밀번호 오류
					result = 0;
				}
			} else {
				// 비회원(수정불가)
				result = -1;
			}
			System.out.println("DAO: 회원정보 수정 완료!(" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}// 회원정보 수정 - updateMember(dto)

	// 회원정보 삭제 = deleteMember
	public int deleteMember(MemberDTO dto) {
		int result = -1;

		try {
			// Connect DB
			con = getConnection();

			// SQL statement(select) & pstmt 객체
			sql = "select pass from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());

			// SQL 실행
			rs = pstmt.executeQuery();

			// 데이터 처리
			if (rs.next()) {
				if (dto.getPass().equals(rs.getString("pass"))) {
					// SQL statement(update) & pstmt 객체
					sql = "delete from itwill_member where id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getId());

					// SQL 실행
					result = pstmt.executeUpdate();
				} else {
					// 비밀번호 오류
					result = 0;
				}
			} else {
				// 비회원(수정불가)
				result = -1;
			}
			System.out.println("DAO: 회원정보 삭제 완료!(" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;

	}// 회원정보 삭제 = deleteMember

	// 회원정보 목록 - getMemberList()
	public ArrayList getMemberList() {

		// Dynamic Array 생성
		ArrayList memberList = new ArrayList();

		try {
			// 1.2. Connect DB
			con = getConnection();

			// 3. SQL 구문(select) & pstmt 객체
			sql = "select * from itwill_member";
			pstmt = con.prepareStatement(sql);

			// 4. SQL 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			while (rs.next()) {
				// sql 구문 실행결과가 있을 때, 정보를 DTO에 저장
				MemberDTO dto = new MemberDTO();

				// rs -> dto저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));

				memberList.add(dto);

			} // while(rs.next)
			System.out.println("DAO: 회원목록 " + memberList.size() + "개 조회 완료");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return memberList;
	}// 회원정보 목록 - getMemberList()

}
