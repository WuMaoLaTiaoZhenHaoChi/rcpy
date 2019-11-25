package com.duant.rcpy.service.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.duant.rcpy.domain.Info;
import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.domain.User;
import com.duant.rcpy.mapper.InfoMapper;
import com.duant.rcpy.mapper.SubjectMapper;
import com.duant.rcpy.mapper.UserMapper;
import com.duant.rcpy.service.EditService;

@Service
public class EditServiceImpl implements EditService{

	@Resource
	private InfoMapper infoMapper;
	@Resource
	private SubjectMapper subjectMapper;
	@Resource
	private UserMapper userMapper;
	
	//编辑Info
	@Override
	public int editInfo(Info info) {
		int i = 0;
		if(info.getInfoid() != null && info.getGrade() != null && 
						info.getCollege() != null && info.getSpecialty() != null) {
			Info info1 = infoMapper.selectInfoByGCS(info.getGrade(), info.getCollege(), info.getSpecialty());
			if(info1 != null)
				info.setInfoid(info1.getInfoid());
			i = infoMapper.replaceIntoInfo(info);
		}
		return i;
	}

	//编辑subject
	@Override
	public int editSubject(Subject subject) {
		int i = 0;
		if(subject.getSubjectid() != null && subject.getProperty1() != null 
				&& subject.getProperty2() != null && subject.getSubjectname() != null) {
			Subject subject1 = subjectMapper.selectSubjectByName(subject.getSubjectname());	
			if(subject1 != null) {
				subject.setSubjectid(subject1.getSubjectid());		
			}
			i = subjectMapper.replaceIntoSubject(subject);
		}
		return i;
	}

	//编辑User
	@Override
	public int editUser(User user) {
		int i = 0;
		if(user.getUserid() != null && user.getPassword() != null 
				&& user.getUsername() != null && user.getIsadmin() != null) {
			User user1 = userMapper.selectByPrimaryKey(user.getId());	
			if(user1 == null) {
				i = userMapper.replaceUser(user);		
			}	
		}
		return i;
	}
	
}
