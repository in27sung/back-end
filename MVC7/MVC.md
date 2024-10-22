MVC.txt

p556~560
model1 방식
    -> 기존 개발방식, jsp코드를 사용해서 정보(DB)접근, 출력 
    => 화면,로직을 병행해서 개발X
 
MVC (model2방식 개발)
   -> 새로운 개발방식, 화면과 처리로직을 분리해서 개발 (연결도구)
   => Model View Controller 패턴
   
   Model(POJO) : 비지니스 로직, 처리하는 코드/ ~pro.jsp동작, DB연결처리 => JAVA파일
   Plain Old Java Object 
   View : 화면 처리코드 / ~form.jsp, 출력페이지 => JSP파일
   Controller : 비지니스 로직과 화면을 연결하는 동작 => Servlet 파일

  => '분업' => '관심사의 분리'	=>  좋은코드, 프로젝트
  

 * MVC 패턴의 실행
 
    (model1)
 	사용자의 요청 <=> JSP  <=> DB
 	
 	(model2/MVC)
 	사용자의 => web.xml => Controller <=> Model   <=>  DB
 	   요청               (Servlet)      (Java)
 	                //
 	             View     
 	             (Jsp)
 	             
 	(model2/MVC)
 	사용자의  => web.xml  => FrontController <=>  Controller   <=> Model   <=>  DB
 	요청                   (Servlet)                            (Java)
 	                //
 	             View     
 	             (Jsp)
 	             
 	             
 	* 게시판 Board - CRUD 만들기
 	
 	- 게시판 글쓰기
 	- 게시판 목록(리스트) + 페이징처리
 	- 특정 게시판 글 읽기 (본문내용보기)
 	- 게시판 정보 수정
 	- 게시판 정보 삭제
 	- 답글 쓰기
 	- 첨부파일 업로드/다운로드
 	
 	
 	  CREATE TABLE `jspdb`.`itwill_board` (
  `bno` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `pass` VARCHAR(50) NOT NULL,
  `subject` VARCHAR(500) NOT NULL,
  `content` VARCHAR(5000) NULL,
  `readcount` INT NULL,
  `re_ref` INT NULL,
  `re_lev` INT NULL,
  `re_seq` INT NULL,
  `date` DATE NULL,
  `ip` VARCHAR(45) NULL,
  `file` VARCHAR(200) NULL,
  PRIMARY KEY (`bno`));
 	             
* IPv6 => IPv4 형태로 변경 	
  프로젝트 우클릭>run as >run configurations
   > tomcat / Arguments 메뉴 / VM arguments 에 작성

   -Djava.net.preferIPv4Stack=true


* 커넥션풀 (CP, Connection Pool)
  : 데이터베이스와 연결된 커넥션정보를 미리 생성하고 pool속에 저장,
    필요 할때마다 pool에 접근해서 연결객체를 하나씩 사용하고 반납
    (만약에 연결객체가 없을때는 연결반납을 기다린다. 
     일정시점(시간)지나면, 새로운 연결객체를 생성) 
    =>웹 개발시 필수 작업
    (기존방식 - 필요할때마다 디비 연결, 해제 => 비효율적)


   /WEB-INF/lib 폴더에 가져오기
	commons-collections4-4.5.0-M2.jar
   	https://commons.apache.org/collections/download_collections.cgi
   	
   	commons-pool2-2.12.0.jar
   	https://mvnrepository.com/artifact/org.apache.commons/commons-pool2/2.12.0
   	
   	commons-dbcp2-2.12.0.jar
   	https://commons.apache.org/proper/commons-dbcp/download_dbcp.cgi
   
   context.xml 파일 => 디비연결 정보를 저장(1회 저장)
   <Context>   프로젝트 정보
		<Resource              특정 데이터 
			name = "jdbc/mvc" 		데이터의 이름
			auth = "Container" 		데이터의 관리자  Container(서버tomcat)
			type = "javax.sql.DataSource" 	데이터를 자바코드로 사용할때 데이터
			driverClassName = "com.mysql.cj.jdbc.Driver"   드라이버주소
			url ="jdbc:mysql://localhost:3306/jspdb"		디비주소
			username = "root" 		아이디
			password = "1234" 		비밀번호
			maxWait = "5000" 		커넥션 대기시간 5초
			maxActive = "8"			동시에 사용가능한 커넥션 개수
		/>
	</Context>


  * 게시판 답글 처리로직(알고리즘)
  
  re_ref : 답글의 그룹번호, 일반글일때 글번호 동일(bno==re_ref)
                            답글일때 원글의 re_ref값과 동일
  re_lev : 답글의 레벨값(들여쓰기), 일반글일때  0 
                                     답글일때 원글의 re_lev + 1
  re_seq : 답글의 순서값,  일반글일때 0
                           답글일때 원글의 re_seq + 1
                           
  
  bno	subject			re_ref		re_lev		re_seq
  ------------------------------------------------------                           
   1     일반글1 		1			0			0
   2	 일반글2		2			0			0	                  
   3 	 일반글3		3			0			0
   4 	 답3-1			3			1			1
   5	 답3-2			3			1			1
   6 	 답3-1-1		3			2			2


  [order by re_ref desc, re_seq asc] 
	* 만약에 ref값이 같으면서 seq값이 같을때 나머지 seq + 1
  bno	subject			re_ref		re_lev		re_seq
  ------------------------------------------------------
  3		일반글3			3			0			0	
  7		>답3-2			3			1			1	
 10		>>답3-2-2		3			2			2		
  8		>>답3-2-1		3			2			2+1=3
  4		>답3-1			3			1			1+1=2+1=3+1=4
  5		>>답3-1-1		3			2			2+1=3+1=4+1=5
  2		일반글2			2			0			0
  6		>답2-1			2			1			1	
  1		일반글1			1			0			0
  9		일반글4			9			0			0	


  *  파일 업로드(p305)
    
     [cos.jar] 
	
	http://www.servlets.com
    https://mvnrepository.com/artifact/servlets.com/cos/05Nov2002



폴더위치 : D:\Shared\workspace_jsp7\MVC7\src\main\webapp\upload


realPath : D:\Shared\workspace_jsp7\.metadata\.plugins
             \org.eclipse.wst.server.core\tmp0\wtpwebapps\MVC7\upload


	MultipartRequest multi = 
		            new MultipartRequest(
		            		request, 
		            		realPath, // 파일저장위치
		            		maxSize, // 파일저장 크기
		            		"UTF-8", // 인코딩
		            		new DefaultFileRenamePolicy() // 중복파일 이름을 처리
		            		);







