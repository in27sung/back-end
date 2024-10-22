<%@page import="com.itwillbs.bean.MemberDB"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up Process</title>
</head>
<body>
    <h1>Sign Up Process</h1>
    <%
    // Set character encoding
    request.setCharacterEncoding("UTF-8");
    %>
    
    <!-- Create MemberBean instance -->
    <jsp:useBean id="memberB" class="com.itwillbs.bean.MemberBean"/>
    
    <!-- Set parameters from request -->
    <jsp:setProperty property="*" name="memberB"/>
    
    <!-- Set registration date -->
    <%
        memberB.setRegdate(new Timestamp(System.currentTimeMillis()));
    %>
    
    <%
    // Create MemberDB object
    MemberDB memberDB = new MemberDB();
    
    // Check if ID or Email already exists
    int idExists = memberDB.idCheck(memberB);
    int emailExists = memberDB.emailCheck(memberB);
    
    if (idExists == 1) {
        // If ID exists, show alert and redirect to the sign-up form with filled details
        String id = URLEncoder.encode(memberB.getId(), "UTF-8");
        String name = URLEncoder.encode(memberB.getName(), "UTF-8");
        String age = URLEncoder.encode(String.valueOf(memberB.getAge()), "UTF-8");
        String gender = URLEncoder.encode(memberB.getGender(), "UTF-8");
        String email = URLEncoder.encode(memberB.getEmail(), "UTF-8");
        %>
        <script>
            alert("ID already exists. Please try again.");
            location.href="insertForm.jsp?name=<%=name%>&age=<%=age%>&gender=<%=gender%>&email=<%=email%>";
        </script>
        <%
    } else if (emailExists == 1) {
        // If Email exists, show alert and redirect to the sign-up form with filled details
        String id = URLEncoder.encode(memberB.getId(), "UTF-8");
        String name = URLEncoder.encode(memberB.getName(), "UTF-8");
        String age = URLEncoder.encode(String.valueOf(memberB.getAge()), "UTF-8");
        String gender = URLEncoder.encode(memberB.getGender(), "UTF-8");
        String email = URLEncoder.encode(memberB.getEmail(), "UTF-8");
        %>
        <script>
            alert("Email already exists. Please try again.");
            location.href = "insertForm.jsp?id=<%=id%>&name=<%=name%>&age=<%=age%>&gender=<%=gender%>";
        </script>
        <%
    } else {
        // If ID and Email are unique, insert the member details
        memberDB.insertMember(memberB);
        %>
        <script>
            alert("Created new account");
            location.href="pwPage.jsp?id=<%=memberB.getId()%>";
        </script>
        <%
    }
    %>
</body>
</html>