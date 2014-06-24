package com.lumesse.service.api;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;

import com.lumesse.domain.Article;

public interface IArticleService {

	/**
	 *
	 * @param pageNumber
	 * @return
	 */
	public Page<Article> getArticles(Integer pageNumber, Direction sortDirection, String sortColumn);

	/**
	 *
	 * @param articleTitle
	 * @return
	 */
	public Article findByArticleTitle(String articleTitle);

	/**
	 * delete
	 * @param articleId
	 * @return
	 */
	public void delete(Long id);

	/**
	 * create
	 * @param article
	 * @return
	 */
	public Article create(Article article);

	/**
	 * update
	 * @param article
	 * @return
	 */
	public Article update(Article article);

	/**
	 * read
	 * @param id
	 * @return
	 */
	public Article read(Long id);
}