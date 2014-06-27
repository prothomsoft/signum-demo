package com.lumesse.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lumesse.service.api.IUserService;

@Controller
@RequestMapping("/")
public class UserController {

	@Autowired
	IUserService userService;

	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String indexView(Model model) {
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
						@RequestParam(value = "logout", required = false) String logout, Model model, Locale locale) {
		if (error != null) {
			model.addAttribute("error", "Invalid username or password!");
			if(locale.getLanguage().equals("pl")) {
				model.addAttribute("error", "Niewlasciwa nazwa uzytkownika lub haslo!");
			}
		}
		if (logout != null) {
			model.addAttribute("msg", "You've been logged out successfully.");
			if(locale.getLanguage().equals("pl")) {
				model.addAttribute("msg", "Udane wylogowanie z systemu.");
			}
		}
		return "login";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accesssDenied(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			model.addAttribute("username", userDetail.getUsername());
		}
		return "status403";
	}
}