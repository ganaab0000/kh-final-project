package com.example.demo.service.project;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.vo.ProjectVo;
import com.example.demo.domain.vo.RewardVo;
import com.example.demo.repository.RegistRepository;

@Service
public class RegistServiceImpl implements RegistService {

	@Autowired
	private RegistRepository projectDao;
	
	

	//임시 프로젝트 생성
	@Override
	public int createProject() {

		return projectDao.createProject();
	}

	//프로젝트 번호 가져오기
	@Override
	public int selectThisProject() {
		return projectDao.selectThisProject();
	}

	@Override
	public int insertProject(ProjectVo project, MultipartFile uploadfile1, MultipartFile uploadfile2,
			MultipartFile uploadfile3, HttpServletRequest req) {

		String thumbImageName = null;
		String artistImageName = null;
		String mainImageName = null;
		
		ProjectVo originFiles = projectDao.getOriginFile(project.getId());
		
		String file1 = "";
		String file2 = "";
		String file3 = "";
		
		try {
			file1 = originFiles.getThumbImg();
			file2 = originFiles.getWriterProfileImg();
			file3 = originFiles.getMainImg();
		} catch(Exception e) {
			e.printStackTrace();
		}
		if (uploadfile1 != null && !uploadfile1.getOriginalFilename().equals("")) {
			thumbImageName = renameFile(project, uploadfile1, 1);
			project.setThumbImg((thumbImageName));
		}
		if (uploadfile2 != null && !uploadfile2.getOriginalFilename().equals("")) {
			artistImageName = renameFile(project, uploadfile2, 2);
			project.setWriterProfileImg((artistImageName));
		}
		if (uploadfile1 != null && !uploadfile1.getOriginalFilename().equals("")) {
			mainImageName = renameFile(project, uploadfile1, 3);
			project.setMainImg((mainImageName));
		}
		int result = projectDao.insertProject(project);
		if(result > 0) {
			if (thumbImageName != null) {
				deleteFile(file1, req, 1);
				result = saveFile(thumbImageName, uploadfile1, req, 1);
			}
			if (artistImageName != null && result > 0) {
				deleteFile(file1, req, 2);
				result = saveFile(artistImageName, uploadfile2, req, 2);
			}
			if (mainImageName != null && result > 0) {
				deleteFile(file1, req, 3);
				result = saveFile(mainImageName, uploadfile3, req, 3);
			}
			if (file3 != null && !file3.contains("artist")) {
				deleteFile(file3, req, 3);
			}
			
		}
		
		return result;
	}
	public String renameFile(ProjectVo project, MultipartFile file, int select) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
		
		String originFilename = file.getOriginalFilename();
		String renameFilename = "";
		
		if (select == 1) {
			renameFilename = project.getId() + "_" + sdf.format(new Date()) + "_thumb" + originFilename.substring(originFilename.lastIndexOf("."));
		}
		if (select == 2) {
			renameFilename = project.getId() + "_" + sdf.format(new Date()) + "_artist" + originFilename.substring(originFilename.lastIndexOf("."));
		}
		if (select == 3) {
			renameFilename = project.getId() + "_" + sdf.format(new Date()) + "_main" + originFilename.substring(originFilename.lastIndexOf("."));
		}
		return renameFilename;
	}
	
	private void deleteFile(String originFile, HttpServletRequest req, int select) {
		String root = req.getSession().getServletContext().getRealPath("resources");
		String path = "";
		if(select == 1) {
			path = root + "\\images\\thumbImg\\" + originFile;
		}
		else if(select == 2) {
			path = root + "\\images\\artistImg\\" + originFile;
		}
		else if(select == 3) {
			path = root + "\\images\\mainImg\\" + originFile;
		}
		File deleteFile = new File(path);
		if (deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	public int saveFile(String filename, MultipartFile uploadfile, HttpServletRequest req, int select) {
		String root = req.getSession().getServletContext().getRealPath("resources");
		String savepath = "";
		
		if(select == 1) {
			savepath = root + "\\images\\thumbImg\\";
		}
		else if(select == 2) {
			savepath = root + "\\images\\artistImg\\";
		}
		else if(select == 3) {
			savepath = root + "\\images\\mainImg\\";
		}
		
		File folder = new File(savepath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		String filepath = folder + "\\" + filename;
		
		int result = 0;
		try {
			uploadfile.transferTo(new File(filepath));
			result = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	@Override
	public ArrayList<RewardVo> selectRewardList(String reward) {
		String[] rewardTmp = reward.split("/");
		ArrayList<String> rewardList = new ArrayList<>(Arrays.asList(rewardTmp));
		
		return projectDao.selectRewardList(rewardList);
	}
	@Override
	public int insertReward(RewardVo reward) {
		return projectDao.insertReward(reward);
	}
	
//	@Override
//	public ProjectVo selectProjectS(int id) {
//		return projectDao.selectProjectS(id);
//	}
	public ProjectVo selectCurrentProject(int id) {
		return projectDao.selectCurrentProject(id);
	}
	
	@Override
	public int deleteRewards(int id) {
		return projectDao.deleteRewards(id);
	}
	public ArrayList<RewardVo> selectCurrentReward(int id) {
		return projectDao.selectCurrentReward(id);
	}

	
}
