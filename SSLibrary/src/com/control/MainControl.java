package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserCommand;
import com.entity.Board;
import com.entity.Book;
import com.entity.MessageLog;
import com.entity.User;
import com.entity.UserBook;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class MainControl {
	@Resource(name = "userbiz")
	Biz biz;
	@Resource(name = "userbiz")
	SearchBiz SearchBiz;
	@Resource(name = "userbookbiz")
	SearchBiz userbookbiz;
	@Resource(name = "userseatbiz")
	Biz userseatbiz;
	@Resource(name = "messagelogbiz")
	Biz messagelogbiz;
	@Resource(name = "messagelogbiz")
	SearchBiz messagelogsearchbiz;
	@Resource(name = "bookbiz")
	Biz bookbiz;
	@Resource(name = "boardbiz")
	SearchBiz boardsearchbiz;
	@Resource(name = "seatbiz")
	Biz seatbiz;
	@Resource(name = "seatlogbiz")
	UpdateAndReturnBiz seatlogbiz;

	@RequestMapping("/main.do")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		String ls_name = "";
		String ls_value = "";
		String[] board = { "notice", "free" };
		ArrayList<Object> notice_list = new ArrayList<Object>();
		ArrayList<Object> free_list = new ArrayList<Object>();
		ArrayList<Object> book_list = new ArrayList<Object>();

		// ���� ���� Ȯ��
		Enumeration<String> enum_app = session.getAttributeNames();
		while (enum_app.hasMoreElements()) {
			ls_name = enum_app.nextElement().toString();
			ls_value = session.getAttribute(ls_name).toString();
			System.out.println("���� ���� �̸� :" + ls_name);
			System.out.println("���� ���� �� :" + ls_value);
		}
		int count = 0;
		// ���� �������� �Խ���
		try {
			ArrayList<Object> list = new ArrayList<Object>();
			list = boardsearchbiz.getid(board[0]);

			System.out.println(list);
			for (Object obj : list) {
				Board one_board = (Board) obj;
				notice_list.add(one_board);
				count++;
				if (count == 4)
					break;
			}
			count = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���� ���� �Խ���
		try {
			ArrayList<Object> list = new ArrayList<Object>();
			list = boardsearchbiz.getid(board[1]);
			for (Object obj : list) {
				Board one_board = (Board) obj;
				free_list.add(one_board);
				count++;
				if (count == 4)
					break;
			}
			count = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}

		// å ���� ȭ��
		try {
			ArrayList<Object> list = new ArrayList<Object>();
			list = bookbiz.get();
			for (Object obj : list) {
				Book book = (Book) obj;
				book_list.add(book);
				count++;
				if (count == 5)
					break;
			}
			count = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.setAttribute("top", "top.jsp");
		session.setAttribute("nav", "nav.jsp");
		session.setAttribute("left", "left.jsp");
		session.setAttribute("book", book_list);
		session.setAttribute("free", free_list);
		session.setAttribute("notice", notice_list);
		mv.addObject("center", "center.jsp");

		return mv;
	}

	@RequestMapping("/register.do")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("center", "user/register.jsp");
		return mv;
	}

	@RequestMapping("/registerimpl.do")
	public ModelAndView registerimpl(HttpServletRequest request, UserCommand com) {
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		User user = null;
		String fistimg = "index.jpg";
		if (com.getImg().getOriginalFilename().equals("")) {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), fistimg, com.getEmail(), com.getIsadmin());
		} else {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), com.getImg().getOriginalFilename(),
					com.getEmail(), com.getIsadmin());

			MultipartFile file = com.getImg();
			String dir = "C:/lib/SSLibrary/web/img/user/";
			byte[] data;

			try {
				data = file.getBytes();
				FileOutputStream out = new FileOutputStream(dir
						+ file.getOriginalFilename());
				out.write(data);
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		try {
			biz.register(user);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		session.setAttribute("id", user.getId());
		session.setAttribute("user", user);
		mv.addObject("center", "center.jsp");
		return mv;
	}

	@ResponseBody
	@RequestMapping("/loginimpl.do")
	public String loginimpl(String id, String pwd, HttpServletRequest request) {
		User user = null;

		ArrayList<Object> list = new ArrayList<Object>();
		int msgchecknumber = 0;

		String result = "";

		System.out.println(id + "   " + pwd);
		try {
			user = (User) biz.get(new User(id));
			list = messagelogsearchbiz.getid(new MessageLog(id));
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (user.getIsadmin().equals("d")) {
			// ���� ȸ�� �α��� �Ұ���
		} else {
			if (user != null && (user.getPwd()).equals(pwd)) {
				// ����� �α��� �Ѱ��
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setAttribute("id", id);

				for (Object obj : list) {
					MessageLog log = (MessageLog) obj;
					String read = log.getRead();
					if (read.equals("n")) {
						msgchecknumber += 1;
					}
				}
				session.setAttribute("msgcheck", msgchecknumber);
				result = "loginok";
			} else {
				// �α����� �� �� ���
				result = "loginfail";
			}
		}

		return result;
	}

	@RequestMapping("/del.do")
	public ModelAndView del(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		String id = request.getParameter("id");
		String is = "d";

		try {
			biz.remove(new User(id, is));
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("center", "center.jsp");
		return mv;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main.do";
	}

	@ResponseBody
	@RequestMapping("/idcheck.do")
	public String idcheck(String id) {
		User user = null;
		String result = "";
		try {
			user = (User) biz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (user != null) {
			result = "0";
		} else {
			result = "1";
		}

		return result;
	}

	@RequestMapping("/detail.do")
	public ModelAndView detail(String id) {
		ModelAndView mv = new ModelAndView("main");
		User user = null;
		try {
			user = (User) biz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("user", user);
		mv.addObject("center", "user/detail.jsp");
		return mv;
	}

	@RequestMapping("/modify.do")
	public ModelAndView modify(String id) {
		ModelAndView mv = new ModelAndView("main");
		User user = null;
		try {
			user = (User) biz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("userupdate", user);
		mv.addObject("center", "user/update.jsp");
		return mv;
	}

	@RequestMapping("/modifyimpl.do")
	public ModelAndView modifyimpl(HttpServletRequest request, UserCommand com) {
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		String old_img = request.getParameter("oldimg");
		User user = null;
		System.out.println(com.getIsadmin());
		MultipartFile file = com.getImg();
		String dir = "C:/lib/SSLibrary/web/img/user/";
		String img = file.getOriginalFilename();
		if (img == null || img.equals("")) {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), old_img, com.getEmail(), com.getIsadmin());
		} else {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), com.getImg().getOriginalFilename(),
					com.getEmail(), com.getIsadmin());
			byte[] data;
			try {
				data = file.getBytes();
				FileOutputStream out = new FileOutputStream(dir
						+ file.getOriginalFilename());
				out.write(data);
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		try {
			biz.modify(user);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		System.out.println(user);
		session.setAttribute("user", user);
		mv.addObject("center", "center.jsp");
		return mv;
	}

	@RequestMapping("/msgloglist.do")
	public ModelAndView msgloglist(String id) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> ml = new ArrayList<Object>();
		ArrayList<Object> mlre = new ArrayList<Object>();
		try {
			ml = messagelogsearchbiz.getid(id);
			for (Object ob : ml) {
				MessageLog msg = (MessageLog) ob;
				String text = msg.getText();
				if (text.length() > 10) {
					text = text.substring(0, 10);
					text = text + "...";
				}
				MessageLog msgre = new MessageLog(msg.getId(), msg.getU_id(),
						msg.getS_id(), msg.getSender_id(), text, msg.getRead(),
						msg.getSend_date(), msg.getRead_date());
				mlre.add(msgre);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("messagelog", mlre);
		mv.addObject("center", "messagelog/messagelist.jsp");
		return mv;
	}

	@RequestMapping("/msgdetail.do")
	public ModelAndView msglogdetail(String id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		MessageLog msg = null;
		HttpSession session = request.getSession();
		int number = (int) session.getAttribute("msgcheck");
		ArrayList<Object> list = new ArrayList<Object>();

		try {
			msg = (MessageLog) messagelogbiz.get(id);
			messagelogbiz.modify(id);
			list = messagelogbiz.get();
			for (Object obj : list) {
				MessageLog numbercheck = (MessageLog) obj;
				if (numbercheck.equals(id)) {
					if (numbercheck.getRead().equals("n")) {
						number += 1;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.setAttribute("msgcheck", number);// �޼��� üũ
		mv.addObject("messagelogdetail", msg);
		mv.addObject("center", "messagelog/messagedetail.jsp");

		return mv;
	}

	@RequestMapping("/usinginfo.do")
	public ModelAndView usinginfo(String id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>();

		Object userseat = null;
		HttpSession session = request.getSession();

		try {
			userbooklist = userbookbiz.getid(id);// userbook���� ������
			for (Object obj : userbooklist) {
				UserBook userbook = (UserBook) obj;
				String bid = userbook.getB_id();// id �̾ƿ�
				Book book = (Book) bookbiz.get(bid);// �ϳ��� ã��
				String[] info = { bid, book.getName(),
						userbook.getStart_date(), userbook.getEnd_date() };
				booklist.add(info);// array�� ����
			}
			userseat = userseatbiz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.setAttribute("userseat", userseat);
		session.setAttribute("booklist", booklist);
		mv.addObject("center", "user/usinginfo.jsp");

		return mv;
	}

	@ResponseBody
	@RequestMapping("/resetuser.do")
	public String resetuser() {
		// ȸ�� ���� Ǯ��
		ArrayList<Object> time_list = new ArrayList<Object>();
		try {
			time_list = SearchBiz.getexpired();
			for (Object obj : time_list) {
				User user = (User) obj;
				String userid = user.getId();
				biz.remove(new User(userid, "n"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "1";
	}
}