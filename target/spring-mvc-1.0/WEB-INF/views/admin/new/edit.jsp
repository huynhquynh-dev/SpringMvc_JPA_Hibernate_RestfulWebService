<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:url var="NewUrl" value="/quan-tri/bai-viet/danh-sach"/>
<c:url var="EditNewUrl" value="/quan-tri/bai-viet/chinh-sua"/>
<c:url var="APIurl" value="/api/new/"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                }
                catch (e) {
                    
                }
            </script>
            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">Froms Elements</li>
            </ul>
        </div>
        <div class="page-content">
            <div class="row" >
                <div class="col-xs-12">
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}">
                            <strong>${message}</strong>
                        </div>
                    </c:if>
                    <form:form modelAttribute="model" class="form-horizontal" id="formSubmit" action="#" role="form">
                        <div class="form-group">
                            <label for="categoryCode" class="col-sm-3 control-label no-padding-right">Thể loại</label>
                            <div class="col-sm-9">
                                <%-- path thay thế cho name và value --%>
                                <%-- name dùng để lấy dữ liệu sử dụng cho hàm serializeArray của formSubmit --%>
                                <form:select path="categoryCode" id="categoryCode">
                                    <form:option value="" label="-- Chon thể loại --"/>
                                    <form:options items="${categories}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Tên bài viết</label>
                            <div class="col-sm-9">
                                <form:input path="title" id="title" cssClass="col-xs-10 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Ảnh đại diện</label>
                            <div class="col-sm-9">
                                <input type="file" class="col-xs-10 col-sm-5" id="thumbnail" name="thumbnail"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="shortDescription" class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                            <div class="col-sm-9">
                                <form:textarea path="shortDescription" id="shortDescription" cols="5" rows="10" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-sm-3 control-label no-padding-right">Nội dung</label>
                            <div class="col-sm-9">
                                <form:textarea path="content" id="content" cols="5" rows="10" cssClass="form-control"/>
                            </div>
                        </div>
                        <form:hidden path="id" id="id"/>
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${empty model.id}">
                                    <button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm bài viết
                                    </button>
                                </c:if>
                                <c:if test="${not empty model.id}">
                                    <button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật bài viết
                                    </button>
                                </c:if>
                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="button">
                                    <i class="ace-icon fa fa-undo bigger-110" href="<c:url value="/quan-tri/bai-viet/danh-sach"/>"></i>
                                    Hủy
                                </button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        var id = $('#id').val();
        if (id === "") {
            addNew(data);
        }
        else {
            updateNew(data);
        }
    });

    function addNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),         // Câu lệnh chuyển data kiểu javascript Object thành Json
            dataType: 'json',
            success: function (result) {
                window.location.href = "${EditNewUrl}?id=" + result.id + "&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${NewUrl}?page=1&limit=2&message=error_system"
            }
        });
    }

    function updateNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',    // Định dạng kiểu dữ liệu gửi lên server
            data: JSON.stringify(data),         // Câu lệnh chuyển data kiểu javascriptObject thành Json
            dataType: 'json',                   // Định dạng kiểu dữ liệu server trả về
            success: function (result) {
                window.location.href = "${EditNewUrl}?id=" + result.id + "&message=update_success";
            },
            error: function (error) {
                window.location.href = "${EditNewUrl}?id=" + error.id + "&message=error_system";
            }
        });
    }
</script>
</body>
</html>