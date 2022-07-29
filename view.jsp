<%@page import="java.sql.Date"%>
<%@ include file="/init.jsp" %>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">	  
	
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.1.4/dist/css/datepicker.min.css'>     
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

	<script src='https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.1.4/dist/js/datepicker-full.min.js'></script>
	 
 
 	<portlet:renderURL var="URL">
    	<portlet:param name="mvcPath" value="/view.jsp"/>
		</portlet:renderURL>
		
		 <portlet:renderURL var="dashBoard">
    	<portlet:param name="mvcPath" value="/organizationdashboard.jsp"/>
		</portlet:renderURL>
		
	<div id="myTab">
     
     <ul class="nav nav-tabs">
     <li class="active"><a href="#tab-1">User</a></li>
      <li  ><a href="#tab-2">Organization</a></li>
  	 </ul>
  	     	  
     <div class="tab-content">
     <div id="tab-1">
    
    <portlet:renderURL var="adduserRenderURL">
    <portlet:param name="mvcPath" value="/adduser.jsp"/>
	</portlet:renderURL>
 
		<div>
   		 <a href="<%= adduserRenderURL %>" class="btn  btn-primary col-2 offset-10">
        <i class="glyphicon glyphicon-plus"></i>Add User
    	</a>
    
       <Table>
              <thead>
              <tr>
                <th class="col-3">Name</th>
                <th class="col-3">Screen Name</th>
                <th class="col-3">Job Title</th>
                <th class="col-3">Age</th>
                <th class="col-4">Actions</th>               
              </tr>
            </thead>
    		 
           <c:forEach items="${userList}" var="User">  	 
           	       	     
	    <portlet:renderURL  var="updateuserRenderURL">  
	   		 <portlet:param name="mvcPath" value="/updateuser.jsp"/>       
             <portlet:param name="firstName" value="${User.firstName}"/>
             <portlet:param name="middleName" value="${User.middleName}"/>
             <portlet:param name="lastName" value="${User.lastName}"/>
             <portlet:param name="screenName" value="${User.screenName}"/>
             <portlet:param name="userId" value="${User.userId}"/>
             <portlet:param name="jobTitle" value="${User.jobTitle}"/>
             <portlet:param name="emailAddress" value="${User.emailAddress}"/>
             <portlet:param name="male" value="${User.male}"/>
             <portlet:param name="comments" value="${User.comments}"/>  
             <portlet:param name="languageId" value="${User.languageId}"/> 
             <portlet:param name="roleIds" value="${User.roleIds}"/>   
             <portlet:param name="organizationIds" value="${User.organizationIds}"/>                              
			
        </portlet:renderURL>
             
        <portlet:actionURL name="deleteuser" var="deleteuserActionURL">
            <portlet:param name="userId" value="${User.userId}"/>
        </portlet:actionURL>
        <tbody>
         
        <tr>
            <td>${User.firstName}</td>
            <td>${User.screenName}</td>
             <td>${User.jobTitle} </td> 
            <td>	
            <c:forEach items="${Contact}" var="Contact"> 
            <c:if test="${User.userId == Contact.userId}">                       
          		 ${122-Contact.birthday.year} Year
            </c:if>
            </c:forEach> </td>  
                  
    		  <td>
    			<a href="<%=updateuserRenderURL%>" class="btn btn-primary px-3 py-2" > 		
                <i class ="glyphicon glyphicon-edit"></i>
                </a> 
         </td>
         <td>
                <a href="<%=deleteuserActionURL%>" class="btn btn-primary px-3 py-2"
                    onclick="return confirm('Are you sure you want to delete this item?');"> 
                    <i class ="glyphicon glyphicon-remove"></i>
                </a>
            </td>                                     
         </tr>       
        </tbody>   
      </c:forEach>         
    </Table>
  </div>  
</div>

    <div id="tab-2" class="tab-pane">
    
	<portlet:renderURL var="addorgRenderURL">
    	<portlet:param name="mvcPath" value="/addorg.jsp"/>
	</portlet:renderURL>

	<div>
    <a href="<%= addorgRenderURL %>" class="btn btn-primary col-3 offset-9">
        <i class="glyphicon glyphicon-plus"></i>Add Organization
    </a>
	</div>         
             <Table>
              <thead>
              <tr>
                <th class="col-6">Name</th>
                <th class="col-6">Country</th>
                <th class="col-6">Actions</th>                
              </tr>
            </thead>
                    
       <c:forEach items="${organizationList}" var="Organization">  
           
      <portlet:renderURL var="updateorganizationRenderURL">
      		<portlet:param name="mvcPath" value="/updateorg.jsp"/>
      		<portlet:param name="name"  value="${Organization.name}"/>
      		<portlet:param name="userId"  value="${Organization.userId}"/>
      		<portlet:param name="organizationId" value="${Organization.organizationId}"/>
            <portlet:param name="Type"  value="${Organization.type}"/>
            <portlet:param name="CountryId"  value="${Organization.countryId}"/>
            
     </portlet:renderURL>
                       
        <portlet:actionURL name="deleteorganization" var="deleteorganizationActionURL">
            <portlet:param name="organizationId" value="${Organization.organizationId}"/>
        </portlet:actionURL>
        
       <tbody>                
        <tr> 
      <%--     <td style="text-transform: capitalize">
           	<c:forEach items="${organizationList}" var="organizationList">  
          	 <c:if test="${Organization.userId == organizationList.userId}"> 
           		${organizationList.name}    
               </c:if>   </c:forEach> </td>  --%> 
           <td style="text-transform: capitalize">
             <a href="<%= dashBoard %>">  ${Organization.name}</a>
             </td>
             <td style="text-transform: capitalize"> 
           	<c:forEach items="${Country}" var="country">  
          	 <c:if test="${country.countryId == Organization.countryId}"> 
           		${country.name}    
               </c:if>    
                   </c:forEach> 
                   </td>                    
              <td >
    	 		<a href="<%=updateorganizationRenderURL%>" class="btn  btn-primary px-3 py-2" > 		
                <i class ="glyphicon glyphicon-edit"></i>
                </a>
            </td> 
            <td >
                <a href="<%=deleteorganizationActionURL%>"  class="btn  btn-primary px-3 py-2"
                    onclick="return confirm('Are you sure you want to delete this item?');"> 
                	<i class ="glyphicon glyphicon-remove"></i>
                </a>
            </td>          
       </tr>
       </tbody> 
     </c:forEach>
    </Table>
    </div>
    </div>
    </div>

<script>
YUI().use(
		  'aui-tabview',
		  function(Y) {
		    new Y.TabView(
		      {
		        srcNode: '#myTab'
		      }
		    ).render();
		  }
		);
</script>
