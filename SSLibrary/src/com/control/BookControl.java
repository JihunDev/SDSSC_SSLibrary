package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.BookUploadCommand;
import com.entity.Book;
import com.entity.BookLog;
import com.entity.User;
import com.entity.UserBook;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class BookControl {
	@Resource(name = "userbiz")
	// user����
	Biz userbiz;

	// ---------------------------------------
	@Resource(name = "bookbiz")
	// å ����
	Biz bookbiz;
	@Resource(name = "bookbiz")
	// å �˻�
	SearchBiz sbookbiz;
	// ---------------------------------------
	@Resource(name = "userbookbiz")
	// �뿩�� ȸ���� å�� ����
	Biz userbookbiz;
	@Resource(name = "userbookbiz")
	// �뿩�� ȸ���� å�� �������� �˻�
	SearchBiz suserbookbiz;
	@Resource(name = "userbookbiz")
	// �ݳ� �� isreturn y�� �ٲ��ִ� ��
	UpdateAndReturnBiz upreuserbookbiz;
	// ---------------------------------------
	@Resource(name = "booklogbiz")
	// ��� �뿩�� ȸ������ å ����
	Biz booklogbiz;
	@Resource(name = "booklogbiz")
	// �뿩�� ��� ȸ������ å�������� �˻�
	SearchBiz sbooklogbiz;
	@Resource(name = "booklogbiz")
	// å ����, �ݳ� �� ������Ʈ �� �� �ʿ�
	UpdateAndReturnBiz uprebiz;

	// -------------------------------------Book------------------------------------------

	@RequestMapping("/bookmain.do")
	// ����////////////////////////////////////////////
	public ModelAndView bookmain(HttpServletRequest request, String search) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		ArrayList<Object> list = null;
		try {
			list = bookbiz.get(); //book ��ü ��������
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(search.equals("true")){
		// �˻��� ������ �Ŀ� bookmain.do�� �ҷ����Ƿ� ��ü����Ʈ�� �������� �ʴ´�.
			
		}else if(search.equals("false")){
		// �޴����� ó������ �ڷ���� ������ �� ��ü ����Ʈ�� ��� �� ����
			mv.addObject("search", "search=false&");
			mv.addObject("booklist", list);
			mv.addObject("bookcount", String.valueOf(list.size()));  //å ���� ����
		}

		mv.addObject("center", "book/booksearch.jsp");
		return mv;
	}

	/*
	 * @ResponseBody //ajax�� booklist �ҷ����°�
	 * 
	 * @RequestMapping("/booklist.do") public ResponseEntity<String> booklist()
	 * throws Exception{ ResponseEntity<String> returnData = null;
	 * 
	 * HttpHeaders header = new HttpHeaders(); header.add("Content-type",
	 * "application/json;charset=EUC-KR"); ArrayList<Object> list = new
	 * ArrayList<Object>(); list = bookbiz.get();
	 * 
	 * JSONArray ja = new JSONArray(); for(Object obj:list){ Book book =
	 * (Book)obj; JSONObject jo = new JSONObject(); jo.put("id", book.getId());
	 * jo.put("name", book.getName()); jo.put("writer", book.getWriter());
	 * jo.put("img", book.getImg()); jo.put("floor", book.getFloor());
	 * jo.put("total_qt", book.getTotal_qt()); jo.put("current_qt",
	 * book.getCurrent_qt()); jo.put("reg_date", book.getReg_date());
	 * 
	 * ja.add(jo); } returnData = new ResponseEntity<String>( ja.toJSONString(),
	 * header, HttpStatus.CREATED //������ ����� ����� �־��ִ°� ); return returnData; }
	 */

	// �˻��ϱ�////////////////////////////////////////////
	@RequestMapping("/booksearch.do")
	public ModelAndView booksearch(String issearch, String category,
			String search, HttpServletRequest request) {
		// ResponseEntity<String> returnData = null;
		ModelAndView mv = new ModelAndView("main");

		/*
		 * HttpHeaders header = new HttpHeaders(); header.add("Content-type",
		 * "application/json;charset=EUC-KR");
		 */ArrayList<Object> list = new ArrayList<Object>();
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
					
					Iterator<Object> it = sublist1.iterator();
					
					while (it.hasNext()) {
						Book b2 = (Book) it.next();
						if (b1.getId().equals(b2.getId())) {
						} else {
							sublist1.add(o1);
							break;
						}
						
					}
					/*for (Object o2 : sublist1) {
						Book b2 = (Book) o2;
						if (b1.getId().equals(b2.getId())) {
						} else {
							sublist1.add(o1);
						}
					}*/
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

		HttpSession session = request.getSession();

		session.setAttribute("booklist", resultlist);
		session.setAttribute("bookcount", String.valueOf(resultlist.size()));
		session.setAttribute("search", "search=true&");
		// �˻��� �����ߴٴ� search���� �˻� ��� ����Ʈ �� ��� �� ����

		
		// System.out.println(resultlist.size());
		// System.out.println(resultlist);

		mv.addObject("center", "book/booksearch.jsp");

		/*
		 * JSONArray ja = new JSONArray(); for(Object obj:resultlist){
		 * //resultlist�� jason���� �Ѱ��� Book book = (Book)obj; JSONObject jo = new
		 * JSONObject(); jo.put("bid", book.getId()); jo.put("name",
		 * book.getName()); jo.put("writer", book.getWriter()); jo.put("img",
		 * book.getImg()); jo.put("floor", book.getFloor()); jo.put("total_qt",
		 * book.getTotal_qt()); jo.put("current_qt", book.getCurrent_qt());
		 * jo.put("reg_date", book.getReg_date());
		 * 
		 * ja.add(jo); } returnData = new ResponseEntity<String>(
		 * ja.toJSONString(), header, HttpStatus.CREATED //������ ����� ����� �־��ִ°� );
		 * return returnData;
		 */
		return mv;
	}

	@RequestMapping("/bookdetail.do")
	// å ���̵� ������ �� ������ å �� ����//////////////////////////
	public ModelAndView bookdetail(String id) {
		ModelAndView mv = new ModelAndView("main");
		Object result = null;
		try {
			result = bookbiz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("bookdetail", result);
		mv.addObject("center", "book/bookdetail.jsp");
		return mv;
	}

	@RequestMapping("/bookregister.do")
	// å ���������////////////////////////////////////////
	public ModelAndView bookregister() {
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("center", "admin/book/register.jsp");
		return mv;
	}

	@RequestMapping("/bookregisterimpl.do")
	// å ���impl////////////////////////////////////
	public String bookregisterimpl(HttpServletRequest request,
			BookUploadCommand book) {
		Book b = new Book(book.getId(), book.getName(), book.getWriter(), book
				.getImg().getOriginalFilename(), book.getFloor(),
				book.getTotal_qt(), book.getTotal_qt());
		System.out.println(b);
		try {
			 bookbiz.register(b);
		} catch (Exception e) {
			e.printStackTrace();
		}

		MultipartFile file = book.getImg();
		String dir = "c:/lib/SSLibrary/web/img/book/";
		String img = file.getOriginalFilename();
		System.out.println(img);

		byte[] data;
		try {
			data = file.getBytes();
			FileOutputStream out;
			out = new FileOutputStream(dir + file.getOriginalFilename());
			out.write(data);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/bookmain.do?search=false";
	}

	@RequestMapping("/bookremoveimpl.do")
	// å ����impl
	public ModelAndView bookremoveimpl(String id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/bookmain.do?search=false");
/*		Object IsDelete = null;*/
		ArrayList<Object> list = null;
		try {
			bookbiz.remove(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			list = bookbiz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("booklist", list);
	//	mv.addObject("center", "book/booksearch.jsp");
		return mv;
	}

	@RequestMapping("/bookmodify.do")
	// å ����������////////////////////////////////////////////
	public ModelAndView bookmodify(String id){
		ModelAndView mv = new ModelAndView("main");
		Object b = null;
		try {
			b = bookbiz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("bookinfo", b);
		mv.addObject("center", "admin/book/update.jsp");
		return mv;
	}

	@RequestMapping("/bookmodifyimpl.do")
	// å ����(���� ������ ���ο� �������� �����Ƽ� ���� �� ����)///////////
	public ModelAndView bookmodifyimpl(HttpServletRequest request,
			BookUploadCommand book){
		System.out.println(book.getId() + " " + book.getName() + " "
				+ book.getWriter());
		System.out.println(book.getImg().getOriginalFilename() + " "
				+ book.getFloor() + " " + book.getCurrent_qt());
		System.out.println(book.getTotal_qt() + " " + book.getReg_date());
		String img = book.getImg().getOriginalFilename();

		String oldimg = request.getParameter("oldimg");
		Book b =null;
			
		if (img == null || img.equals("")) {
			b = new Book(book.getId(), book.getName(), book.getWriter(),
					oldimg, book.getFloor(), book.getTotal_qt(),
					book.getCurrent_qt());

			System.out.println("oldimg : " + oldimg);

		} else {
			b = new Book(book.getId(), book.getName(), book.getWriter(), img,
					book.getFloor(), book.getTotal_qt(), book.getCurrent_qt());

			System.out.println("new img : " + img);

			MultipartFile file = book.getImg();
			String dir = "c:/lib/SSLibrary/web/img/book/";
			if (file != null) {
				byte[] data;
				try {
					data = file.getBytes();
					FileOutputStream out = new FileOutputStream(dir
							+ file.getOriginalFilename());
					out.write(data);
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				} // �ö�� �����͸� byte array�� ��ȯ��. (��� ���� ����)
				
			}
		}

		try {
			bookbiz.modify(b);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView("redirect:/bookdetail.do?id="
				+ book.getId());
		return mv;
	}

	// --------------------------------------UserBook---------------------------------------
	@Transactional
	@RequestMapping("/userbookregister.do")
	// å �뿩�ϱ�
	public ModelAndView userbookregister(HttpServletRequest request, String id) {
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // ȸ�� ���̵� ���� ���ǿ���
															// ��������
		User user = null;
		int borrowbook = 0; // å�� ���ȴ��� Ȯ�� ����
		// (0 : �ƹ��ϵ� ���� / 1 : �ߺ� �뿩 �Ұ� / 2 : �������� �뿩�� �� ���� / 3 : �뿩�Ϸ�  / 4 : �����ڰ� Ȯ�� ������)
		int overlap = 0; // �뿩�� �ߺ��Ǿ����� ���� (1 : �ߺ��� / 2 : �ߺ� �ȵ�)

		Book upbook; // �������� å ���� �������� ��
		Book upbooknew; // �뿩 ������ �뿩���� �� 1�� ���̱� ���� �־���� �ϴ� å ������Ʈ ����
		int current_qt = 0; // �뿩 ������ å�� ����� �������� ����
		
		/*String isreturn = null; // ��ȯ�Ǿ����� ���θ� �˱� ���� ���� (������ Ȯ�� ���ϰ� �� ��å ������)
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
		String bid = ""; //ArrayList���� book id ���� ���ؼ� ���� ����

		if (userbooklist.size() == 0) { // �뿩�� �ѹ��� ���� ���
			overlap = 2;
			System.out.println("�ߺ� �ȉ�����");

		} else { // �뿩�� �ѹ��̶� �� ����� ���

			for (Object obj : userbooklist) { // ȸ���� ���� åid��� ���� �뿩�Ϸ��� å id ����
				UserBook userbook = (UserBook) obj;
				bid = userbook.getB_id();// id �̾ƿͼ� �ֱ�
				System.out.println("å id : " + bid);

				if ((bid.equals(id) || bid == id)) {// �뿩�ҷ��� å�� �ߺ��� ���
					
					if((userbook.getIsreturn()=="n" || userbook.getIsreturn().equals("n"))){//�����ڰ� Ȯ���� ���
						System.out
						.println("---------------------�̹� �뿩�� å�̶� ���� �� ����---------------------");
						overlap = 1; // �ߺ��� ���
						borrowbook = 1; //�ߺ��뿩 �Ұ�
								
					}else{//�����ڰ� Ȯ�ξ��� ���
						System.out
						.println("---------------------�����ڰ� ���� Ȯ���� ������---------------------");
						overlap = 1; // �ߺ��� ���
						borrowbook = 4; //�����ڰ� Ȯ�� ������
						
					}
					try {
						upbook = (Book) bookbiz.get(id);// ���� �������� å�� ������ �����´�.
						mv.addObject("bookdetail", upbook);
						break;
					} catch (Exception e) {
						e.printStackTrace();
					}	

				}else {
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
		mv.addObject("center", "book/bookdetail.jsp");
		return mv;
	}

	@RequestMapping("/userbookmodifyimpl.do")
	// å �����ϱ�//////////////////////////////////////////
	public ModelAndView userbookmodifyimpl(HttpServletRequest request, String id){
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // ȸ�� ���̵� ���� ���ǿ���
															// ��������
		int isqt = 0;
		UserBook book = new UserBook(uid, id);
		UserBook usersbook = null;
		try {
			usersbook = (UserBook) userbookbiz.get(book);// ȸ���� ���ȴ� å�� ���� userbook���� ��������
		} catch (Exception e) {
			e.printStackTrace();
		} 
																

		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>(); // �ٽ� usinginfo��
																// �� ����
		int renew_qt = usersbook.getRenew_qt(); // ����Ƚ���� ������� ��������
		if (renew_qt >= 2) { // ������ 2�� �̻��̸�
			System.out.println("�� ������ �� �����ϴ�.");
			isqt = 1;

		} else { // ������ 2�� �̸��̸�
			try {
				userbookbiz.modify(book); // ������ å ���� ������Ʈ -> ����Ƚ�� ����, 7�� ����... 2���� �Ǿ���...
				book = (UserBook) userbookbiz.get(book); //������Ʈ �� �� �ٽ� ������
				// booklog ������Ʈ
				BookLog blog = new BookLog(id, uid);
				ArrayList<Object> booklog = new ArrayList<Object>();
				booklog = sbooklogbiz.getid(blog); // Booklog���� ȸ���� ���ȴ� å�� ������ �����´�.

				for (Object obj : booklog) {// ���� ������ ������ �־��ش�.
					BookLog logbook = (BookLog) obj;
					BookLog logbook2 = new BookLog(logbook.getId(),
							logbook.getB_id(), logbook.getU_id(),
							book.getRenew_qt());
					uprebiz.logupdate(logbook2); // ���� ���� ������Ʈ
					System.out.println(logbook2);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println("���� �Ϸ�");
			isqt = 2;
		}

		try {
			userbooklist = suserbookbiz.getid(uid); // userbook���� ������(�ٽ� usinginfo�� �� ����)
			for (Object obj : userbooklist) {
				UserBook userbook = (UserBook) obj;
				String bid = userbook.getB_id();// id �̾ƿ�
				
				if(userbook.getIsreturn()=="n" || userbook.getIsreturn().equals("n")){
					Book book1 = (Book) bookbiz.get(bid);// �ϳ��� ã��

					String[] info = { bid, book1.getName(), userbook.getStart_date(),
							userbook.getEnd_date() };
					// ���� �̿� ������ �ʿ��� �� String �迭�� ����
					booklist.add(info);// array�� ����
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// mv.addObject("booklist",booklist); //�ٲ�� �ٽ� �־���
		session.setAttribute("booklist", booklist);
		mv.addObject("qt", isqt);
		mv.addObject("center", "user/usinginfo.jsp");
		return mv;
	}

	@RequestMapping("/userbookremove.do")
	// �ݳ��ϱ� : UserBook�� �ݳ� ���� ����,Log�� �ݳ�ó��///////////////////
	public ModelAndView userbookremove(HttpServletRequest request, String id){
		
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // ȸ�� ���̵� ���� ���ǿ���
															// ��������
		// 1.ȸ���� ���̵�� å ���̵� ������ booklog ���̺� �ݳ������� ������Ʈ �Ѵ�.

		BookLog blog = new BookLog(id, uid);
		ArrayList<Object> booklog = new ArrayList<Object>();
		try {
			booklog = sbooklogbiz.getid(blog); // Booklog���� ȸ���� ���ȴ� å�� ������ �����´�.
			for (Object obj : booklog) {// ���� ������ ������ �־��ش�.
				BookLog logbook = (BookLog) obj;
				BookLog logbook2 = new BookLog(logbook.getId(), logbook.getB_id(),
						logbook.getU_id(), logbook.getReal_date());
				booklogbiz.modify(logbook2); // �ݳ� ���� �����ش�. real_date�� ������Ʈ ��
				System.out.println("booklog ������Ʈ �Ϸ�");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 

		int returnqt = 0; // �ݳ��ߴ��� ���ߴ���

		// 2. UserBook�� isreturn�� y�� �ٲ۴�.
		UserBook userbook = new UserBook(uid, id);
		try {
			userbook = (UserBook) userbookbiz.get(userbook);
			UserBook modifyuserbook = new UserBook(uid, id, "y");
			upreuserbookbiz.logreturn(modifyuserbook); // y�� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		returnqt = 1;

		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>(); // �ٽ� usinginfo�� �� ����
		
		try {
			userbooklist = suserbookbiz.getid(uid); // userbook���� ������(�ٽ� usinginfo�� �� ����)
			for (Object obj : userbooklist) {
				UserBook userbook1 = (UserBook) obj;
				String bid = userbook1.getB_id();// id �̾ƿ�
				if(userbook1.getIsreturn()=="n" || userbook1.getIsreturn().equals("n")){
				Book book1 = (Book) bookbiz.get(bid);// �ϳ��� ã��

				String[] info = { bid, book1.getName(), userbook1.getStart_date(),
						userbook1.getEnd_date() };
				// ���� �̿� ������ �ʿ��� �� String �迭�� ����
				booklist.add(info);// array�� ����
				}
			}
			
			// �� å�� qt�� 1�ٽ� ���������ش�.
			Book b = new Book(id);
			sbookbiz.getnum_reply(b);
			System.out.println("ȸ���� �ݳ��߽��ϴ�. �����ڴ� Ȯ�����ּ���.");

		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("returnqt", returnqt);
		session.setAttribute("booklist", booklist);
		mv.addObject("center", "user/usinginfo.jsp");
		return mv;
	}

	@RequestMapping("/bookloglist.do")
	// �ڱ� �뿩 ���� ���� (���������� : ���� �̷�)////////////////////
	public ModelAndView bookloglist(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // ȸ�� ���̵� ���� ���ǿ���
															// ��������
		ArrayList<Object> result = new ArrayList<Object>();
		try {
			result = sbooklogbiz.getname(uid);// uid�� ������ booklog�� ����Ʈ��....
		} catch (Exception e) {
			e.printStackTrace();
		} 
		mv.addObject("booklist", result);
		mv.addObject("center", "book/booklist.jsp");
		return mv;
	}

	@RequestMapping("/userbookremoveconfirm.do")
	// �����ڰ� �ݳ��� ���� ���� Ȯ���ϴ� â///////////////////
	public ModelAndView userbookremoveconfirm(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // ȸ�� ���̵� ���� ���ǿ���
															// ��������
		ArrayList<Object> result = new ArrayList<Object>();
		try {
			result = suserbookbiz.getname(uid); // �ݳ��� y�� �������� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("userbooklist", result);
		mv.addObject("center", "admin/book/returnbook.jsp");
		return mv;
	}

	@RequestMapping("/userbookremoveimpl.do")
	// �����ڰ� �ݳ��� ���� ������ Ȯ������ �� userbook ����� ��////
	public ModelAndView userbookremoveimpl(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // ȸ�� ���̵� ���� ���ǿ���
															// ��������
		ArrayList<Object> result = new ArrayList<Object>();
		try {
			result = suserbookbiz.getname(uid); // �ݳ��� y�� �������� ����
			for (Object obj : result) {
				UserBook userbook = (UserBook) obj;
				String userid = userbook.getU_id();
				String bookid = userbook.getB_id();
				userbook = new UserBook(userid, bookid); // ����Ʈ���� �̾ƿ� ���� ���̵�� å ���̵�
															// �����´�.
				userbookbiz.remove(userbook); // �� ��ü�� userbook����Ʈ���� �����.
				System.out.println("�ݳ�Ȯ�οϷ�");
			}
			result = suserbookbiz.getname(uid);// �ٽ� �ݳ��� y�� �������� ������ ��� �ҷ��´�
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("userbooklist", result);
		mv.addObject("center", "admin/book/returnbook.jsp");
		return mv;
	}

	@ResponseBody
	// ��ü�ڵ� �����ǰ� ����� ////////////////////////////////////////////////
	@RequestMapping("/stopborrowbook.do")
	public String notreturnbook(){
		ArrayList<Object> overduelist = null;
		try {
			overduelist = suserbookbiz.getexpired();// ����ð��� �������� å ��ü�ڵ� ��������
			for (Object obj : overduelist) {
				UserBook ub = (UserBook) obj;
				String uid = ub.getU_id();
				User userinfo = new User(uid, "s"); // user�� ���¸� ������ �ٲ���
				userbiz.remove(userinfo);

				/* System.out.println(userinfo); */
			}
		} catch (Exception e) {

			e.printStackTrace();
		} 
	
		return "ȸ�� ���� ok";
	}

	@RequestMapping("/adminbookloglist.do")
	// ������ ���ݱ��� ���ȴ� ������ Ȯ���ϱ�////////////////
	public ModelAndView adminbookloglist(){
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> loglist = new ArrayList<Object>();
		try {
			loglist = booklogbiz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("loglist", loglist);
		mv.addObject("center", "admin/booklog/booklogdetail.jsp");
		return mv;
	}

	@ResponseBody
	@RequestMapping("adminbooklogsearch.do")
	// �����ڰ� booklog���� �˻�(user/book)
	public ResponseEntity<String> adminbooklogsearch(String whatsearch, String name){
		ResponseEntity<String> returnData = null;
		ArrayList<Object> list = null;
		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/json;charset=EUC-KR");
		System.out.println("����");
		if (whatsearch.equals("user")) {
			BookLog bookuser = new BookLog("1", name);
			System.out.println("userid�� ã�� �� : " + bookuser);
			try {
				list = sbooklogbiz.getname(bookuser);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (whatsearch.equals("book")) {
			BookLog bookid = new BookLog(name, "1");
			System.out.println("bookid�� ã�� �� : " + bookid);
			try {
				list = sbooklogbiz.gettitle(bookid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		BookLog book = null;
		
		System.out.println("list : " + list);
		JSONArray ja = new JSONArray();
		for (Object obj : list) {
			book = (BookLog) obj;
			JSONObject jo = new JSONObject();
			jo.put("id", book.getId());
			jo.put("b_id", book.getB_id());
			jo.put("u_id", book.getU_id());
			jo.put("start_date", book.getStart_date());
			jo.put("end_date", book.getEnd_date());
			
			String real_data = null; //null�� ǥ�ð� �ȵǰ� �ٲ�
			if(book.getReal_date()==null){
				real_data="";
			}else{
				real_data = book.getReal_date();
			}
			jo.put("real_date", real_data);
			jo.put("renew_qt", book.getRenew_qt());
			ja.add(jo);
		}
		returnData = new ResponseEntity<String>(ja.toJSONString(), header,
				HttpStatus.CREATED // ������ ����� ����� �־��ִ°�
		);
		return returnData;
	}
}
