<%-- 
    Document   : registar_page
    Created on : Jul 18, 2024, 1:11:39 AM
    Author     : rishan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>



    <body>

        <%@include file="normal_navbar.jsp" %>

        <br>
        <main class="d-flex align-items-center primary-background2">

            <div class="container">

                <div class="col-md-5 offset-md-3">

                    <div class="card">

                        <div class="card-header primary-background text-black text-center">

                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register Here 

                        </div>

                        <div class="card-body login-background text-white">

                            <form id="reg-form" action="RegisterServlet" method="post">

                                <div class="form-group">

                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" 
                                           aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>


                                <div class="form-group">

                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp" placeholder="Enter email">

                                    <small id="emailHelp" class="form-text text-white">
                                        We'll never share your email with anyone else.</small>

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" 
                                           id="exampleInputPassword1" 
                                           placeholder="Password">
                                </div>

                                <div class="form-group">

                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="male">Male
                                    <input type="radio" id="gender" name="gender" value="female">female

                                </div>

                                <div class="form-group">

                                    <textarea name="about" class="form-control" id="" rows="3" 
                                              placeholder="Enter something about yourself"></textarea>

                                </div>


                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms & conditions</label>
                                </div>
                                <br> 

                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait..</h4>


                                </div>

                                <button class="btn btn-light my-2 my-sm-0 primary-background" 
                                        type="submit">Sign Up</button>

                            </form>


                        </div>

                        <div class="card-footer">

                        </div>

                    </div>

                </div>
            </div>

        </main>



        <!--java scripts-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


        <script>

            $(document).ready(function () {
                console.log("loaded...");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();


                    //send RegisterServlet

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'post',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            if(data.trim()==='done'){

                            swal("registered successfully..we redirecting to login page")
                                    .then((value) => {
                                        window.location = "profile.jsp"
                                    });
                            }else{
                                swal(data);
                            }
                        },
                        error: function (data, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();

                            swal("something went wrong...try again");
                            
                        },
                        processData: false,
                        contentType: false
                    })

                })
            })

        </script>

    </body>
</html>
