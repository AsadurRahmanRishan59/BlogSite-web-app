<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.PostDao"%>

<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");

    }


%>

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
            int length = post.getpContent().length() / 3;

    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            
            <div>
                <img class="card-img-top" src="blogPics/<%= post.getpPic()%>" alt="Card image cap">
            </div>
            
            <div class="card-body">
                <b><%= post.getpTitle()%></b>
                <p><%= post.getpContent().substring(0, length) + "..."%></p>
            </div>
            <div class="card-footer text-center login-background">

                <%
                    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
                    int count = likeDao.countLikeOnPost(post.getPid());
                %>

                <a href="#" onclick="doLike(<%= post.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-dark btn-sm primary-background text-black"><i class="fa fa-thumbs-o-up"></i><span><%= count %></span></a>
                <a href="show_postPage.jsp?post_id=<%= post.getPid()%>" class=" btn btn-outline-dark btn-sm primary-background text-black">Read More...</a>
                <a href="#" class="btn btn-outline-dark btn-sm primary-background text-black"><i class="fa fa-commenting-o"></i><span>10</span></a>

            </div>
        </div>
    </div>

    <%        }


    %>
</div>

<script>
    function doLike(pid, userId) {
    console.log(pid + ',' + userId);

    const d = {
        userId: userId,
        pid: pid,
        operation: 'like'
    };

    $.ajax({

        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
}
</script>