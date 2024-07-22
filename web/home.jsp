     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Plays Boy</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />

    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <%@include file="FalseUser.jsp" %>

        <!-- Header-->
        <header class="mt-2" style="background-color: bisque">
            <div class="container">
                <!-- Search form -->
                <form action="search">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control form-control-sm" placeholder="Tìm kiếm sản phẩm" name="keyword">
                        <button class="btn btn-primary btn-sm" type="submit">Tìm kiếm</button>
                    </div>
                </form>

                <div class="welcome-message">
                    <h1>Welcome to Play Boys!</h1>
                    <p>We are excited to have you here. Explore our collection and enjoy your shopping experience!</p>
                    <img src="https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/305313379_462149332624038_3579932704731658757_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Lbu7lUEg_ycAX9HDCKE&_nc_ht=scontent.fhan14-3.fna&oh=00_AfBHpEnjlguS5yeO6Hm-mLGHTpU_u75zm-cytj7OT-pBRg&oe=65FDAADD" width="200" height="200" alt="Mô tả hình ảnh">
                </div>

                <style>
                    .welcome-message {
                        background-color: #f8f9fa; /* Màu nền */
                        border: 2px solid #007bff; /* Viền */
                        border-radius: 10px; /* Đường cong viền */
                        padding: 20px; /* Khoảng cách nội dung và viền */
                        text-align: center; /* Căn giữa nội dung */
                        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
                    }

                    h1 {
                        color: #333333; /* Màu chữ tiêu đề */
                        font-size: 28px; /* Kích thước chữ tiêu đề */
                    }

                    p {
                        color: #666666; /* Màu chữ nội dung */
                        font-size: 18px; /* Kích thước chữ nội dung */
                        margin-bottom: 20px; /* Khoảng cách giữa các đoạn văn */
                    }

                    img {
                        width: 200px; /* Kích thước chiều rộng */
                        height: 200px; /* Kích thước chiều cao */
                        display: block; /* Hiển thị hình ảnh dạng khối */
                        margin: 0 auto 20px; /* Căn giữa hình ảnh và thêm khoảng cách phía dưới */
                    }

                </style>


            </div>
        </header>

        <!-- Section-->
        <section class="py-5" style="background-color: bisque">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <!-- Danh mục sản phẩm -->
                        <h3>Danh mục sản phẩm</h3>
                        <ul class="list-group category_block d-flex flex-wrap">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item text-white ${tag == C.cid ? 'active' : ''} flex-grow-1">
                                    <a href="category?categoryId=${C.cid}" class="d-block">${C.cname}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <style>
                        .category_block {
                            padding: 0;
                            margin: 0;
                        }

                        .category_block li {
                            border: none;
                            flex-grow: 1;
                        }

                        .category_block li a {
                            color: #fff;
                            text-decoration: none;
                            display: block;
                            padding: 10px;
                            background-color: #007bff;
                            border-radius: 5px;
                            margin: 5px;
                            text-align: center;
                        }

                        .category_block li.active a {
                            background-color: #0056b3;
                        }
                    </style>


                    <div class="col-md-9">
                        <!-- Các sản phẩm -->
                        <h3>Các sản phẩm (<c:out value="${listProducts.size()}" />)</h3>
                        <c:choose>
                            <c:when test="${listProducts == null || listProducts.size() == 0}">
                                <p>Không có sản phẩm nào.</p>
                            </c:when>
                            <c:otherwise>
                                <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-lg-5 justify-content-center">
                                    <c:forEach items="${listProducts}" var="P">
                                        <div class="col mb-5">
                                            <div class="card h-100">
                                                <!-- Ảnh sản phẩm -->
                                                <a href="detail?productId=${P.id}">
                                                    <img class="card-img-top" src="${P.imageUrl}" alt="..." />
                                                </a>
                                                <!-- Thông tin sản phẩm -->
                                                <div class="card-body p-4">
                                                    <div class="text-center">
                                                        <!-- Tên sản phẩm -->
                                                        <h5 class="fw-bolder">${P.name}</h5>
                                                        <!-- Giá sản phẩm -->
                                                        <span class="text-muted">$${P.price}</span>
                                                    </div>
                                                </div>
                                                <!-- Hành động sản phẩm -->
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                    <div class="text-center">
                                                        <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}">Thêm vào giỏ hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
