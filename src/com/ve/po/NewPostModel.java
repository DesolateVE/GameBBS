package com.ve.po;

public class NewPostModel {

	private String posttitle;
	private int board_id;
	private int user_id;
	private int posttype;
	private int floornum;
	private String floorcontent;

	public String getPosttitle() {
		return posttitle;
	}

	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getPosttype() {
		return posttype;
	}

	public void setPosttype(int posttype) {
		this.posttype = posttype;
	}

	public int getFloornum() {
		return floornum;
	}

	public void setFloornum(int floornum) {
		this.floornum = floornum;
	}

	public String getFloorcontent() {
		return floorcontent;
	}

	public void setFloorcontent(String floorcontent) {
		this.floorcontent = floorcontent;
	}

}
