
package com.blog.dao;

import com.blog.entities.Category;
import com.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author rishan
 */

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getCategories(){
        
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            
            String query = "select * from categories";
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            
            while(rs.next()){
                
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                
                Category category = new Category(cid, name, description);
                list.add(category);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post post){
        boolean f = false;
        
        try{
            
            String query = "insert into posts(pTitle,pContent,pPic,catId,userId) values(?,?,?,?,?)";
            
            PreparedStatement pstStatement = con.prepareStatement(query);
            
            pstStatement.setString(1, post.getpTitle());
            pstStatement.setString(2, post.getpContent());
            pstStatement.setString(3, post.getpPic());
            pstStatement.setInt(4, post.getCatId());
            pstStatement.setInt(5, post.getUserId());
            
            pstStatement.executeUpdate(); 
            
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
}
