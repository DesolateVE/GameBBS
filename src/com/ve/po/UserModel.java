package com.ve.po;

public class UserModel {
private int uid;
private String username;
private int sex;  /* 0=男，1=女 */
private String email;
private int power; /* 0=板块管理，1=大会员，2=普通会员 */
private String password;
private String registertime;
private String underwrite;
private String birthdate;  /*年龄由出生日期计算得出，不需要用户填写，用户填写的出生日期转换为整形储存，取出时分段计算取值*/
private int experience;   /*发帖，回帖增加经验值，用户等级有经验值分层判定，这里只记录总经验值，等级显示由页面计算显示*/
private String headphoto;
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public int getSex() {
	return sex;
}
public void setSex(int sex) {
	this.sex = sex;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getPower() {
	return power;
}
public void setPower(int power) {
	this.power = power;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getRegistertime() {
	return registertime;
}
public void setRegistertime(String registertime) {
	this.registertime = registertime;
}
public String getUnderwrite() {
	return underwrite;
}
public void setUnderwrite(String underwrite) {
	this.underwrite = underwrite;
}
public String getBirthdate() {
	return birthdate;
}
public void setBirthdate(String birthdate) {
	this.birthdate = birthdate;
}
public int getExperience() {
	return experience;
}
public void setExperience(int experience) {
	this.experience = experience;
}
public String getHeadphoto() {
	return headphoto;
}
public void setHeadphoto(String headphoto) {
	this.headphoto = headphoto;
}

}
