package com.example.demo.service.project;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.ProjectCategoryDto;
import com.example.demo.domain.dto.ProjectDto;
import com.example.demo.domain.dto.ProjectStatusCategoryDto;
import com.example.demo.domain.dto.VoteDto;
import com.example.demo.domain.vo.ProjectFilteringVo;
import com.example.demo.domain.vo.ProjectVo;
import com.example.demo.repository.ProjectCategoryRepository;
import com.example.demo.repository.ProjectRepository;
import com.example.demo.repository.ProjectStatusCategoryRepository;
import com.example.demo.repository.VoteRepository;

@Service
public class ProjectServiceImpl implements ProjectService{
	@Autowired
	private ProjectRepository projectRepository;
	@Autowired
	private ProjectCategoryRepository projectCategoryRepository;
	@Autowired
	private ProjectStatusCategoryRepository projectStatusCategoryRepository;
	@Autowired
	private VoteRepository voteRepository;
	
	@Override
	public void getListForMain() {
		Map<String, List<ProjectDto>> listMap = new HashMap<String, List<ProjectDto>>();
		listMap.put("new", null);
		listMap.put("prelunching", null);
	}
	
	@Override
	public List<ProjectVo> getList(ProjectFilteringVo filter) {
		List<ProjectVo> list = projectRepository.findByFilter(filter);
		list.stream()
			.forEach(vo->{
				LocalDateTime now = LocalDateTime.now();
				LocalDateTime closed = Instant.ofEpochMilli( vo.getDateProjectClosed().getTime() )
                        .atZone( ZoneId.systemDefault() )
                        .toLocalDateTime();
				
				Long remainTime = ChronoUnit.DAYS.between(now, closed);
				String suffix = "일";
				if(remainTime==0) {
					remainTime = ChronoUnit.HOURS.between(now, closed);
					suffix = "시간";
				}
				if(remainTime==0) {
					remainTime = ChronoUnit.MINUTES.between(now, closed);
					suffix = "분";
				}
				vo.setRemainTime(remainTime + suffix);
				
			});
		return list;
	}
	
	@Override
	public ProjectVo getDetail(int id) {
		
		ProjectVo projectVo = projectRepository.findById(id);
		
		//잔여일
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime closed = Instant.ofEpochMilli( projectVo.getDateProjectClosed().getTime() )
		                            .atZone( ZoneId.systemDefault() )
		                            .toLocalDateTime();
		Long remainTime = ChronoUnit.DAYS.between(now, closed);
		String suffix = "일";
		if(remainTime==0) {
			remainTime = ChronoUnit.HOURS.between(now, closed);
			suffix = "시간";
		}
		if(remainTime==0) {
			remainTime = ChronoUnit.MINUTES.between(now, closed);
			suffix = "분";
		}
		projectVo.setRemainTime(remainTime + suffix);

		return projectVo;
	}
	
	@Override
	public int getTotalCount(ProjectFilteringVo filter) {
		return projectRepository.getTotalCount(filter);
	}
	
	@Override
	public List<ProjectCategoryDto> getCategory(){
		return projectCategoryRepository.findAll();
	}
	@Override
	public List<ProjectStatusCategoryDto> getStatus() {
		return projectStatusCategoryRepository.findAll();
	}
	
	@Override
	public String getStory(int id) {
		return projectRepository.getStory(id);
	}
	
	@Override
	public int getLike(VoteDto voteDto) {
		return voteRepository.get(voteDto);
	}
	
	@Override
	public int updateLike(VoteDto voteDto) {
		int result = voteRepository.get(voteDto);
		if(result == 0) {
			voteRepository.save(voteDto);
			return 1;
		} else {
			voteRepository.delete(voteDto);
			return 0;
		}
	}
	@Override
	public List<ProjectVo> getLiked(ProjectFilteringVo filter) {
		List<ProjectVo> list = projectRepository.findLiked(filter);
		list.stream()
			.forEach(vo->{
				LocalDateTime now = LocalDateTime.now();
				LocalDateTime closed = Instant.ofEpochMilli( vo.getDateProjectClosed().getTime() )
                        .atZone( ZoneId.systemDefault() )
                        .toLocalDateTime();
				
				Long remainTime = ChronoUnit.DAYS.between(now, closed);
				String suffix = "일";
				if(remainTime==0) {
					remainTime = ChronoUnit.HOURS.between(now, closed);
					suffix = "시간";
				}
				if(remainTime==0) {
					remainTime = ChronoUnit.MINUTES.between(now, closed);
					suffix = "분";
				}
				vo.setRemainTime(remainTime + suffix);
			});
		return list;
	}
	
	@Override
	public int getLikedCount(ProjectFilteringVo filter) {
		return projectRepository.getLikedCount(filter);
	}
	
	@Override
	public int joinedProjectCount(int memberId) {
		return projectRepository.joinedProjectCount(memberId);
	}
	
	@Override
	public int createdProjectCount(int memberId) {
		return projectRepository.createdProjectCount(memberId);
	}
	
	@Override
	public List<ProjectVo> carousel() {
		return projectRepository.carousel();
	}
}
