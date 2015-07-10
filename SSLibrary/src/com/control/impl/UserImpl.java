package com.control.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Seat;
import com.entity.SeatLog;
import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.UpdateAndReturnBiz;

@Service("user_usermodifyimpl")
public class UserImpl {
	@Resource(name = "userbiz")
	Biz biz;
	@Resource(name = "userseatbiz")
	Biz userseatbiz;
	@Resource(name = "seatbiz")
	Biz seatbiz;
	@Resource(name = "seatlogbiz")
	UpdateAndReturnBiz seatlogbiz;
	
	@Transactional
	public void tr_usermodifyimpl(User user) {
		
		try {
			UserSeat userseat = (UserSeat) userseatbiz.get(new UserSeat(user.getId()));
			
			userseatbiz.remove(new UserSeat(user.getId()));// �¼� �ݳ�
			seatlogbiz.logreturn(new SeatLog(user.getId()));// �α׿� ����
			seatbiz.modify(new Seat(userseat.getS_id(), "y"));// �¼� ��밡��
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
