<%@page import="java.sql.ResultSet"%>
<jsp:include page="base.jsp" />
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>
<!-- ------------------------------------------------------->
	<div class="row ">
	<div class="col-md-2">
	<div class="m-3 text-center">
	<p class="border-bottom m-3">Table Name</p>

	<%
	if(request.getAttribute("index") !=null){
	ResultSet resultIndex=(ResultSet)request.getAttribute("index");
	while(resultIndex.next()){
		
	if(request.getAttribute("tableName").equals(resultIndex.getString("TABLE_NAME"))){
%>
	<a class="text-white" href="/homepage.jsp?id=<%=resultIndex.getString("TABLE_NAME") %>"><p class="border-right border-bottom bg-success ">
	<%= resultIndex.getString("TABLE_NAME").substring(0, 1).toUpperCase() + resultIndex.getString("TABLE_NAME").substring(1).toLowerCase() %>
	</p></a>
<% 	}else{%>

	<a class="text-dark" href="/homepage.jsp?id=<%=resultIndex.getString("TABLE_NAME") %>"><p class="border-right border-bottom  ">
	<%= resultIndex.getString("TABLE_NAME").substring(0, 1).toUpperCase() + resultIndex.getString("TABLE_NAME").substring(1).toLowerCase() %>
	 </p></a>
<% 
}}}
%>
	</div>
	</div>
	<span class="border-right"></span>
	<span class="border-right"></span>
	<div class="col-md-8">
	<table class="table">
  	<tbody>
	<%
	if(request.getAttribute("data")!=null && request.getAttribute("column")!=null ){
	ResultSet resultData=(ResultSet)request.getAttribute("data");
	ResultSet resultcolumn=(ResultSet)request.getAttribute("column");
	String columnName=null;
	String dta;
	String id=null;
	if(resultcolumn.next()){
		 id=resultcolumn.getString("COLUMN_NAME");
		resultcolumn.next();
		 columnName=resultcolumn.getString("COLUMN_NAME");
		 %>
		 <%= columnName %>		
<% 	}else{	}
	while(resultData.next()){%>
   	<tr>
      <td>
      <%=resultData.getString(columnName) %>
      </td>
      <td><a href="/update.jsp?id=<%=resultData.getString(id).trim()%>&name=${tableName}" class="btn btn-success">Update</a></td>
      <td><a href="/delete.jsp?id=<%=resultData.getString(id).trim()%>&name=${tableName}" class="btn btn-danger">Delete</a></td>
     </tr>
    <%}%>
	<% }%> 
  </tbody>
</table>
	<p>
	</div>
		<div class="col-md-1">
	<div class="m-3 text-center">
	<p class="border-bottom m-3">
	<a href="/add.jsp?name=${tableName}" class="btn btn-success">Add</a>
	</p>
	</div>
	</div>
	
	</div>







<!-- ------------------------------------------------------->
	
<jsp:include page="footer.jsp" />