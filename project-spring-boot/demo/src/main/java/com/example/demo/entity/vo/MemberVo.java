package com.example.demo.entity.vo;

import java.util.Date;

public class MemberVo {
	private int id;
	private String email;
	private String nickname;
	private String pwd;
	private String is_email_verified;
	private String is_deleted;
	private Date date_loggedin;
	private Date date_created;
	private Date date_updated;
	private String address;
	private String phone;
	private String profile_img;
	private String profile_txt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getIs_email_verified() {
		return is_email_verified;
	}
	public void setIs_email_verified(String is_email_verified) {
		this.is_email_verified = is_email_verified;
	}
	public String getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
	public Date getDate_loggedin() {
		return date_loggedin;
	}
	public void setDate_loggedin(Date date_loggedin) {
		this.date_loggedin = date_loggedin;
	}
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	public Date getDate_updated() {
		return date_updated;
	}
	public void setDate_updated(Date date_updated) {
		this.date_updated = date_updated;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getProfile_txt() {
		return profile_txt;
	}
	public void setProfile_txt(String profile_txt) {
		this.profile_txt = profile_txt;
	}
}
