<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>

<c:url var="NewAPI" value="/api/new/"/>
<c:url var="NewURL" value="/quan-tri/bai-viet/danh-sach"/>

<html>
<head>
    <title>Danh sách bài viết</title>
</head>

<body>
<form action='<c:url value="/quan-tri/bai-viet/danh-sach"/>' id="formSubmit" method="get">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Danh sách bài viết</a>
                </li>
            </ul>
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}">
                            <strong>${message}</strong>
                        </div>
                    </c:if>
                    <div class="widget-box table-filter">
                        <div class="table-btn-controls">
                            <div class="pull-right tableTools-container">
                                <div class="dt-buttons btn-overlap btn-group">
                                    <a flag="info"
                                       class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                       data-toggle="tooltip"
                                       title='Thêm bài viết'
                                       href='<c:url value="/quan-tri/bai-viet/chinh-sua"/>'>
                                        <span>
                                            <%--Lấy các icon từ: https://fontawesome.com/v4.7.0/icons/--%>
                                            <i class="fa fa-plus-circle bigger-110 purple"></i>
                                        </span>
                                    </a>
                                    <button id="btnDelete" type="button" onclick="warningBeforDelete()"
                                            class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                            data-toggle="tooltip" title='Xóa bài viết'>
												<span>
													<i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkAll"></th>
                                        <th>Tên bài viết</th>
                                        <th>Mô tả ngắn</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${model.listResult}" var="item">
                                            <tr>
                                                <th><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></th>
                                                <td>${ item.title }</td>
                                                <td>${ item.shortDescription }</td>
                                                <td>
                                                    <%-- Dùng để thêm param vào đường dẫn--%>
                                                    <c:url var="updateNewUrl" value="/quan-tri/bai-viet/chinh-sua">
                                                        <c:param name="id" value="${item.id}"/>
                                                    </c:url>
                                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                       title="Cập nhật bài viết" href='${updateNewUrl}'>
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <ul class="pagination" id="pagination"></ul>
                                <input type="hidden" value="" id="page" name="page"/>
                                <input type="hidden" value="" id="limit" name="limit"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    var totalPage = ${model.totalPage};
    var currentPage = ${model.page};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage !== page) {
                    $('#limit').val(2);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
    });
    
    function warningBeforDelete() {
        swal({
            title: "Xác nhận xóa",
            text: "Bạn có chắn chắn muốn xóa hay không",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-success",
            cancelButtonClass:  "btn-danger",
            confirmButtonText:  "Xác nhận",
            cancelButtonText:   "Hủy bỏ",
            closeOnConfirm: false,
            closeOnCancel: false
        }).then(function(isConfirm) {
        if (isConfirm) {
            // Mảng tìm các input có type là checkbox và có đánh dấu là checked thì lưu lại
            var ids = $('tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            deleteNew(ids);
        }
        });
    }

    function deleteNew(ids) {
        $.ajax({
            url: '${NewAPI}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(ids),
            success: function (result) {
                // JavaScript Window Location
                // Reload lại trang
                window.location.href = "${NewURL}?page=1&limit=2&message=delete_success"
            },
            error: function (error) {
                window.location.href = "${NewURL}?page=1&limit=2&message=error_system"
            }
        });
    }
</script>
</body>

</html>