package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {
	
	@Insert("""
			INSERT INTO article 
				SET regDate = now()
					, updateDate = now()
					, title = #{title}
					, content = #{content}
			""")
	public void write(String title, String content); 

	@Select("""
			select * 
				from article
				order by id desc
			""")
	public List<Article> listArticle();

	@Select("""
			select *
				from article
				where id = #{id}
			""")
	public Article getArticleById(int id);
	
	@Update("""
			<script>
			update article
				set updateDate = now()
					<if test="title != null and title !=''">
						, title = #{title}
					</if>
					<if test="content != null and content !=''">
						, content = #{content}
					</if>
				where id = #{id}
				</script>
			""")
	public void modifyArticle(int id, String title, String content); 
	
	@Delete("""
			delete from article
				where id = #{id}
			""")
	public void deleteArticle(int id);
	
	@Select("""
			select last_insert_id()
			""")
	public int getLastArticleId(); 
		
	
}