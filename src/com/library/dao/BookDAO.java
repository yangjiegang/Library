package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.library.bean.Book;

@Repository
public class BookDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<?> findBooksByName(String bookName) {
		String sql = "select * from book where bookName like '%"+bookName+"%'";
		List<?> bookList = jdbcTemplate.queryForList(sql);
//				new Object[] { bookName });
//		System.out.println(bookList);
		return bookList;
	}
	
	public Book findBookByID(Integer bookID){
		final Book book = new Book();
		String sql="select * from book where bID=?";
		jdbcTemplate.query(sql,new Object[]{bookID}, new RowCallbackHandler() {
			@Override
			public void processRow(ResultSet rSet) throws SQLException {
				book.setBookName(rSet.getString("bookName"));
				book.setBookAuthor(rSet.getString("bookAuthor"));
				book.setCount(rSet.getInt("count"));
				book.setSaveDate(rSet.getDate("saveDate"));
				book.setImgPath(rSet.getString("imgPath"));
			}
		});
		return book;
	}
	
	public int addOneBook(final Book book){
		final String sql = "insert into book(bookName,bookAuthor,count,saveDate,imgPath) values(?,?,?,?,?)";
/*		KeyHolder keyHolder = new GeneratedKeyHolder();
		int i=jdbcTemplate.update(new PreparedStatementCreator(){
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, book.getBookName());
				ps.setString(2, book.getBookAuthor());
				ps.setInt(3, book.getCount());
				ps.setDate(4, book.getSaveDate());
				return ps;
			}
		},keyHolder);
		return keyHolder.getKey().intValue();*/
		return jdbcTemplate.update(new PreparedStatementCreator(){
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, book.getBookName());
				ps.setString(2, book.getBookAuthor());
				ps.setInt(3, book.getCount());
				ps.setDate(4, book.getSaveDate());
				ps.setString(5, book.getImgPath());
				return ps;
			}
		});
	}
	
	public Integer updateBook(final Book book){
		final String sql = "UPDATE book SET bookName=?,bookAuthor=?,count=?,saveDate=?imgPath=?";
		return jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, book.getBookName());
				pstmt.setString(2, book.getBookAuthor());
				pstmt.setInt(3, book.getCount());
				pstmt.setDate(4, book.getSaveDate());
				pstmt.setString(5, book.getImgPath());
				return pstmt;
			}
		});
	}
	
	public Integer deleteBook(Integer bID){
		String sql="DELETE FROM book WHERE bID="+bID;
		return jdbcTemplate.update(sql);
	}
}
