package com.ve.po;


public class ReFloorModel {
	private int refid;
	private int user_id;
	private int reuser_id;
	private int floor_id;
	private String refloorcontent;
	private String refloortime;
	private int messagestate;
	private UserModel user;
	private UserModel reuser;
	
	public int getRefid() {
		return refid;
	}
	public void setRefid(int refid) {
		this.refid = refid;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getReuser_id() {
		return reuser_id;
	}
	public void setReuser_id(int reuser_id) {
		this.reuser_id = reuser_id;
	}
	public int getFloor_id() {
		return floor_id;
	}
	public void setFloor_id(int floor_id) {
		this.floor_id = floor_id;
	}
	public String getRefloorcontent() {
		return refloorcontent;
	}
	public void setRefloorcontent(String refloorcontent) {
		this.refloorcontent = refloorcontent;
	}
	public String getRefloortime() {
		return refloortime;
	}
	public void setRefloortime(String refloortime) {
		this.refloortime = refloortime;
	}
	public int getMessagestate() {
		return messagestate;
	}
	public void setMessagestate(int messagestate) {
		this.messagestate = messagestate;
	}
	public UserModel getUser() {
		return user;
	}
	public void setUser(UserModel user) {
		this.user = user;
	}
	public UserModel getReuser() {
		return reuser;
	}
	public void setReuser(UserModel reuser) {
		this.reuser = reuser;
	}
}
