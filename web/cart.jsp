<%-- 
    Document   : cart
    Created on : Jul 5, 2021, 11:10:33 PM
    Author     : huynp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <style>
            /*
      ** Style Simple Ecommerce Theme for Bootstrap 4
      ** Created by T-PHP https://t-php.fr/43-theme-ecommerce-bootstrap-4.html
      */
            .bloc_left_price {
                color: #c01508;
                text-align: center;
                font-weight: bold;
                font-size: 150%;
            }
            .category_block li:hover {
                background-color: #007bff;
            }
            .category_block li:hover a {
                color: #ffffff;
            }
            .category_block li a {
                color: #343a40;
            }
            .add_to_cart_block .price {
                color: #c01508;
                text-align: center;
                font-weight: bold;
                font-size: 200%;
                margin-bottom: 0;
            }
            .add_to_cart_block .price_discounted {
                color: #343a40;
                text-align: center;
                text-decoration: line-through;
                font-size: 140%;
            }
            .product_rassurance {
                padding: 10px;
                margin-top: 15px;
                background: #ffffff;
                border: 1px solid #6c757d;
                color: #6c757d;
            }
            .product_rassurance .list-inline {
                margin-bottom: 0;
                text-transform: uppercase;
                text-align: center;
            }
            .product_rassurance .list-inline li:hover {
                color: #343a40;
            }
            .reviews_product .fa-star {
                color: gold;
            }
            .pagination {
                margin-top: 20px;
            }
            footer {
                background: #343a40;
                padding: 40px;
            }
            footer a {
                color: #f8f9fa !important;
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
        </style>
    </head>
    <body>
        <c:if test ="${sessionScope.USER.role != 1}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <c:if test="${not empty requestScope.UPDATEMESS}">
            <script type="text/javascript">
                var msg = "${requestScope.UPDATEMESS}"
                window.onload = function () {
                    alert(msg);
                }
            </script>
        </c:if>
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
        <jsp:include page="header.jsp"></jsp:include>
            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading">E-COMMERCE CART</h1>
                </div>
            </section>
        <c:if test="${not empty CART}">
            <div class="container mb-4">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Product</th>
                                        <th scope="col" class="text-center">Quantity</th>
                                        <th scope="col" class="text-right">Price</th>
                                        <th scope="col" class="text-right">Subtotal</th>
                                        <th scope="col" class=""></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" value = "0"/>
                                    <c:forEach items = "${CART}" var = "o">
                                        <tr>
                                    <form action="UpdateCartController" method="GET">
                                        <td><img src="${o.value.image}" /></td>
                                        <td>${o.value.name}</td>
                                        <c:set var="total" value = "${total + (o.value.quantity * o.value.price) }"/>
                                        <td><input class="form-control" type="number" value="${o.value.quantity}" name="quantity" onkeypress="return event.charCode >= 48 && event.charCode <= 57" /></td>
                                        <td class="text-right">${o.value.price} $</td>
                                        <td class="text-right">${o.value.price * o.value.quantity}$</td>
                                        <input type="hidden" name="quantityInDb" value="${o.value.quantityInDb}"/>
                                        <td class="text-right">
                                            <button class="btn btn-sm btn-info" type="submit">
                                                <i class="fa fa-pencil"></i>
                                                <input type="hidden" value="${o.value.id}" name="id">
                                            </button>
                                        </td>
                                    </form>
                                    <form action="RemoveItemCartController">
                                        <input type="hidden" value="${o.value.id}" name="id">
                                        <td class="text-right">
                                            <button type="submit" class="btn-sm btn-danger" >
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </form>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-right"><strong>Total</strong></td>
                                    <td class="text-right"><strong>${total}</strong></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col mb-2">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <form action="ShowProductController">
                                    <button class="btn btn-block btn-light">Continue Shopping</button>
                                </form>
                            </div>
                            <div class="col-sm-12 col-md-6 text-right">
                                <form action="checkout.jsp">
                                    <button class="btn btn-lg btn-block btn-success text-uppercase" type="submit">
                                        Checkout
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty CART}">
            <div class="container-fluid mt-100">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>Cart</h5>
                            </div>
                            <div class="card-body cart">
                                <div class="col-sm-12 empty-cart-cls text-center"> <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                                    <h3><strong>Your Cart is Empty</strong></h3>
                                    <a href="ShowProductController" class="btn btn-primary cart-btn-transform m-3" data-abc="true">Continue shopping</a>                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3">
                        <h5>About</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25" />
                        <p class="mb-0">
                            Le Lorem Ipsum est simplement du faux texte employé dans la
                            composition et la mise en page avant impression.
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                        <h5>Informations</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25" />
                        <ul class="list-unstyled">
                            <li><a href="">Link 1</a></li>
                            <li><a href="">Link 2</a></li>
                            <li><a href="">Link 3</a></li>
                            <li><a href="">Link 4</a></li>
                        </ul>
                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                        <h5>Others links</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25" />
                        <ul class="list-unstyled">
                            <li><a href="">Link 1</a></li>
                            <li><a href="">Link 2</a></li>
                            <li><a href="">Link 3</a></li>
                            <li><a href="">Link 4</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3">
                        <h5>Contact</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25" />
                        <ul class="list-unstyled">
                            <li><i class="fa fa-home mr-2"></i> My company</li>
                            <li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
                            <li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
                            <li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
                        </ul>
                    </div>
                    <div class="col-12 copyright mt-3">
                        <p class="float-left">
                            <a href="#">Back to top</a>
                        </p>
                        <p class="text-right text-muted">
                            created with <i class="fa fa-heart"></i> by
                            <a href="https://t-php.fr/43-theme-ecommerce-bootstrap-4.html"
                               ><i>t-php</i></a
                            >
                            | <span>v. 1.0</span>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </body>

</html>
