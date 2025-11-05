package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.service.ArticleService;
import com.example.demo.util.Util;

@Controller
public class UsrArticleController {

	private ArticleService articleService;
	
	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@GetMapping("usr/article/write")
	public String write() {
		return "usr/article/write";
	}
	
	@GetMapping("usr/article/doWrite")
	@ResponseBody
	public String write(String title, String content) {
		
		this.articleService.write(title, content);
		
		int id = this.articleService.getLastArticleId();
		return Util.jsReplace(String.format("%d번 게시글을 작성 했습니다.", id), String.format("detail?id=%d", id));
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
		model.addAttribute("article", article);
		return "usr/article/detail";
	}
	
	
	@GetMapping("usr/article/modify")
	public String modify(Model model, int id) {
		
		Article article = this.articleService.getArticleById(id);
		
		model.addAttribute("article", article);
		
		return "usr/article/modify";
	}
	
	@GetMapping("usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String content) {
		
		
		this.articleService.modifyArticle(id, title, content);
		
		return Util.jsReplace(String.format("%d번 게시글을 수정 했습니다.", id), String.format("detail?id=%d", id));
	}
	
	
	@GetMapping("usr/article/delete")
	@ResponseBody
	public String delete(int id) {
		
		this.articleService.deleteArticle(id);
		return Util.jsReplace(String.format("%d번 게시글을 삭제 했습니다.", id), String.format("list"));
	}
}
