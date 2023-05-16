package com.ve.po;


public class FloorModel {
private int fid;
private int post_id;
private int user_id;
private int floornum;
private String floortime;
private String floorcontent;
private UserModel user;


public int getFid() {
	return fid;
}
public void setFid(int fid) {
	this.fid = fid;
}
public int getPost_id() {
	return post_id;
}
public void setPost_id(int post_id) {
	this.post_id = post_id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public int getFloornum() {
	return floornum;
}
public void setFloornum(int floornum) {
	this.floornum = floornum;
}
public String getFloortime() {
	return floortime;
}
public void setFloortime(String floortime) {
	this.floortime = floortime;
}
public String getFloorcontent() {
	return floorcontent;
}
public void setFloorcontent(String floorcontent) {
	this.floorcontent = floorcontent;
}
public UserModel getUser() {
	return user;
}
public void setUser(UserModel user) {
	this.user = user;
}


}
