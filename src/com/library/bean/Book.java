package com.library.bean;

import java.io.Serializable;
import java.sql.Date;

public class Book implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -793774362674744366L;
	private String bookName;
	private String bookAuthor;
	private int count;
	private Date saveDate;
	private String imgPath;
	
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(Date saveDate) {
		this.saveDate = saveDate;
	}
}
