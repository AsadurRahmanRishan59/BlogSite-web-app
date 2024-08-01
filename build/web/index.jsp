<%-- 
    Document   : index
    Created on : Jul 17, 2024, 4:46:02 PM
    Author     : rishan
--%>
<%@page import="com.blog.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.dao.LikeDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .background-image{
                background:url(images/back2.avif);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>

    </head>
    <body>

        <!--navbar-->

        <%@include file="normal_navbar.jsp" %>
        <div class="background-image">
            <!--banner-->

            <div class = "container-fluid p-0 m-0 banner-background">

                <div class="jumbotron primary-background text-black">

                    <div class="container">

                        <h3 class="display-3">Welcome to Blog for Everything</h3>

                        <p>Welcome to "The Blog for Everything" – your one-stop destination for a diverse array of topics that pique curiosity, ignite passions, and inspire conversations. Whether you're here to explore new interests, deepen your knowledge, or simply enjoy a good read, we have something for everyone.</p> 

                        <a class="btn btn-outline-dark btn-lg" href="registar_page.jsp" role="button"><span class="fa fa-user-circle-o"> </span>Start Your Journey</a>
                        <a class="btn btn-outline-dark btn-lg" href="login_page.jsp" role="button"><span class="fa fa-sign-in"> </span>Login</a>
                    </div>

                </div>

            </div>


            <!--cards-->

            <div class="container">

                <div class="row mb-2">

                    <%        PostDao postDao = new PostDao(ConnectionProvider.getConnection());

                        List<Post> list = postDao.getAllPosts();

                        if (list.size() == 0) {
                            out.println("<h3 class='display-3 text-center'>No Post Yet...<h3>");
                            return;
                        }
                        int count = 0;
                        for (Post post : list) {
                            int length = post.getpContent().length() / 3;
                            if (count == 6) {
                                return;
                            }
                            count++;

                    %>

                    <div class="col-md-4 mt-2">
                        <div class="card">
                            <div>
                                <img class="card-img-top" src="blogPics/<%= post.getpPic()%>" alt="Card image cap">
                            </div>
                            <div class="card-body">
                                <h2 class="card-title"><%= new CategoryDao(ConnectionProvider.getConnection()).getCategoryByCatId(post.getCatId()).getName()%></h2>
                                <p class="card-text"><b><%= post.getpTitle()%></b></p>
                                <a href="show_postPage.jsp?post_id=<%= post.getPid()%>" class="btn btn-outline-dark primary-background text-black">Read More</a>
                            </div>

                        </div>
                    </div>

                    <%        }


                    %>
                </div>


            </div>
        </div>

































        <!--java scripts-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>


    </body>
</html>
