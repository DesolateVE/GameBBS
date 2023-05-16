package com.ve.po;

public class PostModel {
private int pid;
private String posttitle;
private int user_id;
private String posttime;
private int postheat;
private int posttype;
private int board_id;
private UserModel user;

public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public String getPosttitle() {
	return posttitle;
}
public void setPosttitle(String posttitle) {
	this.posttitle = posttitle;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public String getPosttime() {
	return posttime;
}
public void setPosttime(String posttime) {
	this.posttime = posttime;
}
public int getPostheat() {
	return postheat;
}
public void setPostheat(int postheat) {
	this.postheat = postheat;
}
public int getPosttype() {
	return posttype;
}
public void setPosttype(int posttype) {
	this.posttype = posttype;
}
public int getBoard_id() {
	return board_id;
}
public void setBoard_id(int board_id) {
	this.board_id = board_id;
}
public UserModel getUser() {
	return user;
}
public void setUser(UserModel user) {
	this.user = user;
}
}
