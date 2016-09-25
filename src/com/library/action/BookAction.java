package com.library.action;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sun.invoke.empty.Empty;

import com.library.bean.Book;
import com.library.dao.BookDAO;
import com.mysql.jdbc.Field;

@Controller
public class BookAction {
	@Autowired
	BookDAO bookDAO;
/*	@Autowired
	Book book;*/

	@RequestMapping(value="/findBookByID.do", method=RequestMethod.GET)
	public ModelAndView findBookByID(@RequestParam(value="queryInput") Integer bookID) throws JSONException {
/*		Book book =  bookDAO.findBookByID(bookID);
		return JSONUtil.serialize(book);*/
		Book book =  bookDAO.findBookByID(bookID);
		/*		String imgPath = book.getImgPath();
		book.setImgPath(imgPath.substring(0, imgPath.length()-4));
		System.out.println(book.getImgPath());*/
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("book", book);
		modelAndView.setViewName("showBook");
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findBooksByName.do", method=RequestMethod.GET)
	public String findBooksByName(HttpServletRequest req, @RequestParam("queryInput") String bookName) throws JSONException{
		List<Book> bookList = (List<Book>) bookDAO.findBooksByName(bookName);
		req.setAttribute("bookList", JSONUtil.serialize(bookList));
//		System.out.println(req.getAttribute("bookList"));
		return "bookList";
	}
/*	public String findBooksByName(HttpServletRequest req, @RequestParam("queryInput") String bookName) throws JSONException{
		List<?> bookList = bookDAO.findBooksByName(bookName);
		return JSONUtil.serialize(bookList);
	}*/
	
	@RequestMapping(value="/addOneBook.do", method=RequestMethod.POST)
//	public int addOneBook(HttpServletRequest req, @RequestParam("newBook")Object newBook){
	public String addOneBook(HttpServletRequest req, Model model, @ModelAttribute(value="newBook") Book newBook, @RequestParam(value="bookImg", required=false, defaultValue="/upload/example.png")MultipartFile bookImg){
//	public int addOneBook(HttpServletRequest req, @RequestParam Map<String, String> newBook){
//	public int addOneBook(HttpServletRequest req){
		//System.out.println(newBook.getBookAuthor());//normal right here
/*		Book book =  new Book();
		book.setBookName(newBook.getBookName());
		book.setBookAuthor(newBook.getBookAuthor());
		book.setCount(Integer.valueOf(newBook.getCount()));
		book.setSaveDate(new Date(new java.util.Date().getTime()));*/
		newBook.setSaveDate(new Date(new java.util.Date().getTime()));
		if (!bookImg.isEmpty()) {
			try {
				String imgPath = req.getSession().getServletContext().getRealPath("/upload/"+bookImg.getOriginalFilename());
				File imgFile = new File(imgPath);
				if (!imgFile.getParentFile().exists()) {
					imgFile.getParentFile().mkdirs();
				}
				bookImg.transferTo(imgFile);
				newBook.setImgPath("/Library/upload/"+bookImg.getOriginalFilename());
//				return "redirect:addOneBook.jsp";
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else {
			newBook.setImgPath(req.getSession().getServletContext().getRealPath("/upload/example.png"));
		}
		if(bookDAO.addOneBook(newBook)==1){
			model.addAttribute("message", "success");
		} else {
			model.addAttribute("message", "fault");
		}
		return "addOneBook";
/*		book.setBookName("javascript");
		book.setBookAuthor("bob");
		book.setCount(3);
		book.setSaveDate(new Date(new java.util.Date().getTime()));*/
	}
	
	@RequestMapping("/deleteBook.do")
	@ResponseBody
	public String deleteBook(@RequestParam(value="bID")Integer bID) throws JSONException{
		if (bookDAO.deleteBook(bID)==1) {
			return JSONUtil.serialize(1);
		} else {
			return JSONUtil.serialize(0);
		}
	}
}
