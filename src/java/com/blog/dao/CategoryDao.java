/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.dao;

import com.blog.entities.Category;
import java.sql.*;

/**
 *
 * @author rishan
 */
public class CategoryDao {

    private Connection con;

    public CategoryDao(Connection con) {
        this.con = con;
    }

    public Category getCategoryByCatId(int catId) {

        Category category = null;
        
        try {
//            String name = "";
            String query = "select name from categories where cid=?";

            PreparedStatement preparedStatement = this.con.prepareStatement(query);
            preparedStatement.setInt(1, catId);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            if(rs.next()){
               category = new Category();
               
               category.setName(rs.getString("name"));
               category.setDescription(rs.getString("description"));
               
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return category;
    }

}
