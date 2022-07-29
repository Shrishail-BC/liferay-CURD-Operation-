<%@page import="com.liferay.portal.kernel.model.Country"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.kernel.model.ListType"%>
<%@ include file="init.jsp"%>
 	
 	<portlet:renderURL var="cancelURL">
    <portlet:param name="mvcPath" value="/view.jsp"/>
	</portlet:renderURL>
	
	<div>
	<h1 class="mx-auto" style="width: 200px;">Dashboard</h1>
	<div class="row pl-3">
	<div class="card col-3 m-3 p-5 bg-warning">
	<h5 class="text-light"> Total number of organization</h5>
	<h1 class="pl-3"> ${dashorganization}</h1>
	</div>
	
	<div class="card col-3 m-3 p-5 bg-info">
	<h5 class="text-light"> User associated with organizations.</h5>
	<h1 class="pl-3"> ${organ}</h1>	
	</div>	
	
	<div class="card col-3 m-3 p-5 bg-success">
	<h5 class="text-light">  users belonging to the company..</h5>
	<h1 class="pl-3"> ${companyuser}</h1>	
	</div>
	</div>
	</div>   	
	
	   <a href="<%= cancelURL %>" >cancel </a>
	   
	   