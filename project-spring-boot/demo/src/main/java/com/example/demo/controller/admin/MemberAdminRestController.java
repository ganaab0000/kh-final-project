package com.example.demo.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.controller.exception.RestInternalErrorCodeException;
import com.example.demo.domain.vo.MemberDetailVo;
import com.example.demo.domain.vo.RoleCheckVo;
import com.example.demo.service.NotificationServiceImpl;
import com.example.demo.service.member.AdminMemberServiceImpl;
import com.example.demo.service.member.MemberServiceImpl;
import com.example.demo.service.member.RoleCategoryServiceImpl;
import com.example.demo.util.LogUtil;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class MemberAdminRestController {
	private LogUtil logUtil;
	private MemberServiceImpl memberServiceImpl;
	private RoleCategoryServiceImpl roleCategoryServiceImpl;
	private NotificationServiceImpl notificationServiceImpl;
	private AdminMemberServiceImpl adminMemberServiceImpl;

	// 차단
	@PutMapping("/api/admin/member/block")
	public Map<String, String> updateBlock(int memberId, HttpServletRequest request) {
		logUtil.defaultLog(request);
		int isSuccess = memberServiceImpl.updateIsBlocked(memberId);
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("isSuccess", (new Boolean(isSuccess == 1)).toString());
		return jsonMap;
	}

	// role list
	@GetMapping("/api/admin/member")
	public MemberDetailVo getMember(int memberId, HttpServletRequest request) throws Exception {
		logUtil.defaultLog(request);
		Optional<MemberDetailVo> opMemberVo = adminMemberServiceImpl.findMemberDetailById(memberId);
		if (!opMemberVo.isPresent())
			throw new RestInternalErrorCodeException();
		return opMemberVo.get();
	}

	// role list
	@GetMapping("/api/admin/member/role")
	public List<RoleCheckVo> getRole(int memberId, HttpServletRequest request) {
		logUtil.defaultLog(request);
		List<RoleCheckVo> roleCheckVoList = roleCategoryServiceImpl.findAllRoleByMemberId(memberId);
		return roleCheckVoList;
	}

	// save role
	@PostMapping("/api/admin/member/role")
	public Map<String, String> postRole(int memberId, int roleCategoryId, HttpServletRequest request) {
		logUtil.defaultLog(request);
		int isSuccess = roleCategoryServiceImpl.save(memberId, roleCategoryId);
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("isSuccess", (new Boolean(isSuccess == 1)).toString());
		return jsonMap;
	}

	// delete role
	@DeleteMapping("/api/admin/member/role")
	public Map<String, String> delRole(int memberId, int roleCategoryId, HttpServletRequest request) {
		logUtil.defaultLog(request);
		int isSuccess = roleCategoryServiceImpl.delete(memberId, roleCategoryId);
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("isSuccess", (new Boolean(isSuccess == 1)).toString());
		return jsonMap;
	}

	// save notification
	@PostMapping("/api/admin/member/notification")
	public Map<String, String> postNotification(int memberId, String content, HttpServletRequest request) {
		logUtil.defaultLog(request);
		int isSuccess = notificationServiceImpl.save(memberId, content);
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("isSuccess", (new Boolean(isSuccess == 1)).toString());
		return jsonMap;
	}
}
