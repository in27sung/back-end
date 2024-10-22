import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.Calendar;
public class ServletTest extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse 
			response) throws IOException{
		response.setContentType("text/html"); //응답 데이터의 마임 타입을 HTML 타입의 데이터로 지정하는 부분
		response.setCharacterEncoding("UTF-8"); //응답 타입의 문자 인코딩 타입을 한글이 제대로 출력되도록 UTF-8(유니코드)로 지정하는 부
		Calendar c=Calendar.getInstance();// Calendar 객체를 생성하여 객체로부터 시, 분, 초 값 생성
		int hour=c.get(Calendar.HOUR_OF_DAY);
		int minute=c.get(Calendar.MINUTE);
		int second=c.get(Calendar.SECOND); 
		PrintWriter out=response.getWriter(); //출력 스트림 생성
		out.write("<HTML><HEAD><TITLE>ServletTest</TITLE></HEAD>"); //HTML타입의 데이터로 출력 
		out.write("<BODY><H1>");
		out.write("현재시각은 ");
		out.write(Integer.toString(hour));
		out.write("시 ");
		out.write(Integer.toString(minute));
		out.write("분 ");
		out.write(Integer.toString(second));
		out.write("초입니다.");
		out.write("</H1></BODY></HTML>");
		out.close();
	}
}
