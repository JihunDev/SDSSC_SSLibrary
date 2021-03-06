package com.control;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.MessageLog;
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
   @Resource(name = "messagelogbiz")
   Biz message_biz;

   
   @Resource(name = "seatlogbiz")
   UpdateAndReturnBiz seatlogbiz;

   @Transactional
   public void tr_usermodifyimpl(String id) {
      User userinfo = new User(id, "s"); // user�� ���¸� ������ �ٲ���
      try {
         biz.modify(userinfo);
         UserSeat userseat = (UserSeat) userseatbiz.get(new UserSeat(id));
         message_biz.register(new MessageLog(id, 0, "System", id+"���� ������ �Ͻ����� �Ǿ����ϴ�."));
         
         if (userseat != null) {
            userseatbiz.remove(new UserSeat(id));// �¼� �ݳ�
            seatlogbiz.logreturn(new SeatLog(id));// �α׿� ����
            seatbiz.modify(new Seat(userseat.getS_id(), "y"));// �¼� ��밡��
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}