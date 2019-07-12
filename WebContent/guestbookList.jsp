<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		String query = "select * from guestbook_message order by message_id desc";

		String url = "jdbc:apache:commons:dbcp:guestbook";

		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(url);
		// 3. Statement 생성
		stmt = conn.createStatement();

		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);

		// 5. 쿼리 실행 결과 출력
		while (rs.next()) {
%>
<div id="message">
	<div id="num"><%=rs.getString("message_id")%></div>
	<div id="title"><%=rs.getString("guest_name")%></div>
	<div id="content"><%=rs.getString("message")%></div>
</div>
<hr>
<%
	}
	} catch (SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException ex) {
			}

		// 7. 커넥션 종료
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>