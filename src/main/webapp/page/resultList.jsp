<%--
  Created by IntelliJ IDEA.
  User: Fang
  Date: 2019/12/1
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="shortcut icon" href="images/SF.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="resource/result.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


    <script type="text/javascript"
            src="resource/jquery-1.2.6.pack.js"></script>
    <title>Documents Search Engine</title>
    <script type="text/javascript">
        function query() {


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

        function queryList() {

            document.getElementById("actionForm").submit();
        }

    </script>
</head>
<body>

<div class="row">
    <div class="col-1">
       <a href=""> <img src="images/LOGO.gif" id="resultImage" /></a>
    </div>
    <div class="col-13">
        <!--Search Bar-->
        <form id="actionForm" action="product/search" method="GET">
        <input type="text" name="keyword" id="key" value="${keyword}" autocomplete="off" onkeydown="javascript:if(event.keyCode==13) {query()}"/>
            <input type="hidden" name="currtPage" id="page" value="${currtPage}"/>
            <input type="button" name="" id="" value="HeiHa!" onclick="query()"/>
        </form>
    </div>
</div>

<div id="transition">
    <p id="transitionFont"><span id="underline">Results List</span></p>
</div>

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


<!--Page changes-->
<div id="pageSwitch">
    <a href="javascript:changePage(-1)" class="prev"><b>&nbsp&nbsp&nbsp&nbsp<&nbsp&nbsp&nbsp&nbsp</b></a>
    &nbsp&nbsp<span class="text" id="pageText"><i>&nbsp&nbsp${pageList.currPage}</i>&nbsp&nbsp/&nbsp&nbsp${pageList.countPage}&nbsp&nbsp</span>&nbsp&nbsp
    <a href="javascript:changePage(1)" class="next"><b>&nbsp&nbsp&nbsp&nbsp>&nbsp&nbsp&nbsp&nbsp<b></b></a>
</div>

</body>
</html>
