<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>帮派列表</title>
	<%@ include file="/back/common/metainfo.jsp" %>
	<script type="text/javascript">
		function doEdit(id){
			window.location.href='${path}/back/faction/edit/'+id+'.shtml';
		}
		$().ready(function(){
			var $mainTable = $("#main-table");
			var $toolBox = $("#toolBox");
			var $mainBox = $("#mainBox");
			var $name = $("#name");
			var $searchButton = $("#searchButton");
			$mainTable.datagrid({
				url:'${path }/back/faction/list/pager.shtml',
				idField:'id',
				toolbar:$toolBox,
				pagination:true,
				width:'auto',
				height:$mainBox.height(),
				columns:[[
				    {checkbox:true,field:'id',align:'center'},
					{title:'帮派名称',field:'name',align:'center',width:'200'},
					{title:'小区名称',field:'neighborhoodName',align:'center',width:'200'},
					{title:'公告',field:'notice',align:'center',width:'200'},
					{title:'排序',field:'index',align:'center',width:'150'},
					{title:'创建时间',field:'createDate',align:'center',width:'150'},
					{title:'操作',field:'operator',align:'center',width:'100',
						formatter: function(value,row,index){
							var html = '<a href="#" onclick="doEdit(' + row.id + ')" style=" text-decoration:none;">[编辑]</a>';
	                   		return html;
						}
					}
				]],
				pageNumber:1,
				pageSize:20,
				loadMsg:"正在加载,请等待..."
			});
			$(window).resize(function() { 
				var width= $mainBox.width();
				var height=  $mainBox.height();
				$mainTable.datagrid('resize', { width : width,height:height }); 
			});
			$mainTable.datagrid('getPager').pagination({  
		        pageSize: 20,
		        pageList: [10,20,30,50,100], 
		        beforePageText: '第',
		        afterPageText: '页    共 {pages} 页',  
		        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		    }); 
			var reload = function(){
				var name = $name.val();
				$mainTable.datagrid('reload',{
					name: name,
					pageNumber:1
				});
			};
			
			$searchButton.click(function(){
				reload();
			});
		    
			$("a[button='delete']").click(function(){
				var rows = $mainTable.datagrid('getSelections');
				if(rows != null && rows != ""){
					$.post("${path}/back/faction/delete.shtml",$(":checkbox[name='id']").serialize(),function(data){
						$.message(data);
						if(data.type == "success"){
							reload();
						}
					});
				}else{
					$.messager.alert('提示','请选择数据!');
				}
			});
		});
	</script>
</head>
<body>
	<div id="mainBox" class="main-box" style="width: 100%;">
		<table title="" id="main-table"></table>
	</div>
	<div id="toolBox">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td height="50">
					<a href="${path }/back/faction/view.shtml" class="easyui-linkbutton" iconCls="icon-add" plain="true">新    增</a>
					<a href="#" button="delete" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删    除</a>
					<a href="#" button="reload" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷    新</a>
				</td>
				<td align="right"></td>
			</tr>
		</table>
	</div>
</body>
</html>