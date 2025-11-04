package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.service.ArticleService;

@Controller
public class UsrArticleController {

	private ArticleService articleService;
	
	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@GetMapping("usr/article/write")
	public String write(String title, String content) {
		
		this.articleService.write(title, content);
		
		return "usr/article/write";
	}
	
	@GetMapping("usr/article/list")
	public String list(Model model) {
		
		List<Article> articles = this.articleService.listArticle();
		
		model.addAttribute("articles", articles);
		return "usr/article/list";
	}
	
	@GetMapping("usr/article/detail")
	public String detail(Model model, int id) {
		
		Article article = this.articleService.getArticleById(id);
		if(article == null) {
			return "그 번호 게시글은 없음";
		}
		model.addAttribute("article", article);
		return "usr/article/detail";
	}
	
	
	@GetMapping("usr/article/modify")
	public String modify(Model model, int id, String title, String content) {
		
		Article article = this.articleService.getArticleById(id);
		
		if(article == null) {
			return "그 번호 게시글은 없음";
		}
		
		model.addAttribute("article", article);
		this.articleService.modifyArticle(id, title, content);
		return "usr/article/modify";
	}
	
	@GetMapping("usr/article/doModify")
	@ResponseBody
	public String doModify(Model model, int id, String title, String content) {
		
		Article article = this.articleService.getArticleById(id);
		
		if(article == null) {
			return "그 번호 게시글은 없음";
		}
		
		model.addAttribute("article", article);
		this.articleService.modifyArticle(id, title, content);
		return "<script>alert('게시글을 수정 했습니다.'); location.href='/usr/article/list'</script>";
	}
	
	
	@GetMapping("usr/article/delete")
	@ResponseBody
	public String delete(int id) {
		
		Article article = this.articleService.getArticleById(id);
		if(article == null) {
			return "그 번호 게시글은 없음";
		}		
		this.articleService.deleteArticle(id);
		return "삭제 완료";
	}
}
