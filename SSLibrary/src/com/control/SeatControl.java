package com.control;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.command.SeatCommand;
import com.command.SeatLogCommand;
import com.command.UserSeatCommand;
import com.entity.Seat;
import com.entity.SeatLog;
import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;
import com.util.Nav;

@Controller
public class SeatControl {

	@Resource(name = "userseatbiz")
	Biz ubiz;
	@Resource(name = "seatlogbiz")
	Biz lbiz;
	@Resource(name = "seatbiz")
	Biz biz;

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
		if(user == null){
			mv.addObject("left", "left.jsp");		
		}	
		// �¼� ����
		mv.addObject("seatlist", seatlist);
		
		// ���� �̹� �¼������� ������ ��ȿ, ������ null
		mv.addObject("myseat", myseat);
		
		
		mv.addObject("modifypage", "seatmodify.jsp");		
		mv.addObject("registermsg", "register.jsp");

		mv.addObject("nav", Nav.seat);
		mv.addObject("center", "seat/seatstate.jsp");
		return mv;
	}
	
	// ����� �¼� ���� �޼ҵ�
	@RequestMapping("/userseatregister.do")
	public String userseatregister(HttpServletRequest request, SeatCommand s,
			UserSeatCommand us, SeatLogCommand sl) throws Exception {

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

	// �ش� �¼� ���� ��ȯ
	@ResponseBody
	@RequestMapping("/seatmodify.do")
	public String seatmodify(String s_id,HttpServletRequest request) {
		int sid_num = Integer.parseInt(s_id);
		Seat seat = null;
		try {
			seat = (Seat) biz.get(new Seat(sid_num));
		} catch (Exception e) {
			System.out.println("seatmodify.do : biz.get(new Seat("+sid_num+") ����");
			e.printStackTrace();
		}
		//HttpSession session = request.getSession();
		//session.setAttribute("seatstate", seat.getState());		
		System.out.println("seatstate: " + seat.getState());
	
		return seat.getState();
	}
	
	//�¼� ���� ����
	@RequestMapping("/seatmodifyimpl.do")
	public String seatmodifyimpl(String s_id, String state, HttpServletRequest request) {
		int sid_num = Integer.parseInt(s_id);
				
		try {
			biz.modify(new Seat(sid_num, state));
		} catch (Exception e) {
			System.out.println("seatmodifyimpl.do : " + sid_num+"�¼� ���� ���� ����");
			e.printStackTrace();
		}
		return "redirect:/seatmain.do";
		
	}

}
