<%@page import="java.util.List"%>
<%@ include file="init.jsp"%>

	<portlet:actionURL var="updateuserActionURL" windowState="normal" name="Updateuser"/>
	
	<div class="card">
		<h2>Upload Image</h2>
	<div class="card-body">
	<img hight="100px" width="100px" alt="" src="https://p.kindpng.com/picc/s/451-4517876_default-profile-hd-png-download.png">
	<br>
	<form action="<%=updateuserActionURL%>" method="POST" >
	  <input type="file"   name="file "accept="image/*" name="select"/> 
	 
	   <div class="col-4 offset-9">
	    	<div class="row">	
    	 	<input  type="reset" class="btn btn-secondary " name="close">
	    	<input  type="submit" class="btn btn-primary mx-2 " name="done">
		 </div>
	    </div>
	 </form>
	 </div>
	 </div>
	    
	  
