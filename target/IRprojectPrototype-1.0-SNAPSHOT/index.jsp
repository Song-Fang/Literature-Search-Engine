<%--
  Created by IntelliJ IDEA.
  User: Fang
  Date: 2019/12/1
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css"
          href="resource/searchEngine.css" media="all">


    <script type="text/javascript"
            src="resource/jquery-1.2.6.pack.js"></script>
    <title>Documents Search Engine</title>


    <script type="text/javascript">
        function verify(){
            var message = "psychology illness sad sorrow cure cough fever stomachache pain ankle sprain heart attack headache depression eyesight dropdown tired hair lose sleepless";
            var inputMessage = document.getElementById("key").value.toLowerCase();

            if(inputMessage!=""&&message.indexOf(inputMessage)>=0){
                alert("A friendly reminder! Please notice! The information on the internet is not correct all the time. If you really have some questions about illness and want to find some assistance, please go to hospital and find a right doctor for consultation. Don't believe the information easily showed in the results list. Otherwise it may delay your best time for treatment. We all love you!");
            }
            query();
        }

        function query() {

            //执行查询
            queryList();
        }

        function queryList() {
            //提交表单
            document.getElementById("actionForm").submit();
        }

    </script>
</head>

<body>
<div id="head">
    <ul>
        <li><a href="https://www.baidu.com/">Baidu</a></li>
        <li><a href="https://www.google.com/">Google</a></li>
        <li><a href="https://www.google.com/maps/">Map</a></li>

        <li><a href="https://scholar.google.com/">Scholar</a></li>

        <li><a href="product/advancedSearch">Advanced Search</a></li>
    </ul>
    <div id="head_right">
    </div>
</div>

<div id="main">
    <a href=""><img src="images/LOGO.gif" id="main_img1"/></a>
    <br/>

    <form id="actionForm" action="product/search" method="GET">
        <div class="form">
            <input type="text" class="text" accesskey="s" name="keyword" id="key" value="${keyword}"
                   autocomplete="off" onkeydown="javascript:if(event.keyCode==13) {query()}"/>
            <input type="button" value="HeiHa!" class="button" id="submitButton" onclick="verify()"/>
        </div>

    </form>

</div>

<div id="footer">
    <img src="images/bottom.png" id="footer_bottom"/>
</div>

<div id="copyRight">
    <p>@CopyRight:Information Retrieval</p>
    <p>@Author: Jun Jiang&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Youwei Ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Haodi Sun&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Song Fang</p>
</div>

</body>
</html>
