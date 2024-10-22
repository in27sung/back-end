package com.itwillbs.board.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.member.db.MemberDTO;

/**
 * itwill_board 테이블에 대한 정보처리 객체 
 */
public class BoardDAO {

	//공통 변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// DB connecting information - getConnectionX()
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

	}// getConnectionX()
	
	// DB connecting information - getConnection()
	public Connection getConnectionX() throws Exception {
		// 커넥션 풀을 사용한 디비 연결
		// 연결 정보 - /META-INF/context.xml
		// JNDI(Java Naming and Directory Interface)
		// : 특정 요소(폴더)에 접근가능하도록 제공하는 기능(API)
		
		// 프로젝트 정보에 접근 
		Context initCTX = new InitialContext(); // UpCasting
		
		// 프로젝트에서 디비정보에 접근 
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/mvc");
		
		// 1.2. Connect DB
		con = ds.getConnection();
		System.out.println("DAO: Complete DB Connection");
		
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
	
	// 글쓰기 동작 - createBoard()
	public void createBoard(BoardDTO dto) {
		int bno = 0;
		try {
			// DB 연결 
			con = getConnection();
			
			// 글번호 bno 계산 - max(bno)
			
			// SQL Statement & pstmt object
			sql = "select max(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			
			// sql execute 
			rs = pstmt.executeQuery();	
			// Data process (데이터 처리)
			if(rs.next()) { // 데이터가 있을 때(워크벤츠 실행, 화살표-true/원-false)
				// 기존 글번호 + 1
				//bno = rs.getInt("max(bno)") + 1; Overloading (String)
				bno = rs.getInt(1) + 1; //(int)
				// rs.getInt() => SQL null값을 가지고 있을 때 0을 리턴 
			} 
			
//			else {
//				// 글정보 없음, 즉 글번호는 1 
//				bno = 1;
//			}
			
			System.out.println("DAO: bno = " + bno);
			
			// 글쓰기 동작(insert)----------------------------------
			
			// SQL Statement & pstmt object
			sql = "insert into itwill_board (bno, name, pass, subject, content, "
					+ "readcount, re_ref, re_lev, re_seq, date, ip, file) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			 
			pstmt.setInt(1, bno);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, 0); //dto.getReadcount(): 신규글 조회수는 0
			pstmt.setInt(7, bno); // re_ref = bno (일반글 일때)
			pstmt.setInt(8, 0); // re_lev = 0 (일반글 일때)
			pstmt.setInt(9, 0); // re_seq = 0 (일반글 일때)
			
			pstmt.setString(10, dto.getIp());
			pstmt.setString(11, dto.getFile());
			
			// Execute SQL
			pstmt.executeUpdate();
			
			System.out.println("DAO: " + bno + "번째글 작성 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	} // 글쓰기 동작 - createBoard()
	
	// 게시판 글 개수 조회 - getBoardCount()
	public int getBoardCount() {
		int count = 0;
		
		try {
			// 디비연결 (커넥션풀)
			con = getConnection();
			
			// SQL Statement(select) & pstmt 객체 생성 
			sql = "select count(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			
			// SQL 실행
			rs = pstmt.executeQuery();
			
			// Data processing 
			if(rs.next()) {
				// 개수 정보를 저장 
//				count = rs.getInt("count(bno)");
				count = rs.getInt(1);
			}
			System.out.println("DAO: 저장된 글의 갯수(" + count + "개)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}// 게시판 글 개수 조회 - getBoardCount()
	
	// 게시판 전체 목록 조회 - getBoardList()
	public ArrayList getBoardList() {
		
		ArrayList boardList = new ArrayList();
		try {
			// Connect DB
			con = getConnection();
			
			// SQL statement & pstmt object 
			sql = "select * from itwill_board order by bno desc limit 0,5"; // limit 시작지점(row), 갯수
			pstmt = con.prepareStatement(sql);
			
			// execute SQL
			rs = pstmt.executeQuery();
			
			// Process Data(전체목록 저장)
			while(rs.next()) {
				// rs -> DTO -> List
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setReadcount(rs.getInt(6));
				dto.setRe_ref(rs.getInt(7));
				dto.setRe_lev(rs.getInt(8));
				dto.setRe_seq(rs.getInt(9));
				dto.setDate(rs.getDate(10));
				dto.setIp(rs.getString(11));
				dto.setFile(rs.getString(12));
				
				// dto -> list
				boardList.add(dto);
				
			}// while
			
			System.out.println("DAO: 게시판 글목록 저장완료");
			System.out.println("DAO: 글 개수: " + boardList.size() + "개");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		
		return boardList;
	}// 게시판 전체 목록 조회 - getBoardList()
	
	// 게시판 전체 목록 조회 - getBoardList(int startRow, int pageSize)
	public ArrayList getBoardList(int startRow, int pageSize) {
		
		ArrayList boardList = new ArrayList();
		try {
			// Connect DB
			con = getConnection();
			
			// SQL statement & pstmt object 
//			sql = "select * from itwill_board order by bno desc limit ?,?"; // limit 시작지점(row), 갯수
			sql = "select * from itwill_board order by re_ref desc, re_seq asc limit ?,?"; // limit 시작지점(row), 갯수
			pstmt = con.prepareStatement(sql);
			
			// value of ?
			pstmt.setInt(1, startRow - 1); //시작 위치 - 1 (index start from 0)
			pstmt.setInt(2, pageSize); //갯수
			
			// execute SQL
			rs = pstmt.executeQuery();
			
			// Process Data(전체목록 저장)
			while(rs.next()) {
				// rs -> DTO -> List
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setReadcount(rs.getInt(6));
				dto.setRe_ref(rs.getInt(7));
				dto.setRe_lev(rs.getInt(8));
				dto.setRe_seq(rs.getInt(9));
				dto.setDate(rs.getDate(10));
				dto.setIp(rs.getString(11));
				dto.setFile(rs.getString(12));
				
				// dto -> list
				boardList.add(dto);
				
			}// while
			
			System.out.println("DAO: 게시판 글목록 저장완료");
			System.out.println("DAO: 글 개수: " + boardList.size() + "개");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return boardList;
	}// 게시판 전체 목록 조회 - getBoardList(int startRow, int pageSize)
	
	// 요청 게시판 글의 조회수 1증가 
	public void increaseReadCount(int bno) {
		
		try {
			// Connect DB
			con = getConnection();
			
			// SQL statement(update) & pstmt object
			sql = "update itwill_board set readcount=readcount+1 where bno = ?";
			pstmt = con.prepareStatement(sql);
			
			// value of ?
			pstmt.setInt(1, bno);
			
			// Execute SQL 
			pstmt.executeUpdate();
			
			System.out.println("DAO: " + bno + "번글 조회수 1증가 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

	}// 요청 게시판 글의 조회수 1증가 
	
	// 요청 글 하나의 모든정보를 조회  getBoard(bno)
	public BoardDTO getBoard(int bno) {
		BoardDTO dto = null;
		try {
			// Connection DB
			con = getConnection();
			
			// SQL statement & pstmt object
			sql = "select * from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);

			// ? value 
			pstmt.setInt(1, bno);
			
			// execute SQL
			rs = pstmt.executeQuery();
			
			// Data processing
			if(rs.next()) {
				// rs -> dto에 저장 
				dto = new BoardDTO();
				dto.setBno(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setReadcount(rs.getInt(6));
				dto.setRe_ref(rs.getInt(7));
				dto.setRe_lev(rs.getInt(8));
				dto.setRe_seq(rs.getInt(9));
				dto.setDate(rs.getDate(10));
				dto.setIp(rs.getString(11));
				dto.setFile(rs.getString(12));
			}// if
			System.out.println("DAO: 요청글 정보 조회 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;

	}// 요청 글 하나의 모든정보를 조회  getBoard(bno)
	
	// 게시판 글 수정 - updateBoard(dto)
	public int updateBoard(BoardDTO dto) {
		int result = -1;
		
		try {
			// Connect DB
			con = getConnection();
			
			// SQL statement(select) & pstmt object
			sql = "select pass from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			
			//execute SQL 
			rs = pstmt.executeQuery();
			
			// Data process 
			if (rs.next()) {
				if (dto.getPass().equals(rs.getString("pass"))) {
					// SQL statement(update) & pstmt 객체
					sql = "update itwill_board set subject=?, content=? where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getSubject());
					pstmt.setString(2, dto.getContent());
					pstmt.setInt(3, dto.getBno());

					// SQL 실행
					result = pstmt.executeUpdate(); // result = 1
				} else {
					// 비밀번호 오류
					result = 0;
				}
			} else {
				result = -1; // 게시판 글 없음 
			}
			System.out.println("DAO: 글 정보 수정 완료("+result+")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}// 게시판 글 수정 - updateBoard(dto)
	
	// 게시판 글 삭제 = deleteBoard(MemberDTO dto)
	public int deleteBoard(BoardDTO dto) {
		int result = -1;
		
		try {
			con = getConnection();
			
			sql = "select pass from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			
			// SQL 실행 
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if (rs.next()) {
				if (dto.getPass().equals(rs.getString("pass"))) {
					// SQL statement(delete) & pstmt 객체
					sql = "delete from itwill_board where bno = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, dto.getBno());

					// SQL 실행
					result = pstmt.executeUpdate();
				} else {
					// 비밀번호 오류
					result = 0;
				}
			} else {
				// 글정보 없음
				result = -1;
			}
			System.out.println("DAO: 요청글 삭제 완료!(" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}// 게시판 글 삭제 = deleteBoard(MemberDTO dto)
	
	// 게시판 답글작성 reInsertBoard(BoardDTO dto)
	public void reInsertBoard(BoardDTO dto) {
		int bno = 0;
		try {
			// Connect DB
			con = getConnection();
			
			// SQL statement & pstmt object
			/****************************1)bno 계산하기************************************/
			sql = "select max(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//bno = rs.getInt("max(bno)") + 1;
				bno = rs.getInt(1) + 1;
			}
			System.out.println("DAO: 답글 번호: " + bno);
			/****************************1)bno 계산하기************************************/
			
			/****************************2)re_seq값 update*******************************/
			// 답글의 정보가 같은그룹(re_ref)이면서, 기존의 sequence 값보다 큰 값이 있을때 
			// 해당하는 모든 re_seq 값을 1씩 증가 
			sql = "update itwill_board set re_seq = re_seq + 1 where re_ref = ? and re_seq > ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getRe_ref()); // 메인글의 re_ref
			pstmt.setInt(2, dto.getRe_seq()); // 메인글의 re_seq 
			
			int updateCheck = pstmt.executeUpdate();
			
			if(updateCheck > 0) {
				System.out.println("DAO: 답글 순서 재배치 완료!");
			}
			/****************************2)re_seq값 update*******************************/
			
			/****************************3)답글 쓰기***************************************/
			// SQL Statement & pstmt object
			sql = "insert into itwill_board (bno, name, pass, subject, content, "
					+ "readcount, re_ref, re_lev, re_seq, date, ip, file) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			 
			pstmt.setInt(1, bno);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, 0); //dto.getReadcount(): 신규글 조회수는 0
			pstmt.setInt(7, dto.getRe_ref());// ref : dnjsrmfdml ref
			pstmt.setInt(8, dto.getRe_lev() + 1);
			pstmt.setInt(9, dto.getRe_seq() + 1); 
			
			pstmt.setString(10, dto.getIp());
			pstmt.setString(11, dto.getFile());
			
			pstmt.executeUpdate();
			System.out.println("DAO: 답글쓰기 완료!");
			/****************************3)답글 쓰기***************************************/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		

		

		
	}
	// 게시판 답글작성 reInsertBoard(BoardDTO dto)
	
	// 
	
} // class BoardDAO()
