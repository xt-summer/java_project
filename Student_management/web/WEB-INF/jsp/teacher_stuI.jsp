<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="main_menu_tea.jsp"%>

<!--/sidebar-->
<div class="main-wrap" >
<%--    <div class="crumb-wrap">--%>
<%--        <div class="crumb-list"><i class="icon-font"></i><a href="#">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">学生管理</span></div>--%>
<%--    </div>--%>
    <div class="search-wrap">
        <div class="search-content">
            <form action="#" method="post" id="selectForm" >
                <table class="search-tab">
                    <tr>
                        <th width="120">选择分类:</th>
                        <td>
                            <select name="queryTypeSelect" id="queryTypeSelect" class="select">
                                <option value="1">全部</option>
                                <option value="2">姓名查询</option>
                                <option value="3">学号查询</option>
                            </select>
                        </td>
                        <th width="70">关键字:</th>
                        <td><input class="common-text" placeholder="关键字" name="userSearchTxt"  type="text" id="userSearchTxt"></td>
                        <td><input class="btn btn-primary btn2" name="sub" id="userQueryBut" value="查询" type="button" onclick="st()"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="result-wrap">
        <form name="myform" id="myform" method="post" action="#">
            <div class="result-content">
                <table class="result-tab" width="100%" id ="vetListTable">
                    <tr>
                        <th class="tc" width="5%"><input class="allChoose" name="" type="checkbox"></th>
                        <th class="tc">ID</th>
                        <th class="tc">姓名</th>
                        <th class="tc">学号</th>
                        <th class="tc">生日</th>
                        <th class="tc">操作</th>
                    </tr>
                    <tbody id="data_tbody">
                    <c:forEach var="student" items="${list}">
                        <tr>
                            <td>
                                <input name="id[]" value="${student.id}" type="checkbox">
                            </td>
                            <td>${student.id}</td>
                            <td>${student.username}</td>
                            <td>${student.idcard}</td>
                            <td>${student.birthdate}</td>
                            <td>
                                <a class="link-update" href='teafindStuById.do?id=${student.id}'>修改</a>
                                <a class="link-del" href='teadelectStu.do?id=${student.id}'>删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="list-page">
                    共有<span id="total_num">${sessionScope.page.total}</span>条记录，当前第<span id="cpage">${sessionScope.page.pageNum}</span>页
                      <a href="javascript:void(0)" id = "first_page" onclick="goPage1()" >首页</a>
                    <a href="javascript:void(0)" id = "prev_page" onclick="goPage2()">上一页</a>
                    <a href="javascript:void(0)" id = "next_page" onclick="goPage3()">下一页</a>
                    <a href="javascript:void(0)" id = "last_page" onclick="goPage4()">尾页</a>
                    <input type="hidden" name="pageNum" id="pageNum" value="${sessionScope.page.pageNum}">
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</body>
<script>
    var pageNum=${sessionScope.page.pageNum};//当前页
    var pages=${sessionScope.page.pages};//总页数
    var hasPreviousPage=${sessionScope.page.hasPreviousPage};//是否有上一页
    var hasNextPage=${sessionScope.page.hasNextPage};//是否有下一页
    function st() {
        var userSearchTxt=$("#userSearchTxt").val();
        var type=$("#queryTypeSelect").val();
        location.href="findScore.do?type="+type+"&userSearchTxt="+userSearchTxt;
    }
    function goPage1() {
        var userSearchTxt=$("#userSearchTxt").val();
        var type=$("#queryTypeSelect").val();
        var pagenumber=1;
        location.href="findStuPage.do?type="+type+"&pageNumber="+pagenumber+"&userSearchTxt="+userSearchTxt;
    }
    function goPage2() {
        var userSearchTxt=$("#userSearchTxt").val();
        var type=$("#queryTypeSelect").val();
        if (pageNum<=1){var pagenum=1;}
        var pagenum=pageNum-1;

        location.href="findStuPage.do?type="+type+"&pageNumber="+pagenum+"&userSearchTxt="+userSearchTxt;
    }
    function goPage3() {
        var userSearchTxt=$("#userSearchTxt").val();
        var type=$("#queryTypeSelect").val();
        if (pageNum>=pages){var pagenum=pages;}
        var pagenum=pageNum+1;
        location.href="findStuPage.do?type="+type+"&userSearchTxt="+userSearchTxt+"&pageNumber="+pagenum;
    }
    function goPage4() {
        var userSearchTxt=$("#userSearchTxt").val();
        var type=$("#queryTypeSelect").val();
        var pagenum=pages;
        location.href="findStuPage.do?type="+type+"&pageNumber="+pagenum+"&userSearchTxt="+userSearchTxt;
    }
</script>

</html>
