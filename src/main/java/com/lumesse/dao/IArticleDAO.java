package com.lumesse.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.lumesse.domain.Article;

public interface IArticleDAO extends JpaRepository<Article, Long> {
	 public Article findByArticleTitle(@Param("articleTitle") String articleTitle);
}