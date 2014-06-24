package com.lumesse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lumesse.dao.IUserDAO;
import com.lumesse.domain.User;
import com.lumesse.service.api.IUserService;

/**
 * User Service implementation
 *
 */
@Service
@Transactional
public class UserServiceBean implements IUserService{

	@Autowired
	IUserDAO userRepository;

	@Override
	public User create(User user) {
		return userRepository.save(user);
	}
}
