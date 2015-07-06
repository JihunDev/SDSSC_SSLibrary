package com.mobile;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@Resource(name = "bookbiz")
	Biz bookbiz;
	@Resource(name = "bookbiz")
	SearchBiz sbookbiz;

	@RequestMapping("/m_bookmain.do")
	// ����////////////////////////////////////////////
	public ModelAndView bookmain(HttpServletRequest request) {
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

	@SuppressWarnings("unchecked")
	@ResponseBody
	// �˻��ϱ�////////////////////////////////////////////
	@RequestMapping("/m_booksearch.do")
	public ResponseEntity<String> booksearch(String issearch, String category,
			String search) {
		ResponseEntity<String> returnData = null;

		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/json;charset=EUC-KR");

		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> resultlist = new ArrayList<Object>();
		ArrayList<Object> sublist1 = new ArrayList<Object>();
		ArrayList<Object> sublist2 = new ArrayList<Object>();

		System.out.println(issearch);
		System.out.println(category);
		System.out.println(search);

		if (issearch.equals("name")) { // å���� �˻��� ��
			try {
				list = sbookbiz.getname(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (issearch.equals("writer")) { // �۾��� �˻��� ��
			try {
				list = sbookbiz.getwriter(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { // å����� �۾��� ��ο��� �˻��� ��
			try {
				list = sbookbiz.getname(search);
				for (Object o : list) {
					sublist1.add(o);
				}
				sublist2 = sbookbiz.getwriter(search);
				for (Object o1 : sublist2) {
					Book b1 = (Book) o1;
					for (Object o2 : sublist1) {
						Book b2 = (Book) o2;
						if (b1.getId().equals(b2.getId())) {
						} else {
							sublist1.add(o1);
						}
					}
				}

				list = sublist1;

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		switch (category) { // ī�װ� �з�
		case "i": // ī�װ��� IT�� ���
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("i")) {
					resultlist.add(o);
					System.out.println(resultlist);
				}
			}
			break;
		case "n": // ī�װ��� �Ҽ��� ���
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("n")) {
					resultlist.add(o);
				}
			}
			break;
		case "m": // ī�װ��� ��ȭå�� ���
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("m")) {
					resultlist.add(o);
				}
			}
			break;
		default: // ī�װ� ��ü���� �˻�
			resultlist = list;
			break;
		}

		JSONArray ja = new JSONArray();
		for (Object obj : resultlist) { // resultlist�� jason���� �Ѱ���
			Book book = (Book) obj;
			JSONObject jo = new JSONObject();
			jo.put("bid", book.getId());
			jo.put("name", book.getName());
			jo.put("writer", book.getWriter());
			jo.put("img", book.getImg());
			jo.put("floor", book.getFloor());
			jo.put("total_qt", book.getTotal_qt());
			jo.put("current_qt", book.getCurrent_qt());
			jo.put("reg_date", book.getReg_date());

			ja.add(jo);
		}
		returnData = new ResponseEntity<String>(ja.toJSONString(), header,
				HttpStatus.CREATED // ������ ����� ����� �־��ִ°�
		);
		return returnData;
	}

	// å �����ϱ�
	@RequestMapping("/m_userbookmodifyimpl.do")
	public ModelAndView m_userbookmodifyimpl(HttpServletRequest request,
			String id) throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // ȸ�� ���̵� ���� ���ǿ���
															// ��������
		int isqt = 0;
		UserBook book = new UserBook(uid, id);
		UserBook usersbook = (UserBook) userbookbiz.get(book); // ȸ���� ���ȴ� å�� ����
																// userbook����
																// ��������

		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>(); // �ٽ� usinginfo��
																// �� ����
		int renew_qt = usersbook.getRenew_qt(); // ����Ƚ���� ������� ��������
		if (renew_qt >= 2) { // ������ 2�� �̻��̸�
			System.out.println("�� ������ �� �����ϴ�.");
			isqt = 1;

		} else { // ������ 2�� �̸��̸�
			userbookbiz.modify(book);// ������ å ���� ������Ʈ -> ����Ƚ�� ����, 7�� ����... 2����
										// �Ǿ���...

			// booklog ������Ʈ
			BookLog blog = new BookLog(id, uid);
			ArrayList<Object> booklog = new ArrayList<Object>();
			booklog = sbooklogbiz.getid(blog); // Booklog���� ȸ���� ���ȴ� å�� ������ �����´�.

			for (Object obj : booklog) {// ���� ������ ������ �־��ش�.
				BookLog logbook = (BookLog) obj;
				BookLog logbook2 = new BookLog(logbook.getId(),
						logbook.getB_id(), logbook.getU_id(),
						usersbook.getRenew_qt());
				uprebiz.logupdate(logbook2); // ���� ���� ������Ʈ
				System.out.println(logbook2);

			}

			System.out.println("���� �Ϸ�");
			isqt = 2;
		}

		userbooklist = suserbookbiz.getid(uid);// userbook���� ������(�ٽ� usinginfo��
												// �� ����)
		for (Object obj : userbooklist) {
			UserBook userbook = (UserBook) obj;
			String bid = userbook.getB_id();// id �̾ƿ�
			Book book1 = (Book) bookbiz.get(bid);// �ϳ��� ã��
			String start = userbook.getStart_date().substring(0, 10);
			String end = userbook.getEnd_date().substring(0, 10);
			String[] info = { bid, book1.getName(), start, end };
			// ���� �̿� ������ �ʿ��� �� String �迭�� ����
			booklist.add(info);// array�� ����
		}
		// mv.addObject("booklist",booklist); //�ٲ�� �ٽ� �־���
		session.setAttribute("booklist", booklist);
		mv.addObject("qt", isqt);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	// �ݳ��ϱ� : UserBook�� �ݳ� ���� ����,Log�� �ݳ�ó��
	@RequestMapping("/m_userbookremove.do")
	public ModelAndView m_userbookremove(HttpServletRequest request, String id)
			throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // ȸ�� ���̵� ���� ���ǿ���
															// ��������
		// 1.ȸ���� ���̵�� å ���̵� ������ booklog ���̺� �ݳ������� ������Ʈ �Ѵ�.

		BookLog blog = new BookLog(id, uid);
		ArrayList<Object> booklog = new ArrayList<Object>();
		booklog = sbooklogbiz.getid(blog); // Booklog���� ȸ���� ���ȴ� å�� ������ �����´�.

		for (Object obj : booklog) {// ���� ������ ������ �־��ش�.
			BookLog logbook = (BookLog) obj;
			BookLog logbook2 = new BookLog(logbook.getId(), logbook.getB_id(),
					logbook.getU_id(), logbook.getReal_date());
			booklogbiz.modify(logbook2); // �ݳ� ���� �����ش�. real_date�� ������Ʈ ��
		}

		int returnqt = 0; // �ݳ��ߴ��� ���ߴ���

		// 2. UserBook�� isreturn�� y�� �ٲ۴�.
		UserBook userbook = new UserBook(uid, id);
		userbook = (UserBook) userbookbiz.get(userbook);
		UserBook modifyuserbook = new UserBook(uid, id, "y");
		upreuserbookbiz.logreturn(modifyuserbook); // y�� ����

		returnqt = 1;

		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>(); // �ٽ� usinginfo��
																// �� ����
		userbooklist = suserbookbiz.getid(uid);// userbook���� ������(�ٽ� usinginfo��
												// �� ����)
		for (Object obj : userbooklist) {
			UserBook userbook1 = (UserBook) obj;
			String bid = userbook1.getB_id();// id �̾ƿ�
			Book book1 = (Book) bookbiz.get(bid);// �ϳ��� ã��

			String[] info = { bid, book1.getName(), userbook1.getStart_date(),
					userbook1.getEnd_date() };
			// ���� �̿� ������ �ʿ��� �� String �迭�� ����
			booklist.add(info);// array�� ����
		}

		// �� å�� qt�� 1�ٽ� ���������ش�.
		Book b = new Book(id);
		sbookbiz.getnum_reply(b);

		System.out.println("ȸ���� �ݳ��߽��ϴ�. �����ڴ� Ȯ�����ּ���.");
		mv.addObject("returnqt", returnqt);
		session.setAttribute("booklist", booklist);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	// �ڱ� �뿩 ���� ���� (���������� : ���� �̷�)
	@RequestMapping("/m_bookloglist.do")
	public ModelAndView m_bookloglist(HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user"); // ȸ�� ���̵� ����
																// ���ǿ���
		String uid = sessionuser.getId();

		ArrayList<Object> result = new ArrayList<Object>();
		result = sbooklogbiz.getname(uid); // uid�� ������ booklog�� ����Ʈ��....
		mv.addObject("booklist", result);
		mv.addObject("m_center", "book/m_list.jsp");
		return mv;
	}

	// å ���̵� ������ �� ������ å �� ����
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

}
