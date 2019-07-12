package kr.mycom.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

//DB CRUD연산 전담클래스
public class MessageDao {

	public MessageDao() {
	}

	public ArrayList<MessageVo> selectAll(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from guestbook_message";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			ArrayList<MessageVo> list = new ArrayList<MessageVo>();

			while (rs.next()) {
				MessageVo vo = new MessageVo();
				vo.setMsgid(rs.getInt("message_id"));
				vo.setPw(rs.getString("password"));
				vo.setWriter(rs.getString("guest_name"));
				vo.setContent(rs.getString("message"));
				if (vo != null) {
					list.add(vo);
				} else {
					System.out.println("list...");
				}

			} // while
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e) {
					;
				}
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
					;
				}
		}
		return null;

	}

	public void selectOne() {
		;
	}

	public void insert() {
		;
	}

	public void delete() {
		;
	}

	public void update() {
		;
	}
};
