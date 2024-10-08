<%-- 
    Document   : error_page
    Created on : Jul 28, 2024, 3:05:01 AM
    Author     : rishan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something went wrong...</title>
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body>
        <div class="container text-center">
            
            <img src="images/error.png" class="img-fluid">
            <h3 class="display-3">Sorry! Something went wrong...</h3>
            <%= exception %>
            <a class="btn primary-background btn-outline-dark btn-lg" href="index.jsp" role="button">Home</a>
            
        </div>
        
        
    </body>
</html>
