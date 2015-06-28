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
import com.frame.SearchBiz;
import com.util.Nav;

@Controller
public class SeatControl {

	@Resource(name = "userseatbiz")
	Biz ubiz;
	@Resource(name = "userseatbiz")
	SearchBiz s_ubiz;

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
			seatlist = biz.get();
		} catch (Exception e) {
			System.out.println("좌석 열람실 정보 실패");
			e.printStackTrace();
		}

		mv.setViewName("main");
		if (user == null) {
			mv.addObject("left", "left.jsp");
		}else{
			try {
				myseat = ubiz.get(user.getId());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		// 좌석 정보
		mv.addObject("seatlist", seatlist);

		// 내가 이미 좌석예약을 했으면 유효, 없으면 null
		mv.addObject("myseat", myseat);

		mv.addObject("modifypage", "seatmodify.jsp");
		mv.addObject("registermsg", "register.jsp");

		mv.addObject("nav", Nav.seat);
		mv.addObject("center", "seat/seatstate.jsp");
		return mv;
	}

	// 사용자 좌석 예약 메소드
	@RequestMapping("/userseatregister.do")
	public String userseatregister(HttpServletRequest request, UserSeatCommand us) throws Exception {

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

	// 수정을 해당 좌석 상태 반환
	@ResponseBody
	@RequestMapping("/seatmodify.do")
	public String seatmodify(String s_id, HttpServletRequest request) {
		int sid_num = Integer.parseInt(s_id);
		Seat seat = null;

		HttpSession session = request.getSession();
		try {
			seat = (Seat) biz.get(new Seat(sid_num));
		} catch (Exception e) {
			System.out.println("seatmodify.do : biz.get(new Seat(" + sid_num
					+ ") 실패");
			e.printStackTrace();
		}
		String result = seat.getState();
		// HttpSession session = request.getSession();
		// session.setAttribute("seatstate", seat.getState());
		System.out.println("seatstate: " + result);
		session.setAttribute("s_state", result);
		
		return result;
	}

	// 좌석 수정 수행 및 결과 반환
	@ResponseBody
	@RequestMapping("/seatmodifyimpl.do")
	public String seatmodifyimpl(String s_id, String state,
			HttpServletRequest request) {
		int sid_num = Integer.parseInt(s_id);
		String result = "";
		String new_state = state;
		
		ArrayList<Object> seatbys_id = null;
		String u_id = "";

		//System.out.println("sid_num: " + sid_num);
		//System.out.println("new_state: " + new_state);
		
		try {
				// 수정할 좌석의 정보를 불러와 해당 좌석의 u_id 추출
				seatbys_id = (ArrayList<Object>) s_ubiz.getid(s_id);
				// 좌석정보가 있으면 우선 삭제
				if (seatbys_id != null) {
					for (Object obj : seatbys_id) {
						UserSeat seat = (UserSeat) obj;
						u_id = seat.getU_id();
					}
					ubiz.remove(u_id);
				}
				result = 	(String) biz.modify(new Seat(sid_num, new_state));;

			} catch (Exception e) {
				e.printStackTrace();
		}
		return result;
	}

}
