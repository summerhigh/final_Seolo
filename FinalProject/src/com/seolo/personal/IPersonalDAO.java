package com.seolo.personal;

import java.sql.SQLException;

public interface IPersonalDAO
{
	public int add(PersonalDTO personal) throws SQLException;		// 회원가입
	
	public PersonalDTO login(String id, String pw) throws SQLException;      // 회원 로그인
	
	public int searchIdCount(String name, String tel) throws SQLException; // 해당 이름과 전화번호가 맞는지 확인 메소드
	
	public int searchIdCount(String name, String tel, String id) throws SQLException; // 비밀번호 아이디 이름 전화번호가 맞는지 확인 메소드
	
	public int pwdModify(String id, String pw) throws SQLException; // 비밀번호 변경
	
	public String searchId(String name, String tel) throws SQLException;   // 아이디 찾기 메소드
	
	public int confirmId(String id) throws SQLException;   // 아이디 중복확인(ajax)
   
	public int confirmTel(String tel) throws SQLException;   // 휴대전화 중복확인 - personal 테이블 (ajax)
   
	public int confirmTel2(String tel) throws SQLException; // 가입시 가입 가능한 휴대전화인지 - withdrawal 테이블 (ajax)
	
	public int confirmNick(String nickname) throws SQLException;   // 닉네임 중복확인(ajax)
}
