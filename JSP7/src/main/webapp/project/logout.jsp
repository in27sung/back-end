<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Invalidate the session to log out
    session.invalidate();
%>
	<script type="text/javascript">
		alert("Logout");
		location.href="main.jsp";
	</script>


