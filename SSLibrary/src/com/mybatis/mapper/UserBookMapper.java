package com.mybatis.mapper;

import java.util.ArrayList;

public interface UserBookMapper {
	public ArrayList<Object> selectuserbooks();
	public Object selectuserbook(Object obj);
	public int insertuserbook(Object obj);
	public int deleteuserbook(Object obj);
	public int updateuserbook(Object obj);
	public ArrayList<Object> selectiduserbooks(Object obj);
	public int updatereturnuserbook(Object obj);
	public ArrayList<Object> selectreturnuserbooks(Object obj); //�ݳ��� y�� �������� ����
	public ArrayList<Object> selectoverduebooks(); //��ü�� ����� ����ȸ������ �����
	
	
}
