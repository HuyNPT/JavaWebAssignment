<%-- 
    Document   : checkoutsuccess
    Created on : Jul 13, 2021, 6:44:26 PM
    Author     : huynp
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);

            body {
                background-color: #eee;
                font-family: 'Calibri', sans-serif !important
            }

            .mt-100 {
                margin-top: 100px
            }

            .card {
                margin-bottom: 30px;
                border: 0;
                -webkit-transition: all .3s ease;
                transition: all .3s ease;
                letter-spacing: .5px;
                border-radius: 8px;
                -webkit-box-shadow: 1px 5px 24px 0 rgba(68, 102, 242, .05);
                box-shadow: 1px 5px 24px 0 rgba(68, 102, 242, .05)
            }

            .card .card-header {
                background-color: #fff;
                border-bottom: none;
                padding: 24px;
                border-bottom: 1px solid #f6f7fb;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px
            }

            .card-header:first-child {
                border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
            }

            .card .card-body {
                padding: 30px;
                background-color: transparent
            }

            .btn-primary,
            .btn-primary.disabled,
            .btn-primary:disabled {
                background-color: #4466f2 !important;
                border-color: #4466f2 !important
            }
        </style>
    </head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
  <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet"
            id="bootstrap-css"
            />


        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet"
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
            crossorigin="anonymous"
            />
  <div class="container-fluid mt-100">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>Notifications</h5>
                </div>
                <div class="card-body cart">
                    <div class="col-sm-12 empty-cart-cls text-center"> 
                    
                        <h3><strong>Checkout success</strong></h3>
                        <a href="ShowProductController" class="btn btn-primary cart-btn-transform m-3" data-abc="true">Continue shopping</a>                                </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
