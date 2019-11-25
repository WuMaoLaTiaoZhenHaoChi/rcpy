package com.duant.rcpy.service;

import com.duant.rcpy.domain.Info;
import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.domain.User;

public interface EditService {
	public int editInfo(Info info);
	
	public int editSubject(Subject subject);
	
	public int editUser(User user);
}
