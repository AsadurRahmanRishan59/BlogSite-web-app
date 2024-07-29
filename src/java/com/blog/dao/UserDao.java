package com.blog.dao;

/**
 *
 * @author rishan
 */
import com.blog.entities.User;
import java.sql.*;


public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to database
    
    public boolean saveUser(User user){
        
        boolean f = false;
        
        try{
            
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            
            PreparedStatement pstatement = this.con.prepareStatement(query);
            
            pstatement.setString(1,user.getName());
            pstatement.setString(2,user.getEmail());
            pstatement.setString(3,user.getPassword());
            pstatement.setString(4,user.getGender());
            pstatement.setString(5,user.getAbout());
            
            pstatement.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    //get user by email and password
    public User getUserByEmailandPassword(String email, String password){
         
        User user = null;
        
        try{
            
            String query = "select * from user where email =? and password=?";
            PreparedStatement pstatement = con.prepareStatement(query);
            
            pstatement.setString(1, email);
            pstatement.setString(2, password);
            
            ResultSet rs = pstatement.executeQuery();
            
            if(rs.next()){
                
                user = new User();
                
                String name = rs.getString("name");
                user.setName(name);
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
   
        
        return user;
    }
    
    //update user details
    
    public boolean updateUser(User user){
        
        boolean f = false;
        
        try{
            
            String query = "update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
            PreparedStatement pstatement = con.prepareStatement(query);
            
            pstatement.setString(1, user.getName());
            pstatement.setString(2, user.getEmail());
            pstatement.setString(3, user.getPassword());
            pstatement.setString(4, user.getGender());
            pstatement.setString(5, user.getAbout());
            pstatement.setString(6, user.getProfile());
            pstatement.setInt(7, user.getId());
            
            pstatement.executeUpdate();
            
            f= true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
}
