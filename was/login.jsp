<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%

String url = "jdbc:mysql://database-1.crpyfzp1l3p7.eu-west-1.rds.amazonaws.com:3306/reca3";
String username = "admin";
String password = "12341234";

// 사용자가 입력한 아이디와 비밀번호
String userNameInput = request.getParameter("userName");
String userPasswordInput = request.getParameter("userPassword");


Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
ArrayList<ArrayList<String>> userList = new ArrayList<>();
try {
    // JDBC 드라이버 로드
    Class.forName("com.mysql.cj.jdbc.Driver");

    // MySQL 데이터베이스와 연결
    conn = DriverManager.getConnection(url, username, password);

    // SQL 쿼리 실행
    stmt = conn.createStatement();  //쿼리 실행
    String sql = "SELECT * FROM  user";
    rs = stmt.executeQuery(sql);   //실행 쿼리 저장 


    while (rs.next()) {
        String userName = rs.getString("userID"); 
        String userPassword = rs.getString("userPW"); 

        //배열에 추가함 
        ArrayList<String> data = new ArrayList<>();
        data.add(userName);
        data.add(userPassword);
        userList.add(data);
    }
} catch (Exception e) {
    e.printStackTrace();
    out.println("<h2>Failed to connect to MySQL database!</h2>");
} finally {
    // 자원 해제
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
}


boolean isAuthenticated = false;

for (int i = 0; i < userList.size(); i++) {
    String userName = userList.get(i).get(0);
    String userPassword = userList.get(i).get(1);

    if (userName.equals(userNameInput) && userPassword.equals(userPasswordInput)) {
        isAuthenticated = true;
        break;
    }
}

if (isAuthenticated) {
    // 인증 성공 시 메인 페이지로 이동
    response.sendRedirect("main.html");
} else {
    // 인증 실패 시 오류 메시지 출력
    response.setContentType("text/html; charset=UTF-8");
    out.println("<script>alert('아이디와 비밀번호를 다시 확인해 주세요.');</script>");
    out.println("<h2>로그인 실패</h2>");
    out.println("<p>아이디와 비밀번호를 다시 확인해 주세요.</p>");
}





%>
