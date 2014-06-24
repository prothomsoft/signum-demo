package com.lumesse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lumesse.dao.IArticleDAO;
import com.lumesse.domain.Article;
import com.lumesse.service.api.IArticleService;


/**
 * Article Service implementation
 *
 */
@Service
@Transactional
public class ArticleServiceBean implements IArticleService {

	private static final int PAGE_SIZE = 5;

	@Autowired
	IArticleDAO articleRepository;

	@Override
	public Page<Article> getArticles(Integer pageNumber, Direction sortDirection, String sortColumn) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, sortDirection, sortColumn);
        return articleRepository.findAll(request);
    }

	@Override
	public Article findByArticleTitle(String articleTitle) {
		return articleRepository.findByArticleTitle(articleTitle);
	}

	@Override
	public void delete(Long id) {
		articleRepository.delete(id);
	}

	@Override
	public Article create(Article article) {
		return articleRepository.saveAndFlush(article);
	}

	@Override
	public Article read(Long id) {
		return articleRepository.findOne(id);
	}

	@Override
	public Article update(Article article) {
		return articleRepository.save(article);
	}
}