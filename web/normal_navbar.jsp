<%@page import="com.blog.dao.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.PostDao"%>
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

                    <%
                        PostDao postdaon = new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> listn = postdaon.getCategories();

                        for (Category category : listn) {
                    %>

                    <a class="dropdown-item" href="#"><%= category.getName()%></a>

                    <%
                        }
                    %>

                    

                </div>

            </li>


            <li class="nav-item">
                <a class="nav-link" href="Contact.jsp"><span class="fa fa-id-card"></span> Contact</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-sign-in"></span> Login</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="registar_page.jsp"><span class="fa fa-user-plus"></span> Sign Up</a>
            </li>


        </ul>

        <form class="form-inline my-2 my-lg-0">

            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-dark my-2 my-sm-0" type="submit text-black">Search</button>

        </form>

    </div>
</nav>

