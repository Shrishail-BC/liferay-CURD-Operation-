<%@page import="com.liferay.portal.kernel.model.Country"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.kernel.model.ListType"%>
<%@ include file="init.jsp"%>
<portlet:defineObjects/>
 	
 	<portlet:renderURL var="cancelURL">
    <portlet:param name="mvcPath" value="/view.jsp"/>
	</portlet:renderURL>
	
    <portlet:actionURL name="updateorg" var="updateorganizationActionURL" />
    
	<%
    long organizationId =Long.parseLong( request.getParameter("organizationId"));
    String name = request.getParameter("name");
   	int Countryid =Integer.parseInt( request.getParameter("CountryId"));	     
	
	List<Country> Country =(List<Country>)request.getAttribute("Country"); 
	%>
		
	<form action="<%=updateorganizationActionURL%>" method="post" name="updateorgForm" id="updateorgForm">
	<div class="col-6">
	  <label class="control-label" >Name</label>
	   <div class="controls"> 
	  <input name="<portlet:namespace/>uporganizationName" class="form-control  field-required" type="text" id="<portlet:namespace/>uporganizationName" value="<%=name%>"/>
	  </div>
      <input name="<portlet:namespace/>uporganizationId" type="hidden"  id="<portlet:namespace/>uporganizationId" value="<%=organizationId%>"/><br>
  
    
      <label class="control-label" >Country </label><br>     
		<select style="text-transform: capitalize" class="form-control" id="<portlet:namespace/>CountryId" name="<portlet:namespace/>CountryId" >	
		<option value="0" > Select Country </option>	
	 <%
	 for(int i=0; i<Country.size(); i++){
		 long country_Id =Country.get(i).getCountryId();
	 %>	
	 	<%
	 		if(country_Id == Countryid){
	 	%>
	 	<option value="<%= country_Id%>" selected><%=Country.get(i).getName() %></option>
	 	<%
	 		}else{
	 	%>
	 	<option value="<%= country_Id%>"><%=Country.get(i).getName() %></option>
	 	<%
	 		}
	 	%>
	 	<%
		 }
	 	%>
	</select>
	<br>
	
      <input type="submit" class="btn btn-primary" name="<portlet:namespace/>Updateorg" id="<portlet:namespace/>updateorg" value="Update" />    	
	   <a href="<%= cancelURL %>" class="btn btn-secondary">Cancel </a>
	</div>
	</form>

<%-- UI validation  --%>  
	<script type="text/javascript">
	YUI().use(
		  'aui-form-validator',
		  function(Y) {
		    new Y.FormValidator(
		      {
		        boundingBox: '#updateorgForm',
		      }		
		    );
		  }
		);
</script>
	
