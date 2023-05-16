package com.ve.po;

public class BoardModel {
	private int bid;
	private String boardname;
	private int user_id;
	private String boardintroduction;
	private int boardclassfication;
	private UserModel user;
	private String boardimage;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBoardintroduction() {
		return boardintroduction;
	}
	public void setBoardintroduction(String boardintroduction) {
		this.boardintroduction = boardintroduction;
	}
	public int getBoardclassfication() {
		return boardclassfication;
	}
	public void setBoardclassfication(int boardclassfication) {
		this.boardclassfication = boardclassfication;
	}
	public UserModel getUser() {
		return user;
	}
	public void setUser(UserModel user) {
		this.user = user;
	}
	public String getBoardimage() {
		return boardimage;
	}
	public void setBoardimage(String boardimage) {
		this.boardimage = boardimage;
	}
		
}