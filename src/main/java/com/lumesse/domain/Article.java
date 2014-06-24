package com.lumesse.domain;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.SqlResultSetMappings;

@NamedQueries({
	@NamedQuery(
		name  =	Article.Q.findByArticleTitle,
		query =	"SELECT a " +
				"FROM Article a " +
				"WHERE LOWER(a.articleTitle) = :articleTitle "
	)
})

@NamedNativeQueries(
		@NamedNativeQuery(
			name = Article.Q.findByArticleTitleNative,
			query = "select ARTICLE_TITLE as articleTitle " +
					"from " +
					"Article a " +
					"where a.ARTICLE_TITLE = 'title' ",
			resultSetMapping = Article.RSM.listOfStringsResult
		)
)

@SqlResultSetMappings({
	@SqlResultSetMapping(
			name = Article.RSM.listOfStringsResult,
			columns={@ColumnResult(name="articleTitle")}
	)
})

@Entity
public class Article implements java.io.Serializable{

	private static final long serialVersionUID = 1L;

	/**
	 * Class contains list of all queries related to this entity.
	 *
	 */
	public static class Q {
		public static final String findByArticleTitle = "Article.findByArticleTitle";
		public static final String findByArticleTitleNative = "Article.findByArticleTitleNative";
	}

	public static class RSM {
		public static final String listOfStringsResult = "Article.listOfStringsResult";
	}

	private Long articleId;
	private String articleTitle;
	private String articleContent;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ARTICLE_ID", unique = true, nullable = false)
	public Long getArticleId() {
		return articleId;
	}
	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	@Column(name = "ARTICLE_TITLE", unique = true, nullable = false, length = 255)
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	@Column(name = "ARTICLE_CONTENT", unique = true, nullable = false, length = 255)
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	@Override
	public String toString() {
		return "article [articleTitle=" + articleTitle + ", articleId=" + articleId
				+ ", articleContent=" + articleContent + "]";
	}
}