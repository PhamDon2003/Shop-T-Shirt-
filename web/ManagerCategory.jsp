

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Product</title>
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
            function doDelete(cid)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "deleteCategory?cid=" + cid;
                }
            }
        </script>

    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Quản Lý <b>Danh Mục</b></h2>
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
                            <th>Thay đổi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listCategories}" var="c">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${c.cid}</td>
                                <td>${c.cname}</td>

                                <td>                                    
                                    <a href="loadCategory?cid=${c.cid}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="#" class="deleteCategory" data-toggle="modal" onclick="doDelete(${c.cid})"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a> 
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
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addcategory" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm vào danh mục</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên</label>
                                <input name="name" type="text" class="form-control" required >
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <input type="submit" class="btn btn-success" value="Thêm">
                        </div>
                    </form>
                </div>
            </div>
        </div>





        <script src="js/ManagerProduct.js" type="text/javascript"></script>
    </body>
</html>
