package com.lumesse.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.lumesse.dao.IUserDAO;
import com.lumesse.domain.Permission;
import com.lumesse.domain.Role;
import com.lumesse.domain.User;

/**
 * Database authorization user, role, permission model
 *
 */
@Component
public class UserDetailsServiceBean implements UserDetailsService {

	@Autowired
	IUserDAO userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		User user = userRepository.findByUsername(username);
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (Role role : user.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getName()));
			for (Permission permission : role.getPermissions()) {
				authorities.add(new SimpleGrantedAuthority(permission.getName()));
			}
		}
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), true, true, true, true, authorities);
	}

}