<%--
  Created by IntelliJ IDEA.
  User: Fang
  Date: 2019/12/7
  Time: 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="utf-8" http-equiv="charset">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/SF.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="resource/result.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap" rel="stylesheet">

    <!-- FontAwesome JS-->
    <script defer src="assets/fontawesome/js/all.min.js"></script>

    <!-- Theme CSS -->
    <link id="theme-style" rel="stylesheet" href="assets/css/theme.css">
    <script type="text/javascript"
            src="resource/jquery-1.2.6.pack.js"></script>
    <title>Documents Search Engine</title>
        <script type="text/javascript">
            function query() {
                document.getElementById("catalog_name").value="";
                queryList();
            }

        function queryList() {
            //提交表单
            document.getElementById("actionForm2").submit();
        }

        function filter(key, value) {
            document.getElementById(key).value=value;
            queryList();
        }
        function sort1() {
            var s = "2";
            document.getElementById("sort").value = s;
            queryList();
        }

            function sort2() {
                var s = "1";
                document.getElementById("sort").value = s;
                queryList();
            }
        function changePage(p) {
            var curpage = Number(document.getElementById("page").value);
            curpage = curpage + p;
            if (curpage>${pageList.countPage}) {
                curpage = ${pageList.countPage};
            }
            if(curpage<1){
                curpage = 1;
            }
            document.getElementById("page").value = curpage;
            queryList();
        }
    </script>
</head>
<body>

<header class="header fixed-top">
    <div class="branding docs-branding">
        <div class="container-fluid position-relative py-2">
            <div class="docs-top-utilities d-flex justify-content-end align-items-center">
                <a href="" class="btn btn-primary d-none d-lg-flex d-md-flex d-sm-flex d-xs-flex">Home</a>
            </div><!--//docs-top-utilities-->
        </div><!--//container-->
    </div><!--//branding-->
</header><!--//header-->


<div class="page-header theme-bg-dark py-5 text-left position-relative">
    <div class="theme-bg-shapes-right"></div>
    <div class="theme-bg-shapes-left"></div>
    <div class="container">
        <h1 class="page-heading single-col-max mx-auto text-center">Library System</h1>
        <div class="page-intro single-col-max mx-auto text-center">Everything you need to get your books online.</div>


        <form class="search-form w-30 mx-auto" id="actionForm2" action="product/advancedSearch" method="GET">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <div class="pt-4 d-block mx-auto">
                        <h4 class="text-white">Category:</h4>
                        <a href="javascript:filter('catalog_name', 'Computer')" class="text-white">Computer Science</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:filter('catalog_name', 'Engineer')" class = "text-white">Engineering</a>

                        <br />
                        <a href="javascript:filter('catalog_name', 'Novel')" class = "text-white">Novel</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:filter('catalog_name', 'Music')" class = "text-white">Music</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:filter('catalog_name', 'History')" class = "text-white">History</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:filter('catalog_name', 'Food')" class = "text-white">Food</a>
                        <br />
                        <a href="javascript:filter('catalog_name', 'Poetry')" class = "text-white">Poetry</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:filter('catalog_name', 'Sport')" class = "text-white">Sports</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:filter('catalog_name', 'Health')" class = "text-white">Health</a>

                        <br />
                        <br />

                        <h4 class="text-white">Sort:</h4>
                        <div>
                            <a href="javascript:sort1()" class="text-white">Descend</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:sort2()" class="text-white">Ascend</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <div class="main-search-box pt-4 d-block mx-auto">


                        <label for="title" class="text-white">Content:</label>
                        <input type="text" placeholder="Search the name" name="keyword" id="searchWord" class="form-control search-input" value="${keyword}">
                        <label  class="text-white">Public Date:</label>
                        <input type="text" placeholder="Search the public date" name="priceStr" class="form-control search-input" id="year" value="${priceStr}">
                        <input type="hidden" name="catalogName" id="catalog_name" value="${catalogName}"/>
                        <input type="hidden" name="psort" id="sort" value="${psort}"/>
                        <input type="hidden" name="currtPage" id="page" value="${currtPage}"/>
                        <br/>
                        <input type="button" class="btn btn-primary d-none d-lg-flex d-md-flex d-sm-flex d-xs-flex mx-auto mb-0" name="" id="" value="Search" onclick="query()"/>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div><!--//page-header-->

<!--Documents Lists-->
<c:forEach var="p" items="${pageList.list}">
    <div id="DocumentsList">
        <div id="title">
            <!--Documents Title-->
            <span id="titleStress">Name:${p.pname}</span>
        </div>

        <div class="row" id="description">
            <div class="col-1.5" id="helper">
                <img src="images/${p.picture}" id="documentListImage" onclick="alert('${p.description}')"/>
            </div>
            <div class="col-8" id="helper1">
                <div>
                    <div><span class="des">Classification:${p.catalogName}</span>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div><span class="des">Edition Year: ${p.price}</span></div>
                    <div><span class="des">Content:</span><span class="contentDes"></span><span>${fn:substring(p.description, 0, 530)}......</span></div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
<!--Documents ends-->

<div id="pageSwitch">
    <a href="javascript:changePage(-1)" class="prev"><b>&nbsp&nbsp&nbsp&nbsp<&nbsp&nbsp&nbsp&nbsp</b></a>
    &nbsp&nbsp<span class="text" id="pageText"><i>&nbsp&nbsp${pageList.currPage}</i>&nbsp&nbsp/&nbsp&nbsp${pageList.countPage}&nbsp&nbsp</span>&nbsp&nbsp
    <a href="javascript:changePage(1)" class="next"><b>&nbsp&nbsp&nbsp&nbsp>&nbsp&nbsp&nbsp&nbsp<b></b></a>
</div>



<script src="assets/plugins/jquery-3.4.1.min.js"></script>
<script src="assets/plugins/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
