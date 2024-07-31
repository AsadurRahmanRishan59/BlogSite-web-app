<%-- 
    Document   : show_postPage
    Created on : Jul 31, 2024, 5:25:43 AM
    Author     : rishan
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.blog.dao.UserDao"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");

    }


%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());

    Post post = postDao.getPostByPostId(postId);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            
            .post-title{
                font-weight: 100;
            }
            .post-content{
                font-weight:100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
                font-weight: bold;
            }
            .row-user{
                border: 1px solid #2F4858;
                padding-top: 15px;
            }
            body{
                background:url(images/back2.avif);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        
        <title><%= post.getpTitle()%></title>
    </head>
    <body>
        <!--navbar-->

        <nav class="navbar navbar-expand-lg navbar-light primary-background">

            <a class="navbar-brand" href="index.jsp"><span class="fa fa-book"> Blog For Everything </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">

                <span class="navbar-toggler-icon"></span>

            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <ul class="navbar-nav mr-auto">

                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp">
                            <span class="fa fa-home"></span> Home <span class="sr-only">(current)</span>
                        </a>
                    </li>


                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                            <%                                PostDao postdaon = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> listn = postdaon.getCategories();

                                for (Category category : listn) {
                            %>

                            <a class="dropdown-item" href="#"><%= category.getName()%></a>

                            <%
                                }
                            %>

                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structures</a>

                        </div>

                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-id-card"></span> Contact</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-edit"></span> Do Post</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
                    </li>
                </ul>

            </div>
        </nav
        <!--end of navbar-->

        <!--end of navbar-->

        <!--main part-->
        <main>

            <div class="container">
                <div class="row my-4">
                    <div class="col-md-8 offset-md-2">

                        <div class="card">
                            <div class="card-header login-background text-white">

                                <h3 class="post-title"><%= post.getpTitle()%></h3>

                            </div>

                            <div class="card-body">
                                <img class="card-img-top" src="blogPics/<%= post.getpPic()%>" alt="Card image cap">
                                
                                <div class="row my-3 row-user">
                                    <div class="col-md-8">
                                        
                                        <% 
                                            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                                        %>
                                        
                                        <p class="post-user-info">Author: <a href="#"><%= userDao.getUserByUserId(post.getUserId()).getName() %></a></p>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <p class="post-date"><%= DateFormat.getDateTimeInstance().format(post.getpDate()) %></p>
                                    </div>
                                </div>
                                
                                <p class="post-content my-4"><%= post.getpContent()%></p>
                            </div>

                            <div class="card-footer login-background">
                                <a href="#" class="btn btn-warning btn-sm text-black"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                                <a href="#" class="btn btn-warning btn-sm text-black"><i class="fa fa-commenting-o"></i><span>10</span></a>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </main>
        <!--end of main part-->

        <!--profile modal-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-black text-center">
                        <h5 class="modal-title" id="exampleModalLabel">User Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text text-center">
                            <img src="profilePics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--details-->
                            <div id="profile-details">

                                <table class="table">

                                    <tbody>

                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%= user.getId()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Status</th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Registered On</th>
                                            <td><%= user.getDateTime().toString()%></td>
                                        </tr>

                                    </tbody>
                                </table>

                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display:none">
                                <h4 class="mt-2"> Please Edit Carefully</h4>

                                <form action="EditServlet" method="post" enctype="multipart/form-data">

                                    <table class="table">

                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>New Picture:</td>
                                            <td>
                                                <input type="file" class="form-control" name="profile_pic">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td>
                                                <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" >

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td>
                                                <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" >

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td>
                                                <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" >

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>Status :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_status"><%= user.getAbout()%>"
                                                </textarea>

                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-success">Save</button>
                                    </div>
                                </form>

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-light primary-background">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile modal-->

        <!--add post modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Write your post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control"name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao postdao = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postdao.getCategories();

                                        for (Category category : list) {
                                    %>

                                    <option value="<%= category.getCid()%>"><%= category.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Post Title" class="form-control">
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Body" style="height:300px;"></textarea>
                            </div>

                            <label>Upload related photo</label>
                            <div class="form-group">
                                <input name="pic" type="file">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-success">Post</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!--end of add post modal-->


        <!--java scripts-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            //add post js

            $(document).ready(function () {

                $('#add-post-form').on("submit", function (event) {

                    //this code gets called when form is submitted

                    event.preventDefault();
                    console.log("done");

                    let form = new FormData(this);

                    //now requesting to server

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,

                        success: function (data, textStatus, jqXHR) {
                            //success
                            if (data.trim() === 'done') {

                                swal("Good job!", "A New Blog has been Posted!", "success")
                                        .then((value) => {
                                            window.location = "profile.jsp";
                                        });

                            } else {
                                swal("Error!", "Something went wrong!", "error");

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Error!", "Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    });

                });

            });



        </script>

        <!--edit profile-->
        <script>

            $(document).ready(function () {

                let editStatus = false;

                $('#edit-profile-btn').click(function () {

                    if (editStatus === false) {
                        $('#profile-details').hide();
                        $('#profile-edit').show();

                        editStatus = true;
                        $(this).text('Back');

                    } else {
                        $('#profile-details').show();
                        $('#profile-edit').hide();

                        editStatus = false;
                        $(this).text('Edit');
                    }

                });

            });

        </script>
    </body>
</html>
