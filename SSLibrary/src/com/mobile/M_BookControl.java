package com.mobile;

import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Book;
import com.entity.BookLog;
import com.entity.User;
import com.entity.UserBook;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class M_BookControl {
	//book
	@Resource(name = "bookbiz")
	Biz bookbiz;
	@Resource(name = "bookbiz")
	SearchBiz sbookbiz;
	@Resource(name = "userbookbiz")
	Biz userbookbiz;
	@Resource(name = "userbookbiz")
	SearchBiz suserbookbiz;
	@Resource(name = "userbookbiz")
	UpdateAndReturnBiz upreuserbookbiz;
	@Resource(name = "booklogbiz")
	Biz booklogbiz;
	@Resource(name = "booklogbiz")
	SearchBiz sbooklogbiz;
	@Resource(name = "booklogbiz")
	UpdateAndReturnBiz uprebiz;
	//user
	@Resource(name = "userbiz")
	Biz userbiz;

	@RequestMapping("/m_bookmain.do")
	public ModelAndView m_bookmain(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		ArrayList<Object> list = null;
		try {
			list = bookbiz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("booklist", list);
		mv.addObject("m_center", "book/m_search.jsp");
		return mv;
	}

	@RequestMapping("/m_booksearch.do")
	public ModelAndView m_booksearch(String issearch, String category,
			String search) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> resultlist = new ArrayList<Object>();
		ArrayList<Object> sublist1 = new ArrayList<Object>();
		ArrayList<Object> sublist2 = new ArrayList<Object>();

		if (issearch.equals("name")) {
			try {
				list = sbookbiz.getname(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (issearch.equals("writer")) {
			try {
				list = sbookbiz.getwriter(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				list = sbookbiz.getname(search);
				for (Object o : list) {
					sublist1.add(o);
				}
				sublist2 = sbookbiz.getwriter(search);
				for (Object o1 : sublist2) {
					Book b1 = (Book) o1;
					Iterator<Object> it = sublist1.iterator();
					while (it.hasNext()) {
						Book b2 = (Book) it.next();
						if (b1.getId().equals(b2.getId())) {
						} else {
							sublist1.add(o1);
							break;
						}

					}
				}
				list = sublist1;

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		switch (category) {
		case "i":
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("i")) {
					resultlist.add(o);
				}
			}
			break;
		case "n":
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("n")) {
					resultlist.add(o);
				}
			}
			break;
		case "m":
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("m")) {
					resultlist.add(o);
				}
			}
			break;
		default:
			resultlist = list;
			break;
		}
		mv.addObject("booklist", resultlist);
		mv.addObject("m_center", "book/m_search.jsp");
		return mv;
	}
	
	@RequestMapping("/m_bookloglist.do")
	public ModelAndView m_bookloglist(HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId();
		ArrayList<Object> result = new ArrayList<Object>();
		result = sbooklogbiz.getname(uid);
		mv.addObject("booklist", result);
		mv.addObject("m_center", "book/m_list.jsp");
		return mv;
	}

	@RequestMapping("/m_bookdetail.do")
	public ModelAndView m_bookdetail(String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		Object result = null;
		try {
			result = bookbiz.get(id);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("bookdetail", result);
		mv.addObject("m_center", "book/m_detail.jsp");
		return mv;
	}

	@RequestMapping("/m_userbookmodifyimpl.do")
	public ModelAndView m_userbookmodifyimpl(HttpServletRequest request,
			String id) throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId();
		int isqt = 0;
		UserBook book = new UserBook(uid, id);
		UserBook usersbook = (UserBook) userbookbiz.get(book);
		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>();
		int renew_qt = usersbook.getRenew_qt();
		if (renew_qt >= 2) {
			System.out.println("�� ������ �� �����ϴ�.");
			isqt = 1;
		} else {
			userbookbiz.modify(book);
			BookLog blog = new BookLog(id, uid);
			ArrayList<Object> booklog = new ArrayList<Object>();
			booklog = sbooklogbiz.getid(blog);
			for (Object obj : booklog) {
				BookLog logbook = (BookLog) obj;
				BookLog logbook2 = new BookLog(logbook.getId(),
						logbook.getB_id(), logbook.getU_id(),
						usersbook.getRenew_qt());
				uprebiz.logupdate(logbook2);
				System.out.println(logbook2);
			}
			System.out.println("���� �Ϸ�");
			isqt = 2;
		}
		userbooklist = suserbookbiz.getid(uid);
		for (Object obj : userbooklist) {
			UserBook userbook = (UserBook) obj;
			String bid = userbook.getB_id();
			Book book1 = (Book) bookbiz.get(bid);
			String qt = Integer.toString(userbook.getRenew_qt());
			String start = userbook.getStart_date().substring(0, 10);
			String end = userbook.getEnd_date().substring(0, 10);
			String[] info = { bid, book1.getName(), start, end, qt };
			if (userbook.getIsreturn() == "n"
					|| userbook.getIsreturn().equals("n")) {
				booklist.add(info);// array�� ����
			}
		}
		session.setAttribute("booklist", booklist);
		mv.addObject("qt", isqt);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	@RequestMapping("/m_userbookremove.do")
	public ModelAndView m_userbookremove(HttpServletRequest request, String id)
			throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId();
		BookLog blog = new BookLog(id, uid);
		ArrayList<Object> booklog = new ArrayList<Object>();
		booklog = sbooklogbiz.getid(blog);
		for (Object obj : booklog) {
			BookLog logbook = (BookLog) obj;
			BookLog logbook2 = new BookLog(logbook.getId(), logbook.getB_id(),
					logbook.getU_id(), logbook.getReal_date());
			booklogbiz.modify(logbook2);
		}
		int returnqt = 0;
		UserBook userbook = new UserBook(uid, id);
		userbook = (UserBook) userbookbiz.get(userbook);
		UserBook modifyuserbook = new UserBook(uid, id, "y");
		upreuserbookbiz.logreturn(modifyuserbook);
		returnqt = 1;
		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>();
		userbooklist = suserbookbiz.getid(uid);
		for (Object obj : userbooklist) {
			UserBook userbook1 = (UserBook) obj;
			String bid = userbook1.getB_id();
			Book book1 = (Book) bookbiz.get(bid);
			String[] info = { bid, book1.getName(), userbook1.getStart_date(),
					userbook1.getEnd_date() };
			if (userbook1.getIsreturn() == "n"
					|| userbook1.getIsreturn().equals("n")) {
				booklist.add(info);
			}
		}
		Book b = new Book(id);
		sbookbiz.getnum_reply(b);
		System.out.println("ȸ���� �ݳ��߽��ϴ�. �����ڴ� Ȯ�����ּ���.");
		mv.addObject("returnqt", returnqt);
		mv.addObject("booklist", booklist);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	@RequestMapping("/m_userbookregister.do")
	// å �뿩�ϱ�
	public ModelAndView m_userbookregister(HttpServletRequest request, String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId(); // ȸ�� ���̵� ���� ���ǿ���
											// ��������
		User user = null;
		int borrowbook = 0; // å�� ���ȴ��� Ȯ�� ����
		// (0 : �ƹ��ϵ� ���� / 1 : �ߺ� �뿩 �Ұ� / 2 : �������� �뿩�� �� ���� / 3 : �뿩�Ϸ� / 4 : �����ڰ�
		// Ȯ�� ������)
		int overlap = 0; // �뿩�� �ߺ��Ǿ����� ���� (1 : �ߺ��� / 2 : �ߺ� �ȵ�)

		Book upbook; // �������� å ���� �������� ��
		Book upbooknew; // �뿩 ������ �뿩���� �� 1�� ���̱� ���� �־���� �ϴ� å ������Ʈ ����
		int current_qt = 0; // �뿩 ������ å�� ����� �������� ����

		/*
		 * String isreturn = null; // ��ȯ�Ǿ����� ���θ� �˱� ���� ���� (������ Ȯ�� ���ϰ� �� ��å ������)
		 */
		try {
			user = (User) userbiz.get(uid); // ���� ���� ȸ���� �α��� �ߴ��� ȸ�� ���̵� ��������
			System.out.println("���� �α��� �� user  :  " + user.getId());
			System.out.println("�������� å ���̵� : " + id); // ���� �������� �ϴ� å id
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 1. �뿩 �ߺ��� ���
		// �α����� ȸ���� � å���� ���Ⱦ��� �� userbook���� �����´�.(arraylist�� for������ �ֱ�)
		// ���� ������ å ���̵�� ���Ѵ�.(if ������ ��)
		// �ߺ��� å�� �ִٸ� �������� �ʴ´�. (borrowbook =1)

		ArrayList<Object> userbooklist = new ArrayList<Object>(); // ȸ���� ���ȴ� å��
																	// �˱� ���� ����
																	// ����
		try {
			userbooklist = suserbookbiz.getid(uid);// user�� ���� å �ֱ�
			System.out.println("user�� ���� å : " + userbooklist);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		String bid = ""; // ArrayList���� book id ���� ���ؼ� ���� ����

		if (userbooklist.size() == 0) { // �뿩�� �ѹ��� ���� ���
			overlap = 2;
			System.out.println("�ߺ� �ȉ�����");

		} else { // �뿩�� �ѹ��̶� �� ����� ���

			for (Object obj : userbooklist) { // ȸ���� ���� åid��� ���� �뿩�Ϸ��� å id ����
				UserBook userbook = (UserBook) obj;
				bid = userbook.getB_id();// id �̾ƿͼ� �ֱ�
				System.out.println("å id : " + bid);

				if ((bid.equals(id) || bid == id)) {// �뿩�ҷ��� å�� �ߺ��� ���

					if ((userbook.getIsreturn() == "n" || userbook
							.getIsreturn().equals("n"))) {// �����ڰ� Ȯ���� ���
						System.out
								.println("---------------------�̹� �뿩�� å�̶� ���� �� ����---------------------");
						overlap = 1; // �ߺ��� ���
						borrowbook = 1; // �ߺ��뿩 �Ұ�

					} else {// �����ڰ� Ȯ�ξ��� ���
						System.out
								.println("---------------------�����ڰ� ���� Ȯ���� ������---------------------");
						overlap = 1; // �ߺ��� ���
						borrowbook = 4; // �����ڰ� Ȯ�� ������

					}
					try {
						upbook = (Book) bookbiz.get(id);// ���� �������� å�� ������ �����´�.
						mv.addObject("bookdetail", upbook);
						break;
					} catch (Exception e) {
						e.printStackTrace();
					}

				} else {
					overlap = 2; // �ߺ� �� �Ȱ��
				}
			}
			System.out.println("�ߺ� ���� : " + overlap);
		}

		if (overlap == 2) { // �ߺ��� �ȵ� ���
			// 2. �뿩�� å�� ���� ���(�ߺ� �ȵǰ� current_qt = 0)
			// ���� å ���̵𿡼� ���� ������ �����´�.
			// ���� ����(current_qt)�� 0�ΰ��� �뿩�� �� ���ٴ� ǥ�ø� �Ѵ�. (borrowbook =2)

			try {
				upbook = (Book) bookbiz.get(id); // ���� �������� å�� ������ �����´�.
				current_qt = upbook.getCurrent_qt(); // �뿩 ������ �� Ȯ���Ѵ�.

				if (current_qt == 0) { // �뿩 ������ å ������ 0�� ���
					System.out
							.println("---------------------�뿩 ������ å 0---------------------");
					borrowbook = 2;
					try {
						upbook = (Book) bookbiz.get(id);// ���� �������� å�� ������ �����´�.
						mv.addObject("bookdetail", upbook);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else if (current_qt != 0 && bid != id) {// �뿩�� ������ ���
					// 3. �뿩�� ������ ���(�뿩 �ߺ��� �ƴϸ鼭 �뿩�� å�� �ִ� ���)
					// upbooknew�� ������ �Ѱ��� ���� ������Ʈ �Ѵ�.
					// userbook�� booklog�� ����Ѵ�.
					upbooknew = new Book(upbook.getId(), upbook.getName(),
							upbook.getWriter(), upbook.getImg(),
							upbook.getFloor(), upbook.getTotal_qt(),
							upbook.getCurrent_qt() - 1);
					System.out.println("������Ʈ �� book : " + upbooknew);
					bookbiz.modify(upbooknew);
					UserBook book = new UserBook(user.getId(), id);
					userbookbiz.register(book); // userbook�� ���
					System.out.println("userbook ��� : " + book);

					BookLog logbook = new BookLog(id, user.getId()); // booklog��
																		// ���
					booklogbiz.register(logbook);
					System.out.println("userbook�� booklog�� ��� �Ϸ�!!");
					borrowbook = 3;
					Book newbook = (Book) bookbiz.get(upbooknew.getId());
					mv.addObject("bookdetail", newbook);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		mv.addObject("borrowbook", borrowbook);
		mv.addObject("m_center", "book/m_detail.jsp");
		return mv;
	}
}
