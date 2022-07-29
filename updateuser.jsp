
<%@page import="java.time.LocalDate"%>
<%@page import="com.liferay.portal.kernel.model.User"%>
<%@page import="com.liferay.portal.kernel.language.Language"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.liferay.portal.kernel.model.ListType"%>
<%@page import="com.liferay.portal.kernel.model.Organization"%>
<%@page import="com.liferay.portal.kernel.model.Role"%>
<%@page import="com.liferay.portal.kernel.model.Contact"%>
<%@page import="java.util.List"%>
<%@ include file="init.jsp"%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" type="text/javascript"></script>
		
	<portlet:renderURL var="cancelURL">
    <portlet:param name="mvcPath" value="/view.jsp"/>
	</portlet:renderURL>
	
	<portlet:renderURL var="ChangeUrl">
    <portlet:param name="mvcPath" value="/image.jsp"/>
	</portlet:renderURL>
	
 	<portlet:actionURL name="Updateuser" var="updateuserActionURL"/>
 	
	<%
    Long userId =Long.parseLong( request.getParameter("userId"));
    String emailAddress = request.getParameter("emailAddress");
    String screenName = request.getParameter("screenName");
    String firstName = request.getParameter("firstName");
    String middleName = request.getParameter("middleName");
    String lastName = request.getParameter("lastName");  
    String jobTitle = request.getParameter("jobTitle");
    Boolean male =  Boolean.parseBoolean(request.getParameter("male"));
    String comments = request.getParameter("comments"); 
    String languageId = request.getParameter("languageId"); 
    String roleIds =request.getParameter("roleIds");
	String organizationIds =request.getParameter("organizationIds");
	
	 List<Role> userRoles=( List<Role>)request.getAttribute("userRoles");
	
	 List<User> userList=( List<User>)request.getAttribute("userList");
	 
	 List<Organization> organizationList = (List<Organization>)request.getAttribute("organizationList"); 
  
	 List<Contact> Contact =(List<Contact>)request.getAttribute("Contact");
	 
	 List<ListType> prefixList =(List<ListType>)request.getAttribute("prefixList");
	 
	 List<ListType> suffixList =(List<ListType>)request.getAttribute("suffixList"); 
	 	 
	%> 
		 <h2>Information</h2><br>
   		 <h5>PERSONAL INFORMATION</h5>
   		 <hr>
   		 
		<portlet:actionURL name="addimage" var="addimageURL"/> 
		
	<form action="<%=addimageURL%>" method="post" enctype="multipart/form-data">
	<div class="collapse " id="image">  
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Upload images </h5>
      </div>
      	<img hight="100px" class="m-3" width="100px" alt="" src="https://p.kindpng.com/picc/s/451-4517876_default-profile-hd-png-download.png"><br>
       	
      	<input name="<portlet:namespace/>userId" class="form-control"  type="hidden" id="<portlet:namespace/>userId" value="<%=userId%>" />
	
	 	<input type="file" class="mx-3" name="img"  accept="image/*" />      
	 	
      	<div class="modal-footer row">
       	 <button class="btn btn-primaary active" type="button" data-toggle="collapse" data-target="#image" aria-expanded="false">Close</button>
       	 <input type="submit" class="btn btn-primary" name="<portlet:namespace/>addimage" id="<portlet:namespace/>addimage"  value="Done"   /> 	
           
        </div>
      </div>
    </div>
    </form>
 	
	<form action="<%=updateuserActionURL%>" method="post" name="updateuserForm" id="updateuserForm" >
	
	<div class="row">
	<div class="col-6 ml-4">  
		<label class="control-label" >ScreenName</label>
		 <div class="controls"> 
     	<input type="text" name="<portlet:namespace/>screenName" class="form-control  field-required " id="<portlet:namespace/>screenName" value="<%=screenName%>"/><br>
     	</div>
     	</div>
     	
         <div class="col-4 ml-2">
          <img hight="100px" width="100px" alt="" src="https://p.kindpng.com/picc/s/451-4517876_default-profile-hd-png-download.png">
     	</div>
     		
     <div class="col-6 ml-4">
      	 <label class="control-label" >Email</label>
      	 <div class="controls"> 
    	 <input type="text" name="<portlet:namespace/>emailAddress" class="form-control  field-required field-email" id="<portlet:namespace/>emailAddress" value="<%=emailAddress%>"/><br>
     	</div>
     	</div>
   
    <div class="col-4 ml-2"><br>
	      <button class="btn btn-primaary active" type="button" data-toggle="collapse" data-target="#image" aria-expanded="false" 
         	aria-controls="data"> Change</button>  
	</div>
  	
     <div class="col-6 ml-4">
     	<label class="control-label" >Language</label><br>
	 <select class="form-control" id="<portlet:namespace/>languageId" name="<portlet:namespace/>languageId">    
 	   
 	<%--     <option value="en_US"  <c:if test="${ languageId == en_US}"> selected </c:if> >English (United States)</option>
     	 <option value="fr_FR" <c:if test="${ languageId == fr_FR}"> selected </c:if> >French (Canada)</option>
     	 <option value="nl_NL" <c:if test="${ languageId == nl_NL}"> selected  </c:if> >Nederlands (Nederlands) </option>
     	 <option value="ja_JP" <c:if test="${ languageId == ja_JP}"> selected  </c:if> >Chinese (HongKong)</option>    --%>	   
 	   
         <option value="en_US" <% if(languageId == "en_US"){ %> selected<%} %> >English (United States)</option>
     	 <option value="fr_FR" <% if(languageId == "fr_FR"){ %> selected<%} %> >French (Canada)</option>
     	 <option value="nl_NL" <% if(languageId == "nl_NL"){ %> selected<%} %> >Nederlands (Nederlands) </option>
     	 <option value="ja_JP" <% if(languageId == "ja_JP"){ %> selected<%} %> >Chinese (HongKong)</option>   
 
	</select>
	</div>
	
	<div class="col-4 ml-2">
	<label class="control-label" >UserId</label><br>
		<input name="<portlet:namespace/>upuserId" class="form-control"  type="text" id="<portlet:namespace/>upuserId" value="<%=userId%>" readonly/>
	</div><br>
     
     <div class="col-6 ml-4">
     	<label class="control-label" >Prefix</label><br>
	<select class="form-control" style="text-transform: capitalize" id="<portlet:namespace/>prefixId" name="<portlet:namespace/>prefixId"> 
	   	<%
    	 for(int i=0; i<Contact.size(); i++){
    	 long userid =Contact.get(i).getUserId();	
    	 if(userid == userId)
    	 {
		 long prefixid =Contact.get(i).getPrefixId();	      
    	 %>                  
 	 	<%
		 for(int j=0; j<prefixList.size(); j++){
		 long prefix_Id =prefixList.get(j).getListTypeId();	
		 %>	
	 	<%
	 		if(prefix_Id == prefixid){
	 	%>
	 	<option value="<%= prefix_Id%>" selected><%=prefixList.get(j).getName() %></option>
	 	<%
	 		}else{
	 	%>
	 	<option value="<%= prefix_Id%>"><%=prefixList.get(j).getName() %></option>
	 	<%
		 }}}}
	 	%>    
	</select>
	</div>

	  <div class="col-4 ml-2 ">
     	<label class="control-label" >Birthday</label>
  	 <%
     for(int i=0; i<Contact.size(); i++){
    	 long userid =Contact.get(i).getUserId();	
    	 if(userid == userId)
    	 { 		 
    		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy ");  
    		java.util.Date  date =Contact.get(i).getBirthday();
      	/* 	 out.println(formatter.format(date));   */
		  %>        		    	 
    	<input id="txtDate" type="text" class="form-control date-input field-required" readonly="readonly" name="<portlet:namespace/>Birthday" value="<%=formatter.format(date)%> "  max='<%=LocalDate.now().minusMonths(2)%>' />     
    <!-- 	<span class="glyphicon glyphicon-calendar"></span>    -->
     	 <%
    	 }}
          %>   
     	</div><br>
     	<%-- <input type="text" class="form-control date-input field-required" name="<portlet:namespace/>Birthday"  data-date-format="mm/dd/yyyy"  id="<portlet:namespace/>Birthday" value="<%=formatter.format(date)%> "  /> 
     	 --%>
  
     <div class="col-6 ml-4">
	 	<label class="control-label" >First Name</label>
	 	 <div class="controls"> 
     	<input type="text" name="<portlet:namespace/>firstName" class="form-control  field-required " id="<portlet:namespace/>firstName" value="<%=firstName%>"/><br>
   		</div> 
     </div><br>
        
      <div class="col-4 ml-2">
     	<label> select Gender</label><br>  	  
     	    <% if(male == true){ %>
 			<input type="radio" name="<portlet:namespace/>Gender" value="true" checked="checked" > Male 
			<input type="radio" name="<portlet:namespace/>Gender" value="false">Female
  			<%}else{ %>
             <input type="radio" name="<portlet:namespace/>Gender" value="true"> Male 
        	 <input type="radio" name="<portlet:namespace/>Gender" value="false" checked="checked">Female
    		<% } %>  
		</div><br>

     <div class="col-6 ml-4">
         <label class="control-label" >Middle Name</label>
          <div class="controls"> 
     	 <input type="text" name="<portlet:namespace/>middleName" class="form-control  field-required " id="<portlet:namespace/>middleName" value="<%=middleName%>"/><br>
     	</div>
     	</div>
	
     <div class="col-4 ml-2" >
		<label class="control-label" >JobTitle</label><br>
     	<input type="text" class="form-control  field-required "  name="<portlet:namespace/>jobTitle" id="<portlet:namespace/>jobTitle" value="<%=jobTitle%>"/><br>    
	</div><br>

     <div class="col-6 ml-4">
         <label class="control-label" >LastName</label>
          <div class="controls"> 
     	 <input type="text" name="<portlet:namespace/>lastName" class="form-control  field-required " id="<portlet:namespace/>lastName" value="<%=lastName%>"/>    
     	</div>
     	</div>
	 
     <div class="col-4 ml-2">
     	<label class="control-label" >Role</label><br>
	<select class="form-control"  id="<portlet:namespace/>Role" name="<portlet:namespace/>Role" multiple>
	<option value="0" > Select Role </option>
<%--  	 <c:forEach items="${userRoles}" var="role">  
   		<option value="${role.roleId}">${role.name}</option>
    	</c:forEach>   --%>
    	  <%
     	for(int i=0; i<userList.size(); i++){
    	 long userid =userList.get(i).getUserId();	
    	 if(userid == userId)
    	 {
		 long[] roleid =userList.get(i).getRoleIds();	      
    	 %>	
 		 <%
		 for(int j=0; j<userRoles.size(); j++){
		 long userrole =userRoles.get(j).getRoleId();		 
		 %>	
		 <%
		 for( int k=0; k<roleid.length; k++){
		 %>
	 	<%
	 	 if(roleid[k] == userrole){
	 	%>
	 	<option value="<%= roleid%>" selected><%=userRoles.get(j).getName() %></option>
	 	<%
	 		}else{
	 	%>
	 	<option value="<%= roleid%>"><%=userRoles.get(j).getName() %></option>
	 	<%
		 }}}}}
	 	%>             
	</select>
	</div>    
     <br>
   
      <div class="col-6 ml-4">
     <label class="control-label" >Suffix</label><br>
	 <select class="form-control"  id="<portlet:namespace/>suffixId" name="<portlet:namespace/>suffixId">	
	     <%
     	for(int i=0; i<Contact.size(); i++){
    	 long userid =Contact.get(i).getUserId();	
    	 if(userid == userId)
    	 {
		 long suffixid =Contact.get(i).getSuffixId();	      
    	 %>	
 		 <%
		 for(int j=0; j<suffixList.size(); j++){
		 long suffix_Id =suffixList.get(j).getListTypeId();	
		 %>	
	 	<%
	 	 if(suffix_Id == suffixid){
	 	%>
	 	<option value="<%= suffix_Id%>" selected><%=suffixList.get(j).getName() %></option>
	 	<%
	 		}else{
	 	%>
	 	<option value="<%= suffix_Id%>"><%=suffixList.get(j).getName() %></option>
	 	<%
		 }}}}
	 	%>             
	 </select>
	 </div>
	 
	 <div class="col-4 ml-2">
     	<label class="control-label" >Organization</label><br>
     		<select class="form-control" id="<portlet:namespace/>orgId" name="<portlet:namespace/>OrgId" >
		<option value="0" > Select Organization </option>
     	 <%
     	for(int i=0; i<userList.size(); i++){
    	 long userid =userList.get(i).getUserId();	
    	 if(userid == userId)
    	 {
		 long[] orgid =userList.get(i).getOrganizationIds();	      
    	 %>	
 		 <%
		 for(int j=0; j<organizationList.size(); j++){
		 long userorg =organizationList.get(j).getOrganizationId();		 
		 %>	
		 <%
		 for( int k=0; k<orgid.length; k++){
		 %>
	 	<%
	 	 if(orgid[k] == userorg){
	 	%>
	 	<option value="<%= userorg%>" selected><%=organizationList.get(j).getName() %></option>
	 	<%
	 		}else{
	 	%>
	 	<option value="<%= userorg%>"><%=organizationList.get(j).getName() %></option>
	 	<%
		 }}}}}
	 	%> 
	  </select>
	</div>	 
	 </div>
	 
	 	<div class="col-6 ml-3">
     	<label class="control-label" >Password</label>
     	 <div class="controls"> 
     	<input type="text" name="<portlet:namespace/>password1" class="form-control "id="<portlet:namespace/>password1"/><br>
     	</div>
 	 </div>
 	 
 	   <div class="col-6 ml-3">
     	<label class="control-label" >Re write Password</label>
     	 <div class="controls"> 
     	<input type="text" name="<portlet:namespace/>password2" class="form-control "id="<portlet:namespace/>password2"/>
     	</div>
     	 <div style="display:none;" id="<portlet:namespace/>password2ErrorMessage">
     		<p style="color:red;"> write correct password</p>
     	</div>
 	 </div><br>
	 
	  <div class=" ml-4">
 	 	<label class="control-label" >Comments</label><br>    
     	<textarea class="form-control" id="<portlet:namespace/>comments" name="<portlet:namespace/>comments" rows="3" ><%=comments%></textarea>
     </div><br>
     
     <div class="row ml-3">
     	<input type="submit" class="btn btn-primary" name="<portlet:namespace/>Updateuser" id="<portlet:namespace/>Updateuser"  value="Update"   /> 	
	    <a href="<%=cancelURL %>" class="btn  btn-secondary mx-3 ">Cancel </a>
	    </div>  
	</form>

	 <script>
    AUI().use('aui-base','aui-io-request','aui-node', function(A){       
       
        A.one("#<portlet:namespace/>password2").on('blur',function(){	
            A.one("#<portlet:namespace/>password1").get("value");
            A.one("#<portlet:namespace/>password2").get("value");
       		var password1=A.one("#<portlet:namespace/>password1").get("value");
        	var password2=A.one("#<portlet:namespace/>password2").get("value");
        
        if(password1 == password2){
            A.one("#<portlet:namespace/>password2").setStyle('border','1px solid green');
            A.one('#<portlet:namespace />password2ErrorMessage').hide(); 
          
    	}else{
            A.one("#<portlet:namespace/>password2").setStyle('border','1px solid red');
            A.one('#<portlet:namespace />password2ErrorMessage').show();             
  		  }
    });               
    });     
	</script>
	
	<%-- UI validation  --%>  
	<script type="text/javascript">
	YUI().use(
		  'aui-form-validator',
		  function(Y) {
		    new Y.FormValidator(
		      {
		        boundingBox: '#updateuserForm',
		        rules: {
		            email: {
		              email: true,
		              required: true
		            }
		          }
		      }		
		    );
		  }
		);
	</script>
	
	
 <script type="text/javascript">
        $(function () {
            $('#txtDate').datepicker({
                format: "mm/dd/yyyy"
            });
        });
    </script>

