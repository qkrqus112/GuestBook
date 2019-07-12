<%@page import="kr.mycom.dao.MessageVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.mycom.dao.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>

<%
	Connection conn = null;

	try {
		String url = "jdbc:apache:commons:dbcp:guestbook";
		conn = DriverManager.getConnection(url);

		MessageDao dao = new MessageDao();
		ArrayList<MessageVo> arr = dao.selectAll(conn);

		for (MessageVo vo : arr) {
			out.write("<h2>" + vo + "</h2>");
		}

	} finally {
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>