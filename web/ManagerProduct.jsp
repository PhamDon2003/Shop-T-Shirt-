

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Plays Boy</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/ManagerProduct.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                background-color: #FFDAB9; /* Màu cam nhạt */
                font-family: 'Roboto', sans-serif;
            }

            .container {
                background-color: #f7f7f7; /* Màu xám nhạt */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                transition: 0.3s;
                margin-top: 50px;
            }

            .table-title {
                padding-bottom: 15px;
                background-color: #008080; /* Màu xanh lam */
                color: white;
                border-radius: 10px;
                text-align: center;
            }

            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }

            table.table {
                background-color: #FFFFFF;
                border-radius: 10px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
                width: 100%;
                text-align: left;
            }

            table.table th,
            table.table td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }

            table.table th:first-child {
                width: 60px;
            }

            table.table th:last-child {
                width: 100px;
            }

            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #f2f2f2;
            }

            table.table-striped.table-hover tbody tr:hover {
                background: #e0e0e0;
            }

            .btn {
                color: white;
                border-radius: 10px;
                border: none;
                outline: none !important;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .btn:hover {
                opacity: 0.8;
            }

            .btn-primary {
                background-color: #008080; /* Màu xanh lam */
            }

            .btn-primary:hover {
                background-color: #00555F; /* Tăng độ sâu màu xanh lam */
            }
        </style>


        <script>
            function back() {
                window.location.href = "home";
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "delete?pid=" + id;
                }
            }
        </script>
    </head>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Quản lý <b>Sản phẩm</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm sản phẩm</span></a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Ảnh</th>
                            <th>Giá</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${products}" var="p">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>
                                    <img src="${p.imageUrl}">
                                </td>
                                <td>${p.price} $</td>
                                <td>
                                    <a href="load?pid=${p.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="#" class="delete" data-toggle="modal" onclick="doDelete(${p.id})"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
            <a href="#">
                <button type="button" class="btn btn-primary" onclick="back()">Quay trở lại trang</button>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header bg-primary text-light">
                            <h4 class="modal-title">Thêm sản phẩm</h4>
                            <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="productName">Tên sản phẩm</label>
                                            <input type="text" class="form-control" id="productName" name="name" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="productImage">Đường dẫn ảnh</label>
                                            <input type="text" class="form-control" id="productImage" name="image" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="productPrice">Giá sản phẩm</label>
                                            <input type="number" class="form-control" id="productPrice" name="price" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="productCode">Mã sản phẩm</label>
                                            <textarea class="form-control" id="productCode" rows="3" name="title" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="productDescription">Mô tả sản phẩm</label>
                                            <textarea class="form-control" id="productDescription" rows="3" name="description" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="productCategory">Danh mục</label>
                                            <select class="form-control" id="productCategory" name="category">
                                                <c:forEach items="${listCategories}" var="category">
                                                    <option value="${category.cid}">${category.cname}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>





        <script src="js/ManagerProduct.js" type="text/javascript"></script>
    </body>
</html>


