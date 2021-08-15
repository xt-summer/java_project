<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="main_menu.jsp"%>
    <!--/sidebar-->
    <div class="main-wrap" >
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.html">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">医生管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post" id="selectForm">
                    <table class="search-tab">
                        <tr>
                            <th width="120">选择分类:</th>
                            <td>
                                <select name="search-sort" id="queryTypeSelect">
                                    <option value="1">全部</option>
                                    <option value="2">姓名查询</option>
                                    <option value="3">专业查询</option>
                                </select>
                            </td>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords"  type="text" id="vetSearchTxt"></td>
                            <td><input class="btn btn-primary btn2" name="sub" id="vetQueryBut" value="查询" type="button"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab" width="100%" id ="vetListTable">
                        <tr>
                            <th class="tc" width="5%"><input class="allChoose" name="" type="checkbox"></th>
                            <th class="tc">ID</th>
                            <th class="tc">姓名</th>
                            <th class="tc">电话</th>
                            <th class="tc">专业</th>
                            <th class="tc">操作</th>
                        </tr>
                        <tbody id="data_tbody">
                        <c:forEach var="vets" items="${vetsList}">
                            <tr>
                                <td>
                                    <input name="id[]" value="${vets.id}" type="checkbox">
                                </td>
                                <td>${vets.id}</td>
                                <td>${vets.name}</td>
                                <td>${vets.tel}</td>
                                <td>${vets.specialityStr}</td>
                                <td>
                                   <a class="link-update" href="toUpdateVet?id=${vets.id}">修改</a>
                                   <a class="link-del" href="javascript:deleteVet('确认删除${vets.name}吗?','${vets.id}');">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="list-page">
                        共有<span id="total_num"></span>条记录，当前<span id="cpage"></span>/<span id="total_page"></span>页
                        <a href="javascript:void(0)" id = "first_page" onclick="goPage(1)" >首页</a>
                        <a href="javascript:void(0)" id = "prev_page" onclick="goPage(2)">上一页</a>
                        <a href="javascript:void(0)" id = "next_page" onclick="goPage(3)">下一页</a>
                        <a href="javascript:void(0)" id = "last_page" onclick="goPage(4)">尾页</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function deleteVet(vetName,vetId) {
        var mesg="确认删除"+vetName+"吗？";
        if(confirm(mesg)){
            location.href="toDeleteVet?id="+vetId;
        }
    }
</script>
</html>
