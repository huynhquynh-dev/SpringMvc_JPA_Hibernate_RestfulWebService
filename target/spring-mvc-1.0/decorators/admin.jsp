<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <title>
        <dec:title default="Trang chủ" />
    </title>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href='<c:url value="/template/admin/css/bootstrap.min.css"/>'/>
    <link rel="stylesheet" href='<c:url value="/template/admin/font-awesome/4.5.0/css/font-awesome.min.css"/>'/>
    <!-- text fonts -->
    <link rel="stylesheet" href='<c:url value="/template/admin/css/fonts.googleapis.com.css"/>'/>
    <!-- ace styles -->
    <link rel="stylesheet" href='<c:url value="/template/admin/css/ace.min.css"/>' class="ace-main-stylesheet" id="main-ace-style" />
    <!-- ace settings handler -->
    <script src='<c:url value="/template/admin/js/ace-extra.min.js"/>'></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href='<c:url value="/template/admin/css/ace-skins.min.css"/>'/>
    <link rel="stylesheet" href='<c:url value="/template/admin/css/ace-rtl.min.css"/>'/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- jQuery library -->
    <script src='<c:url value="/template/admin/js/jquery-2.1.4.min.js"/>'></script>
    <!-- Latest compiled JavaScript -->
    <script src='<c:url value="/template/admin/js/bootstrap.min.js"/>'></script>
    <%--  sweetalert thông báo --%>
    <link href='<c:url value="/template/admin/sweetalert/sweetalert2.min.css"/>'/>
    <script src='<c:url value="/template/admin/sweetalert/sweetalert2.min.js"/>'></script>
    <%-- Phân trang --%>
    <script src='<c:url value="/template/paging/jquery.twbsPagination.js"/>' type="text/javascript"></script>
</head>

<body class="no-skin">
    <!-- Header -->
    <jsp:include page="/common/admin/header.jsp" />

    <!-- Page Content -->
    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try { ace.settings.loadState('main-container') } catch (e) { }
        </script>

        <jsp:include page="/common/admin/sidebar.jsp" />

        <div class="main-content">
            <dec:body />
        </div>

        <!-- Footer -->
        <jsp:include page="/common/admin/footer.jsp" />

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>

    <!-- Latest compiled JavaScript -->
    <script src='<c:url value="/template/admin/js/bootstrap.min.js"/>'></script>

    <!-- page specific plugin scripts -->
    <script src='<c:url value="/template/admin/js/jquery-ui.custom.min.js"/>'></script>
    <script src='<c:url value="/template/admin/js/jquery.ui.touch-punch.min.js"/>'></script>
    <script src='<c:url value="/template/admin/js/jquery.easypiechart.min.js"/>'></script>
    <script src='<c:url value="/template/admin/js/jquery.sparkline.index.min.js"/>'></script>
    <script src='<c:url value="/template/admin/js/jquery.flot.min.js"/>'></script>
    <script src='<c:url value="/template/admin/js/jquery.flot.pie.min.js"/>'></script>
    <script src='<c:url value="/template/admin/js/jquery.flot.resize.min.js"/>'></script>

    <!-- ace scripts -->
    <script src='<c:url value="/template/admin/js/ace-elements.min.js"/>'></script>
    <script src='<c:url value="/template/admin/js/ace.min.js"/>'></script>
    <script src='<c:url value="/template/admin/js/bootstrap.min.js"/>'></script>

    <!-- page specific plugin scripts -->
    <script src='<c:url value="/template/admin/js/jquery-ui.min.js"/>'></script>

    <%-- ckeditor --%>
    <%--<script src="//cdn.ckeditor.com/4.13.1/full-all/ckeditor.js"></script>--%>
</body>
</html>