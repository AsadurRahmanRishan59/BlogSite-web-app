package com.blog.dao;

import java.sql.*;

/**
 *
 * @author rishan
 */
public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int userId) {

        boolean f = false;

        try {

            String query = "insert into liked(pid,userId) values(?,?)";
            PreparedStatement preparedStatement = this.con.prepareStatement(query);

            preparedStatement.setInt(1, pid);
            preparedStatement.setInt(2, userId);

            preparedStatement.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;

        try {

            String query = "select count(*) from liked where pid=?";

            PreparedStatement preparedStatement = this.con.prepareStatement(query);

            preparedStatement.setInt(1, pid);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {

                count = rs.getInt("count(*)");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean isLikedByUser(int pid, int userId) {

        boolean f = false;

        try {

            String query = "Select * from liked where pid=? and userId=?";

            PreparedStatement preparedStatement = this.con.prepareStatement(query);

            preparedStatement.setInt(1, pid);
            preparedStatement.setInt(2, userId);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean deleteLoke(int pid, int userId) {

        boolean f = false;

        try {

            String query = "delete * from liked where pid=? and userId=?";

            PreparedStatement preparedStatement = this.con.prepareStatement(query);

            preparedStatement.setInt(1, pid);
            preparedStatement.setInt(2, userId);

            preparedStatement.executeQuery();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
