

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Cart</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script type="text/javascript">
            function limitQuantity(event) {
                var input = event.target;
                var quantity = parseInt(input.value);
                var min = parseInt(input.getAttribute('min'));
                var max = parseInt(input.getAttribute('max'));
                var errorMessage = document.getElementById('quantityErrorMessage');
                var emptyErrorMessage = document.getElementById('emptyQuantityErrorMessage');

                // Kiểm tra nếu số lượng nhỏ hơn giá trị tối thiểu
                if (quantity < min) {
                    input.value = min;
                }
                // Kiểm tra nếu số lượng lớn hơn giá trị tối đa
                else if (quantity > max) {
                    input.value = max;
                    errorMessage.style.display = 'block'; // Hiển thị thông báo
                    emptyErrorMessage.style.display = 'none'; // Ẩn thông báo khi số lượng không được nhập
                    setTimeout(function () {
                        errorMessage.style.display = 'none';
                    }, 3000); // Ẩn thông báo sau 3 giây
                } else {
                    errorMessage.style.display = 'none'; // Ẩn thông báo nếu số lượng hợp lệ
                    emptyErrorMessage.style.display = 'none'; // Ẩn thông báo khi số lượng không được nhập
                }

                // Kiểm tra nếu số lượng không được nhập
                if (input.validity.valueMissing) {
                    emptyErrorMessage.style.display = 'block'; // Hiển thị thông báo khi số lượng không được nhập
                } else {
                    emptyErrorMessage.style.display = 'none'; // Ẩn thông báo khi số lượng được nhập
                }
            }
            function validateForm() {
                var quantityInput = document.getElementById('quantityInput');
                var errorMessage = document.getElementById('quantityErrorMessage');
                var emptyErrorMessage = document.getElementById('emptyQuantityErrorMessage');

                // Kiểm tra nếu số lượng không hợp lệ (không nhập hoặc vượt quá giới hạn)
                if (!quantityInput.value || parseInt(quantityInput.value) <= 0 || parseInt(quantityInput.value) > parseInt(quantityInput.getAttribute('max'))) {
                    errorMessage.style.display = 'block'; // Hiển thị thông báo khi số lượng không hợp lệ
                    emptyErrorMessage.style.display = 'none'; // Ẩn thông báo khi số lượng không được nhập
                    return false; // Ngăn form được submit
                } else {
                    errorMessage.style.display = 'none'; // Ẩn thông báo khi số lượng hợp lệ
                    emptyErrorMessage.style.display = 'none'; // Ẩn thông báo khi số lượng không được nhập
                    return true; // Cho phép form được submit
                }
            }

        </script>




    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <div style="background-color: bisque">
            <!-- Product section-->
            <section class="py-5">
                <div class="container" style="min-height: 1000px">
                    <c:choose>
                        <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}">
                            <h1>Giỏ hàng trống</h1>
                        </c:when>
                        <c:otherwise>
                            <h3>Danh sách các sản phẩm</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Ảnh</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Tổng tiền</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${carts}" var="C">
                                    <form action="update-quantity">
                                        <tr>
                                        <input type="hidden" name="productId" value="${C.value.product.id}"/>
                                        <th scope="row">${C.value.product.id}</th>
                                        <td>${C.value.product.name}</td>
                                        <td><img src="${C.value.product.imageUrl}" width="50"/></td>
                                        <td>${C.value.product.price}</td>
                                        <td><input type="number" name="quantity" id="quantityInput" value="${C.value.quantity}" min="1" max="100" required oninput="limitQuantity" />
                                            <div id="quantityErrorMessage" style="color: red; display: none;">Số lượng không thể vượt quá 100.</div>
                                            <div id="emptyQuantityErrorMessage" style="color: red; display: none;">Vui lòng nhập số lượng sản phẩm.</div>


                                        </td>
                                        
                                        <td>${C.value.product.price*C.value.quantity}</td>
                                        <td><a href="delete-cart?productId=${C.value.product.id}" class="btn btn-outline-danger"><i class="bi bi-trash"></i>Xóa</a></td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                            <h3>Tổng tiền: $${totalMoney}</h3>
                            <a id="checkoutBtn" href="checkout" class="btn btn-success w-25" onclick="return validateForm()">Thanh toán</a>


                        </c:otherwise>
                    </c:choose>
                </div>
            </section>
        </div>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
