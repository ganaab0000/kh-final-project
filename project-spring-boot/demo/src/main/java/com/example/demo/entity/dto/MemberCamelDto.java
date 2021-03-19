package com.example.demo.entity.dto;

import java.util.Date;

public class MemberCamelDto {
	private int id;
	private String email;
	private String nickname;
	private String pwd;
	private String isEmailVerified;
	private String isDeleted;
	private Date dateLoggedin;
	private Date dateCreated;
	private Date dateUpdated;
	private String address;
	private String phone;
	private String profileImg;
	private String profileTxt;
	@Override
	public String toString() {
		return "MemberCamelDto [id=" + id + ", email=" + email + ", nickname=" + nickname + ", pwd=" + pwd
				+ ", isEmailVerified=" + isEmailVerified + ", isDeleted=" + isDeleted + ", dateLoggedin=" + dateLoggedin
				+ ", dateCreated=" + dateCreated + ", dateUpdated=" + dateUpdated + ", address=" + address + ", phone="
				+ phone + ", profileImg=" + profileImg + ", profileTxt=" + profileTxt + "]";
	}
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
	public String getIsEmailVerified() {
		return isEmailVerified;
	}
	public void setIsEmailVerified(String isEmailVerified) {
		this.isEmailVerified = isEmailVerified;
	}
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	public Date getDateLoggedin() {
		return dateLoggedin;
	}
	public void setDateLoggedin(Date dateLoggedin) {
		this.dateLoggedin = dateLoggedin;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public Date getDateUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
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
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getProfileTxt() {
		return profileTxt;
	}
	public void setProfileTxt(String profileTxt) {
		this.profileTxt = profileTxt;
	}

}
