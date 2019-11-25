package com.duant.rcpy.service;

import com.duant.rcpy.domain.User;

public interface UserService {
	
	/**
	 * Í¨¹ýuserid²éÑ¯User
	 * @param userid
	 * @return User
	 */
	public User selectByPrimaryKey(Integer userid);
}
