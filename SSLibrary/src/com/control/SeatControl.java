package com.control;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserSeatCommand;
import com.entity.Seat;
import com.entity.SeatLog;
import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Transactional
@Controller
public class SeatControl {
	@Resource(name = "seatbiz")
	Biz biz;
	
	@Resource(name = "userseatbiz")
	Biz ubiz;
	@Resource(name = "userseatbiz")
	SearchBiz s_ubiz;

	@Resource(name = "seatlogbiz")
	Biz lbiz;
	@Resource(name = "seatlogbiz")
	SearchBiz s_lbiz;	
	@Resource(name = "seatlogbiz")
	UpdateAndReturnBiz ur_lbiz;

	@Resource(name = "seatimpl")
	SeatImpl seatimpl;
	
	@RequestMapping("/seatmain.do")
	public ModelAndView seatmain(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		ArrayList<Object> seatlist = null;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		Object myseat = null;
		try {
			myseat = ubiz.get(user.getId());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			seatlist = biz.get();
		} catch (Exception e) {
			System.out.println("�¼� ������ ���� ����");
			e.printStackTrace();
		}

		mv.setViewName("main");
		int y_count = 0, n_count = 0, f_count = 0;
		for (Object obj : seatlist) {
			Seat s = (Seat) obj;
			if(s.getState().equals("y")) y_count++;
			if(s.getState().equals("f")) f_count++;
			if(s.getState().equals("n")) n_count++;
		}
		// �¼� ����
		mv.addObject("seatlist", seatlist);
		mv.addObject("seatqt", seatlist.size());
		mv.addObject("y_count", y_count);
		mv.addObject("f_count", f_count);
		mv.addObject("n_count", n_count);
		
		System.out.println(seatlist);
		
		// ���� �̹� �¼������� ������ ��ȿ, ������ null
		mv.addObject("myseat", myseat);
		
		mv.addObject("dialogpage", "seatdialog.jsp");
		mv.addObject("seateduserpage", "seateduserinfo.jsp");
		mv.addObject("registermsg", "register.jsp");
		

		mv.addObject("center", "seat/seatstate.jsp");
		return mv;
	}

	// ����� �¼� ���� �޼ҵ�
	@RequestMapping("/userseatregister.do")
	public String userseatregister(HttpServletRequest request,
			UserSeatCommand us) throws Exception {

		int s_id = us.getS_id();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String u_id = user.getId();

		System.out.println("s_id: " + s_id);
		System.out.println("u_id: " + u_id);

		try {
			ubiz.register(new UserSeat(u_id, s_id));
			lbiz.register(new SeatLog(u_id, s_id));
			biz.modify(new Seat(s_id, "n"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/seatmain.do";
	}

	// ������ �¼��� ��ϵ� ȸ���� ���� ����
	@SuppressWarnings({ "unchecked" })
	@ResponseBody
	@RequestMapping("/seatmodify.do")
	public ResponseEntity<String> seatmodify(String s_id, HttpServletRequest request) {
		int sid_num = Integer.parseInt(s_id);
		Seat seat = null;
		ArrayList<Object> seatbys_id = null;
		String u_id = "";

		try {
			seat = (Seat) biz.get(new Seat(sid_num));
		} catch (Exception e) {
			System.out.println("seatmodify.do : (Seat) biz.get(new Seat(sid_num)) Fail");
			e.printStackTrace();
		}
		// ������ �¼��� ������ �ҷ��� �ش� �¼��� u_id ����
		try {
			seatbys_id = (ArrayList<Object>) s_ubiz.getid(s_id);
			// �¼������� ������ �켱 ����
			if (seatbys_id != null) {
				for (Object obj : seatbys_id) {
					UserSeat u_seat = (UserSeat) obj;
					u_id = u_seat.getU_id();
				}
			}
		} catch (Exception e) {
			System.out.println("seatmodify.do : (ArrayList<Object>) s_ubiz.getid(s_id) Fail");
			e.printStackTrace();
		}

		JSONObject result = null;
		result = seatimpl.getSetUserInfo(u_id);

		System.out.println("receiver_sid: " + seat.getId());
		System.out.println("receiver_uid: " + u_id);
		System.out.println("seatstate: " + seat.getState());
		System.out.println("userdetail(JSON): " + result);

		ResponseEntity<String> returnData = null;
		HttpHeaders header = new HttpHeaders(); 
		header.add("Content-type", "application/json;charset=EUC-KR");
	
		returnData = new ResponseEntity<String>(result.toJSONString(),
				header,
				HttpStatus.CREATED //������ ����� ����� �־��ִ°�
				);
		return returnData;
	}

	
	// �¼� ���� ���� �� ��� ��ȯ
	@ResponseBody
	@RequestMapping("/seatmodifyimpl.do")
	public String seatmodifyimpl(String s_id, String state, HttpServletRequest request) {
		int sid_num = Integer.parseInt(s_id);
		String result = "";
		String new_state = state;

		ArrayList<Object> seatbys_id = null;
		String u_id = "";

		try {
			// ������ �¼��� ������ �ҷ��� �ش� �¼��� u_id ����
			seatbys_id = (ArrayList<Object>) s_ubiz.getid(s_id);
			// �¼������� ������ �켱 ����
			if (seatbys_id != null) {
				for (Object obj : seatbys_id) {
					UserSeat seat = (UserSeat) obj;
					u_id = seat.getU_id();
				}
				ubiz.remove(u_id);
			}
			biz.modify(new Seat(sid_num, new_state));

		} catch (Exception e) {
			System.out.println("seatmodifyimpl.do Fail");
			e.printStackTrace();
		}
		return result;
	}

	// �¼� ����
	@RequestMapping("/userseatmodify.do")
	public ModelAndView userseatmodify(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String u_id = user.getId();
		Object userseat = null;
		try {
			userseat = (UserSeat) ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			System.out.println("userseatmodify.do Fail");
			e.printStackTrace();
		}
		UserSeat us = (UserSeat) userseat;
		if(us.getRenew_qt() == 2){
			System.out.println("���� �Ұ�");
		}else{
			try {
				ubiz.modify(new UserSeat(u_id));
				ur_lbiz.logupdate(new SeatLog(u_id));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}

		try {
			userseat = ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("userseat", userseat);
		mv.addObject("center","user/usinginfo.jsp");
		return mv;
	}

	// �¼� �ݳ�
	@RequestMapping("/userseatremove.do")
	public ModelAndView userseatremove(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String u_id = user.getId();		
		Object userseat = null;
		
		try {
			userseat = (UserSeat) ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		UserSeat us = (UserSeat) userseat;
		int s_id = us.getS_id();
		
		try {
			ubiz.remove(new UserSeat(u_id));
			ur_lbiz.logreturn(new SeatLog(u_id));
			biz.modify(new Seat(s_id, "y"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			userseat = ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("userseat", userseat);
		mv.addObject("center","user/usinginfo.jsp");
		return mv;
	}
	
	
	// �¼� �뿩 ���� ���� ���
	@RequestMapping("/seatloglist.do")
	public ModelAndView seatloglist(String id) {
		ModelAndView mv = new ModelAndView("main");
		
		ArrayList<Object> sl_l = null;
		System.out.println(id);
		try {
			sl_l = s_lbiz.getid(new SeatLog(id));
		}		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sl_l);
		mv.addObject("seatloglist", sl_l);
		mv.addObject("center", "seat/seatloglist.jsp");
		
		return mv;
	}

	// �ݳ��Ⱓ�� ���� �¼� �ݳ� �� �̿����� ����
	@ResponseBody
	@RequestMapping("/expireseat.do")
	public String expireseat(){
		ArrayList<Object> expired_list = null;
		int s_id = 0;
		String u_id = "";
		try {
			expired_list = s_ubiz.getexpired();
			for (Object obj : expired_list) {
				UserSeat us = (UserSeat) obj;
				s_id = us.getS_id();	// ����ð��� ���� Seat�� ID
				u_id = us.getU_id(); // �� Seat�� User ID

				//userimpl.tr_usermodifyimpl(u_id);
	
				ubiz.remove(new UserSeat(u_id));		// �ش� ���� �̿����� ����
				ur_lbiz.logreturn(new SeatLog(u_id));	// ���� �ݳ��� �¼� ������ ��Ͽ� ����
				biz.modify(new Seat(s_id, "y"));			// �¼� ���¸� ���డ�� ���·� ����
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		//System.out.println(getClass() + ".expireseat():  ����� �¼� �̿����� ���� ����");
		return "ok";
	}
	
	
	// �������� ��ü �¼� �뿩 ���� �˻�
	@RequestMapping("/adminseatloglist.do")
	public ModelAndView adminseatloglist(){
		ArrayList<Object> seatloglist = null;
		
		try {
			seatloglist = lbiz.get();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("center", "admin/seatlog/seatloglist.jsp");
		mv.addObject("adminseatloglist", seatloglist);
		
		return mv;
	}
	// �������� Ư�� ������� �¼� �뿩 ���� �˻�
	@RequestMapping("/adminseatlogsearch.do")
	public ModelAndView adminseatlogsearch(String search, String issearch, HttpServletRequest request){
		ArrayList<Object> seatloglist = null;
		ModelAndView mv = new ModelAndView("main");
		
		SeatLog seatlog = null;
		switch(issearch){
		case "u_id":
			String u_id = search;
			seatlog = new SeatLog(u_id, 0);
			break;
		case "s_id":
			int s_id = Integer.parseInt(search);
			seatlog = new SeatLog(null, s_id);
			break;		
		}
		
		try {
			seatloglist = s_lbiz.getid(seatlog);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("adminseatloglist", seatloglist);
		session.setAttribute("adminseatloglist_count", String.valueOf(seatloglist.size()));
		//session.setAttribute("search", "search=true&");

		mv.addObject("center", "admin/seatlog/seatloglist.jsp");
		return mv;
	}
}
