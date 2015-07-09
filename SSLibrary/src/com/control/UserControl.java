package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserCommand;
import com.entity.SeatLog;
import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class UserControl {
	@Resource(name = "userbiz")
	Biz biz;
	@Resource(name = "userbiz")
	SearchBiz searchbiz;
	@Resource(name = "userseatbiz")
	Biz userseatbiz;
	@Resource(name = "seatbiz")
	Biz seatbiz;
	@Resource(name = "seatlogbiz")
	UpdateAndReturnBiz seatlogbiz;

	@RequestMapping("/usersearch.do")
	public ModelAndView usersearch(String search) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> list_check = new ArrayList<Object>();
		try {
			list = biz.get();
			for (Object obj : list) {
				User user = (User) obj;
				String check = user.getIsadmin();
				if (check.equals("d")) {

				} else {
					list_check.add(user);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(search.equals("true")){
			// �˻��� ������ �Ŀ� bookmain.do�� �ҷ����Ƿ� ��ü����Ʈ�� �������� �ʴ´�.
			
		}else if(search.equals("false")){
			// �޴����� ó������ �ڷ���� ������ �� ��ü ����Ʈ�� ��� �� ����
			mv.addObject("search", "search=false&");
			mv.addObject("userlist", list_check);		
			mv.addObject("usercount", String.valueOf(list_check.size()));		
		}
		mv.addObject("center", "admin/user/list.jsp");
		return mv;
	}

	@RequestMapping("/userdetail.do")
	public ModelAndView userdetail(String id) {
		ModelAndView mv = new ModelAndView("main");
		User userlist = null;
		try {
			userlist = (User) biz.get(new User(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("userlist", userlist);
		mv.addObject("center", "admin/user/detail.jsp");
		return mv;
	}

	@RequestMapping("/userremoveimpl.do")
	public ModelAndView userremoveimpl(String id) {
		ModelAndView mv = new ModelAndView("redirect:/usersearch.do?search=false");
		User user = new User(id, "d");
		try {
			biz.remove(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/usermodify.do")
	public ModelAndView usermodify(String id) {
		ModelAndView mv = new ModelAndView("main");
		User user = null;
		try {
			user = (User) biz.get(new User(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("userupdate", user);
		mv.addObject("center", "admin/user/update.jsp");
		return mv;
	}

	@RequestMapping("/usermodifyimpl.do")//����ó���ؾ���
	public ModelAndView usermodifyimpl(HttpServletRequest request,
			UserCommand com) {
		System.out.println("usermodifyimpl.do com: " + com);
		ModelAndView mv = new ModelAndView("redirect:/usersearch.do?search=false");
		HttpSession session = request.getSession();
		String old_img = request.getParameter("oldimg");
		MultipartFile file = com.getImg();
		String dir = "C:/lib/SSLibrary/web/img/user/";
		String img = file.getOriginalFilename();
		User user = null;

		if (img == null || img.equals("")) {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), old_img, com.getEmail(), com.getIsadmin());
			System.out.println("usermodifyimpl.do user: " + user);
		} else {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), com.getImg().getOriginalFilename(),
					com.getEmail(), com.getIsadmin());
			System.out.println("usermodifyimpl.do user: " + user);
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
			System.out.println("����"+user);
			biz.remove(user);
			User user_ch = (User) biz.get(new User(com.getId()));
			System.out.println("usermodifyimpl.do user_ch: " + user_ch);
			if (user_ch.getIsadmin().equals("s")) {
				UserSeat userseat = (UserSeat) userseatbiz.get(new UserSeat(user_ch.getId()));
				userseatbiz.remove(new UserSeat(user_ch.getId()));// �¼� �ݳ�
				seatlogbiz.logreturn(new SeatLog(user_ch.getId()));// �α׿� ����
				// seatbiz.modify(new Seat(userseat.getS_id(), "y"));// �¼� ��밡��
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		return mv;
	}

	@RequestMapping("/usersearchname.do")
	public ModelAndView usersearchname(UserCommand user1, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> list_check = new ArrayList<Object>();
		
		String name = user1.getName();
		String isadmin = user1.getIsadmin();
		String id = "";

		if (isadmin.equals("")) {
			isadmin = null;
		}
		if (name.equals("")) {
			name = null;
		}

		try {
			list = searchbiz.getname(new User(id, name, isadmin));
			System.out.println(list);
			for (Object obj : list) {
				User user2 = (User) obj;
				list_check.add(user2);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		session.setAttribute("search", "search=true&");
		session.setAttribute("userlist", list_check);
		session.setAttribute("usercount", String.valueOf(list_check.size()));
		// �˻��� �����ߴٴ� search���� �˻� ��� ����Ʈ �� ��� �� ����
		
		// System.out.println(list_check);
		// System.out.println(list_check.size());
		mv.addObject("center", "admin/user/list.jsp");
		return mv;
	}
}
