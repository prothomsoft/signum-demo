package com.lumesse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lumesse.domain.Article;
import com.lumesse.dto.RestResponseDTO;
import com.lumesse.service.api.IArticleService;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {

	@Autowired
	IArticleService articleService;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addArticleForm(Model model) {
		model.addAttribute("article", new Article());
		return "/article/add";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody RestResponseDTO addArticleAction(@ModelAttribute("article") Article article, Model model) {
		articleService.create(article);
		return new RestResponseDTO("Response");
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/edit/{articleId}", method=RequestMethod.GET)
	public String editArticleForm(@PathVariable Long articleId, Model model) {
		model.addAttribute("article", articleService.read(articleId));
		return "/article/edit";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/edit", method=RequestMethod.POST)
	public @ResponseBody RestResponseDTO editArticleAction(@ModelAttribute("article") Article article, Model model) {
		articleService.update(article);
		return new RestResponseDTO("Response");
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/delete/{articleId}", method=RequestMethod.GET)
	public String deleteArticleAction(@PathVariable Long articleId, Model model) {
		articleService.delete(articleId);
		return "redirect:/article/list";
	}

	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
	@RequestMapping(value = "/list/{pageNumber}/{sortDirection}/{sortColumn}", method = RequestMethod.GET)
	public String getArticleList(@PathVariable Integer pageNumber, @PathVariable Direction sortDirection, @PathVariable String sortColumn, Model model) {
	    getArticlesWithParams(pageNumber, sortDirection, sortColumn, model);
	    Article article = new Article();
		model.addAttribute("article", article);
	    return "/article/list";
	}

	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String addArticleListDefault(Model model) {
		getArticlesWithParams(1, Direction.ASC, "articleId", model);
		return "/article/list";
	}

	private void getArticlesWithParams(Integer pageNumber, Direction sortDirection, String sortColumn, Model model) {
		Page<Article> page = articleService.getArticles(pageNumber, sortDirection, sortColumn);
	    int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 5);
	    int end = Math.min(begin + 10, page.getTotalPages());
	    List<Article> content = page.getContent();
	    model.addAttribute("articleLog", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
	    model.addAttribute("articleList", content);
	    model.addAttribute("sortDirection", sortDirection);
	    model.addAttribute("sortColumn", sortColumn);
	}
}