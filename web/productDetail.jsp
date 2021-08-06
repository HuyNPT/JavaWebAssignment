<%-- 
    Document   : productDetail
    Created on : Jul 3, 2021, 10:45:33 PM
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
                color: #f8f9fa!important
            }
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        </style>
    </head>
    <body>
        <c:if test ="${sessionScope.USER.role != 1}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <jsp:include page="header.jsp"></jsp:include>
        <c:set var ="p" value="${sessionScope.PRODUCTDETAIL}"></c:set>
            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading">E-COMMERCE PRODUCT</h1>
                    <p class="lead text-muted mb-0">Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500...</p>
                </div>
            </section>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <!-- Image -->
                    <div class="col-12 col-lg-6">
                        <div class="card bg-light mb-3">
                            <div class="card-body">
                                <a href="" data-toggle="modal" data-target="#productModal">
                                    <img class="img-fluid" src="${p.image}" />
                                <p class="text-center">Zoom</p>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Add to cart -->
                <div class="col-12 col-lg-6 add_to_cart_block">
                    <div class="card bg-light mb-3">
                        <div class="card-body">
                            <p class="price">${p.name}</p>
                            <p class="price">${p.price} $</p>

                            <form action="AddToCartController" method="POST">
                                <input type="hidden" value = "${PRODUCTDETAIL.image}" name ="imgage"/>
                                <input type="hidden" value="${PRODUCTDETAIL.id}" name = "Id"/>
                                <input type="hidden" value="${PRODUCTDETAIL.name}" name = "Name"/>
                                <input type="hidden" value="${PRODUCTDETAIL.price}" name = "Price"/>
                                <input type="hidden" value="${PRODUCTDETAIL.quantity}" name = "QuantityInDb"/>
                                <div class="form-group">
                                    <label>Quantity :</label>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <button type="button" class="quantity-left-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="number" class="form-control"  id="quantity" onkeypress="return event.charCode >= 48 && event.charCode <= 57" name="Quantity" min="1" max="${PRODUCTDETAIL.quantity}" value="1">
                                        <div class="input-group-append">
                                            <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>

                                    </div>
                                    <div class="reviews_product p-3 mb-2">
                                        Only ${PRODUCTDETAIL.quantity} products left
                                    </div>
                                </div>

                                <button  type="submit" class="btn btn-success btn-lg btn-block text-uppercase" >
                                    <i class="fa fa-shopping-cart"></i> Add To Cart
                                </button>  
                            </form>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Description -->
                <div class="col-12">
                    <div class="card border-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-align-justify"></i> Description</div>
                        <div class="card-body">
                            <p class="card-text">
                                ${p.description}
                            </p>

                        </div>
                    </div>
                </div> 
            </div>
        </div>


        


        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3">
                        <h5>About</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <p class="mb-0">
                            Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                        <h5>Informations</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="">Link 1</a></li>
                            <li><a href="">Link 2</a></li>
                            <li><a href="">Link 3</a></li>
                            <li><a href="">Link 4</a></li>
                        </ul>
                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                        <h5>Others links</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="">Link 1</a></li>
                            <li><a href="">Link 2</a></li>
                            <li><a href="">Link 3</a></li>
                            <li><a href="">Link 4</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3">
                        <h5>Contact</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
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
                        <p class="text-right text-muted">created with <i class="fa fa-heart"></i> by <a href="https://t-php.fr/43-theme-ecommerce-bootstrap-4.html"><i>t-php</i></a> | <span>v. 1.0</span></p>
                    </div>
                </div>
            </div>
        </footer>

        <c:if test="${not empty requestScope.MESS}">
            <script type="text/javascript">
                var msg = "${requestScope.MESS}"
                window.onload = function () {
                    alert(msg);
                }
            </script>

            <c:remove var="MESS" scope="request"/>
        </c:if>
        <script>
            $(document).ready(function () {
                var quantity = 1;
                $('.quantity-right-plus').click(function (e) {
                    e.preventDefault();

                    var quantity = parseInt($('#quantity').val());
                    if (quantity < ${PRODUCTDETAIL.quantity}) {
                        $('#quantity').val(quantity + 1);
                    }
                });

                $('.quantity-left-minus').click(function (e) {
                    e.preventDefault();
                    var quantity = parseInt($('#quantity').val());
                    if (quantity > 1) {
                        $('#quantity').val(quantity - 1);
                    }
                });
                $('#quantity').on('change', function () {
                    if ($(this).val() >= ${PRODUCTDETAIL.quantity}) {
                        $('#quantity').val(${PRODUCTDETAIL.quantity});
                    }
                });
            });
        </script>





</html>
