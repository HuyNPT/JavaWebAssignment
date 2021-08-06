<%-- 
    Document   : login
    Created on : Jul 7, 2021, 2:05:48 PM
    Author     : huynp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: "Lato", sans-serif;
            }

            .main-head {
                height: 150px;
                background: #fff;
            }

            .sidenav {
                height: 100%;
                background-color: #000;
                overflow-x: hidden;
                padding-top: 20px;
            }

            .main {
                padding: 0px 10px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }
            }

            @media screen and (max-width: 450px) {
                .login-form {
                    margin-top: 10%;
                }

                .register-form {
                    margin-top: 10%;
                }
            }

            @media screen and (min-width: 768px) {
                .main {
                    margin-left: 40%;
                }

                .sidenav {
                    width: 40%;
                    position: fixed;
                    z-index: 1;
                    top: 0;
                    left: 0;
                }

                .login-form {
                    margin-top: 80%;
                }

                .register-form {
                    margin-top: 20%;
                }
            }

            .login-main-text {
                margin-top: 20%;
                padding: 60px;
                color: #fff;
            }

            .login-main-text h2 {
                font-weight: 300;
            }

            .btn-black {
                background-color: #000 !important;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet"
            id="bootstrap-css"
            />
        
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <div class="sidenav">
            <div class="login-main-text">
                <h2>
                    Application<br />
                    Login Page
                </h2>
                <p>Login or register from here to access.</p>
            </div>
        </div>
        <div class="main">
            <div class="col-md-6 col-sm-12">
                <div class="login-form">
                    <form action="CheckLoginController" method="POST">
                        <div class="form-group">
                            <label>User Name</label>
                            <input type="text" class="form-control" placeholder="User Name" name="username" required="true"/>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input
                                name ="password"
                                type="password"
                                class="form-control"
                                placeholder="Password" required="true"
                                />
                            <c:if test="${not empty requestScope.ERR}">
                                <span class="error text-danger">${requestScope.ERR}</span>
                            </c:if>
                        </div>
                        <button type="submit" class="btn btn-success">Login</button>
                    </form>
                    <a href="register.jsp">Create New Account</a>
                </div>
            </div>
        </div>
    </body>
</html>
