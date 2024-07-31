<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.PostDao"%>

<div class="row">

    <%

        PostDao postDao = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> list = null;

        if (cid == 0) {
            list = postDao.getAllPosts();
        } else {
            list = postDao.getPostByCatId(cid);
        }

        if (list.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Post Yet...<h3>");
            return;
        }

        for (Post post : list) {
            int length = post.getpContent().length()/3;

    %>

    <div class="col-md-6 mt-2">
        <div class="card">

            <img class="card-img-top" src="blogPics/<%= post.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= post.getpTitle() %></b>
                <p><%= post.getpContent().substring(0, length)+"..." %></p>
            </div>
            <div class="card-footer text-center login-background">
                <a href="#" class="btn btn-outline-dark btn-sm primary-background text-black"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="show_postPage.jsp?post_id=<%= post.getPid() %>" class=" btn btn-outline-dark btn-sm primary-background text-black">Read More...</a>
                <a href="#" class="btn btn-outline-dark btn-sm primary-background text-black"><i class="fa fa-commenting-o"></i><span>10</span></a>

            </div>
        </div>
    </div>

    <%        }


    %>
</div>