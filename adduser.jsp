	<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ include file="init.jsp"%>
	<portlet:defineObjects/>
		
	<portlet:renderURL var="cancelURL">
    <portlet:param name="mvcPath" value="/view.jsp"/>
	</portlet:renderURL>
	
	<portlet:actionURL var="adduserActionURL" windowState="normal" name="createuser"/> 
	<portlet:resourceURL var="adduserURL"/> 
	
    <h2>Information</h2><br>
    <h5>PERSONAL INFORMATION</h5>
    <hr>

 	<form action="<%=adduserActionURL%>" name="createuserForm" id="createuserForm" method="POST">     
  	<div class="row">
 	 <div class="col-6 ml-3">
   		 <label class="control-label" >ScreenName</label>
   		 <div class="controls">
     	 <input type="text" name="<portlet:namespace/>screeName" placeholder="Enter the screenName"  class="form-control field-required" id="<portlet:namespace/>screeName" />
     	 </div>
     	<div style="display:none;" id="<portlet:namespace/>screenExistanceErrorMessage">
   		  <p style="color:red;"> Screen Name Already Exist, Please Use Any other</p>
     	</div></div>  
     	
      <div class="col-4 ml-3">
    	 <label class="control-label" >Birthday</label>
    	  <div class="controls"> 
    	 <input type="date" class="form-control field-required " name="<portlet:namespace/>Birthday" id="<portlet:namespace/>Birthday"  max='<%=LocalDate.now().minusMonths(2)%>' /> 
    	 </div>
     </div><br>
     
     <div class=" col-6 ml-3 ">
 	 	<label class="control-label" >Email</label>
 	 	 <div class="controls"> 
     	<input type="email" name="<portlet:namespace/>emailAddress"  placeholder="Enter the Email Address" class="form-control field-required field-email" id="<portlet:namespace/>emailAddress" />
     	</div>
     	<div style="display:none;" id="<portlet:namespace/>emailExistanceErrorMessage">
     		<p style="color:red;">Email Id Already Exist, Please Use Any other</p>
     	</div></div> 
     
     <div class="col-4 ml-5">
     <label class="control-label" >Select Gender</label><br>
		<input type="radio" name="<portlet:namespace/>Gender" value="true" required> Male 
		<input type="radio" name="<portlet:namespace/>Gender" value="false" required>Female
		</div><br>
		
	 <div class="col-6 ml-3">
     	<label class="control-label" >Language</label><br>
	<select class="form-control" id="<portlet:namespace/>Language" name="<portlet:namespace/>Language">
   		<option value="en_US" selected>English (United States)</option>
   		<option value="fr_FR">French (Canada)</option>
  		<option value="nl_NL">Nederlands (Nederlands) </option>
   		<option value="ja_JP">Chinese (HongKong)</option>
	</select>
	</div>
	
	<div class="col-4 ml-3" >
		<label class="control-label" >JobTitle</label>
		<div class="controls"> 
     	<input type="text" class="form-control field-required" placeholder="Enter the JobTitle" name="<portlet:namespace/>jobTitle" id="<portlet:namespace/>jobTitle"/><br>    
	</div>
	</div>
		
	<div class="col-6 ml-3">
     	<label class="control-label" >Prefix</label><br>
	<select class="form-control field-required" style="text-transform: capitalize" id="<portlet:namespace/>prefixId" name="<portlet:namespace/>prefixId">
  		 <option value="0" selected> Select Prefix</option>
   		 <option value="11014">Dr</option>
  		 <option value="11015">Mr</option>
   		 <option value="11017">Ms</option>
   		 <option value="11016">Mrs</option>
	</select>
	 <div style="display:none;" id="<portlet:namespace/>prefixIdErrorMessage">
     		<p style="color:red;"> select one of these prefix</p>
     	</div>
	</div>	
	
	 <div class="col-4 ml-3">
     	<label class="control-label" >Role</label><br>
	<select class="form-control" id="<portlet:namespace/>Role" name="<portlet:namespace/>Role" multiple>
	<option value="0" selected> Select Role </option>
	 <c:forEach items="${userRoles}" var="Role">  
   		<option value="${Role.roleId}">${Role.name}</option>
    </c:forEach>
	</select>
	 <div style="display:none;" id="<portlet:namespace/>RoleErrorMessage">
     		<p style="color:red;"> select one of these Role</p>
     	</div>	
	</div>
	
	<div class="col-6 ml-3">
     		<label class="control-label" >First Name</label>
     		 <div class="controls"> 
     		<input type="text" class="form-control field-required"  placeholder="Enter the FirstName" name="<portlet:namespace/>firstName" id="<portlet:namespace/>firstName"/>
     		</div>
     </div>
     
     <div class="col-4 ml-3">
     	<label class="control-label" >Organization</label><br>
	<select class="form-control" id="<portlet:namespace/>orgId" name="<portlet:namespace/>OrgId" >
	<option value="0" selected> Select Organization</option>
	 <c:forEach items="${organizationList}" var="org">  
   		<option style="text-transform: capitalize" value="${org. organizationId}">${org.name}</option>
    </c:forEach>	
	</select>
	 <div style="display:none;" id="<portlet:namespace/>orgIdErrorMessage">
     		<p style="color:red;"> select one of these Organization</p>
     	</div>
	</div>
      
      <div class="col-6 ml-3">
    	 <label class="control-label" >Middle Name</label>
    	  <div class="controls"> 
     	 <input type="text" name="<portlet:namespace/>middleName"  placeholder="Enter the MiddleName" class="form-control field-required" id="<portlet:namespace/>middleName"/>
     	  </div>
      </div>
      
     <div class="col-6 ml-3">
     	<label class="control-label" >Last Name</label><br>
     	 <div class="controls">
     	<input type="text" name="<portlet:namespace/>lastName"  placeholder="Enter the LastName" class="form-control field-required"id="<portlet:namespace/>lastName"/>
     	</div>
 	 </div>
 	 
 	 <div class="col-6 ml-3">
 	
     	<label class="control-label" >Suffix</label><br>
	 <select class="form-control" id="<portlet:namespace/>suffixId" name="<portlet:namespace/>suffixId">
     	<option value="0" selected> Select Suffix</option>
     	<option value="11020">ll</option>
   	 	<option value="11021">lll</option>
   	 	<option value="11022">lv</option>
     	<option value="11023">Jr</option>
     	<option value="11024">Phd</option>
     	<option value="11025">Sr</option>
	 </select>
	  <div style="display:none;" id="<portlet:namespace/>suffixIdErrorMessage">
     		<p style="color:red;"> select one of these suffix</p>
     	</div>
	 </div><br>
	 
	   <div class="col-6 ml-3">
     	<label class="control-label" >Password</label>
     	 <div class="controls"> 
     	<input type="text" name="<portlet:namespace/>password1"  placeholder="Enter the Password" class="form-control field-required"id="<portlet:namespace/>password1"/><br>
     	</div>
 	 </div>
 	 
 	   <div class="col-6 ml-3">
     	<label class="control-label" >Re write Password</label>
     	 <div class="controls"> 
     	<input type="text" name="<portlet:namespace/>password2"  placeholder="Re Enter the Password" class="form-control field-required"id="<portlet:namespace/>password2"/>
     	</div>
     	 <div style="display:none;" id="<portlet:namespace/>password2ErrorMessage">
     		<p style="color:red;"> write correct password</p>
     	</div>
 	 </div>  </div>
	 
	  <div class="ml-3">
 	 	<label class="control-label" >Comments</label><br>
     	<textarea class="form-control" id="<portlet:namespace/>comments"  placeholder="Enter the Comments" name="<portlet:namespace/>comments" rows="3"></textarea>
     </div>
     <br>
         <div class="row ml-3">
    	<div style="display:none;" id="<portlet:namespace/>adding">
     	<input type="submit" class="btn btn-primary" name="<portlet:namespace/>Adduser" id="<portlet:namespace/>AddUser" value="Save"/>
     	</div>
	    <a href="<%= cancelURL%>" class="btn btn-secondary mx-3 ">Cancel </a>	
	    </div>  
	</form> 
    
	 <script>
	 
    AUI().use('aui-base','aui-io-request','aui-node', function(A){    
    	var screenNameExist=false;
    	var emailExist=false;
		
        A.one("#<portlet:namespace/>screeName").on('blur',function(){
        var screeName=A.one("#<portlet:namespace/>screeName").get("value");       
        
        A.io.request('<%=adduserURL%>',{
        dataType : 'json',
        method : 'GET',
        data : { <portlet:namespace/>screeName :screeName,
        <portlet:namespace/>cmd:'SCREENNAME'
        },
        on : {
        success : function() {
        var data = this.get('responseData');
        console.log(" "+data);
        var isScreenNameExist=data.screenNameExist;
        
        if(isScreenNameExist=='true'){
               A.one("#<portlet:namespace/>screeName").setStyle('border','1px solid red');
               A.one('#<portlet:namespace />screenExistanceErrorMessage').show();
               A.one('#<portlet:namespace />adding').hide();
           	   var screenNameExist=false;
       		 }
        if(isScreenNameExist=='false'){
               A.one("#<portlet:namespace/>screeName").setStyle('border','1px solid green');
               A.one('#<portlet:namespace />screenExistanceErrorMessage').hide();  
               A.one('#<portlet:namespace />adding').show();
          	  var screenNameExist=true;
        	}
       	 }
        }
      });
    });

        A.one("#<portlet:namespace/>emailAddress").on('blur',function(){
        	
        A.one("#<portlet:namespace/>emailAddress").get("value");
        var emailAddress=A.one("#<portlet:namespace/>emailAddress").get("value");
             
        A.io.request('<%=adduserURL%>',{
        dataType : 'json',
        method : 'GET',
        data : {
        <portlet:namespace/>emailAddress :emailAddress,
        <portlet:namespace/>cmd:'EMAIL'
        },
        on : {
        success : function() {
        var data = this.get('responseData');
        console.log(" "+data);
        var isEmailExist=data.emailExist;
        
        if(isEmailExist=='true'){
                A.one("#<portlet:namespace/>emailAddress").setStyle('border','1px solid red');
                A.one('#<portlet:namespace />emailExistanceErrorMessage').show();  
                A.one('#<portlet:namespace />adding'). hide();
            	var emailExist=false;
        	}
        if(isEmailExist=='false' ){
                A.one("#<portlet:namespace/>emailAddress").setStyle('border','1px solid green');
                A.one('#<portlet:namespace />emailExistanceErrorMessage').hide();   
                A.one('#<portlet:namespace />adding').show();
            	var emailExist=true;
      		  }     
        	}
       	 }
        });
     });
            
        A.one("#<portlet:namespace/>password2").on('blur',function(){        	
            A.one("#<portlet:namespace/>password1").get("value");
            A.one("#<portlet:namespace/>password2").get("value");
       		var password1=A.one("#<portlet:namespace/>password1").get("value");
        	var password2=A.one("#<portlet:namespace/>password2").get("value");
        
        if(password1 == password2){
            A.one("#<portlet:namespace/>password2").setStyle('border','1px solid green');
            A.one('#<portlet:namespace />password2ErrorMessage').hide(); 
            A.one('#<portlet:namespace />adding'). show();
    	}else{
            A.one("#<portlet:namespace/>password2").setStyle('border','1px solid red');
            A.one('#<portlet:namespace />password2ErrorMessage').show();   
            A.one('#<portlet:namespace />adding').hide();
  		  }
    });  
        
        A.one("#<portlet:namespace/>AddUser").on('blur',function(){              	
            A.one("#<portlet:namespace/>suffixId").get("value");          
       		var suffixId=A.one("#<portlet:namespace/>suffixId").get("value");

        if(suffixId == 0){
            A.one("#<portlet:namespace/>suffixId").setStyle('border','1px solid red');
            A.one('#<portlet:namespace />suffixIdErrorMessage').show(); 
            A.one('#<portlet:namespace />adding').hide();
    	}else{
            A.one("#<portlet:namespace/>suffixId").setStyle('border','1px solid green');
            A.one('#<portlet:namespace />suffixIdErrorMessage').hide();   
            A.one('#<portlet:namespace />adding').show();
  		  }
    });
        
        A.one("#<portlet:namespace/>suffixId").on('blur',function(){            	
                A.one("#<portlet:namespace/>suffixId").get("value");          
           		var suffixId=A.one("#<portlet:namespace/>suffixId").get("value");

            if(suffixId == 0){
                A.one("#<portlet:namespace/>suffixId").setStyle('border','1px solid red');
                A.one('#<portlet:namespace />suffixIdErrorMessage').show(); 
                A.one('#<portlet:namespace />adding').hide();
        	}else{
                A.one("#<portlet:namespace/>suffixId").setStyle('border','1px solid green');
                A.one('#<portlet:namespace />suffixIdErrorMessage').hide();   
                A.one('#<portlet:namespace />adding').show();
      		  }
        });
      
    A.one("#<portlet:namespace/>AddUser").on('blur',function(){   	
        A.one("#<portlet:namespace/>prefixId").get("value");          
   		var  prefixId=A.one("#<portlet:namespace/>prefixId").get("value");

    if( prefixId == 0){
        A.one("#<portlet:namespace/>prefixId").setStyle('border','1px solid red');
        A.one('#<portlet:namespace />prefixIdErrorMessage').show(); 
        A.one('#<portlet:namespace />adding'). hide();     
	}else{
        A.one("#<portlet:namespace/>prefixId").setStyle('border','1px solid green');
        A.one('#<portlet:namespace />prefixIdErrorMessage').hide();   
        A.one('#<portlet:namespace />adding').show();
	 }
	});
    
   	 A.one("#<portlet:namespace/>prefixId").on('blur',function(){	
        A.one("#<portlet:namespace/>prefixId").get("value");          
   		var  prefixId=A.one("#<portlet:namespace/>prefixId").get("value");

    if( prefixId == 0){
        A.one("#<portlet:namespace/>prefixId").setStyle('border','1px solid red');
        A.one('#<portlet:namespace />prefixIdErrorMessage').show(); 
        A.one('#<portlet:namespace />adding').hide();
	}else{
        A.one("#<portlet:namespace/>prefixId").setStyle('border','1px solid green');
        A.one('#<portlet:namespace />prefixIdErrorMessage').hide();   
        A.one('#<portlet:namespace />adding').show();;
	 }
	});
    
  	  A.one("#<portlet:namespace/>AddUser").on('blur',function(){    	
        A.one("#<portlet:namespace/>Role").get("value");          
   		var Role=A.one("#<portlet:namespace/>Role").get("value");

    if(Role == 0){
        A.one("#<portlet:namespace/>Role").setStyle('border','1px solid red');
        A.one('#<portlet:namespace />RoleErrorMessage').show(); 
        A.one('#<portlet:namespace />adding').hide();
	}else{
        A.one("#<portlet:namespace/>Role").setStyle('border','1px solid green');
        A.one('#<portlet:namespace />RoleErrorMessage').hide();   
        A.one('#<portlet:namespace />adding').show();
	}
	});
  	  
    A.one("#<portlet:namespace/>Role").on('blur',function(){   	
        A.one("#<portlet:namespace/>Role").get("value");          
   		var Role=A.one("#<portlet:namespace/>Role").get("value");

    if(Role == 0){
        A.one("#<portlet:namespace/>Role").setStyle('border','1px solid red');
        A.one('#<portlet:namespace />RoleErrorMessage').show(); 
        A.one('#<portlet:namespace />adding').hide();
	}else{
        A.one("#<portlet:namespace/>Role").setStyle('border','1px solid green');
        A.one('#<portlet:namespace />RoleErrorMessage').hide();   
        A.one('#<portlet:namespace />adding').show();
	}
	});
    
  	  A.one("#<portlet:namespace/>AddUser").on('blur',function(){  	
        A.one("#<portlet:namespace/>orgId").get("value");          
   		var orgId=A.one("#<portlet:namespace/>orgId").get("value");

    if(orgId == 0){
        A.one("#<portlet:namespace/>orgId").setStyle('border','1px solid red');
        A.one('#<portlet:namespace />orgIdErrorMessage').show(); 
        A.one('#<portlet:namespace />adding').hide();
	}else{
        A.one("#<portlet:namespace/>orgId").setStyle('border','1px solid green');
        A.one('#<portlet:namespace />orgIdErrorMessage').hide();   
        A.one('#<portlet:namespace />adding').show();
	}
	});
  	  
    A.one("#<portlet:namespace/>orgId").on('blur',function(){    	
        A.one("#<portlet:namespace/>orgId").get("value");          
   		var orgId=A.one("#<portlet:namespace/>orgId").get("value");

    if(orgId == 0){
        A.one("#<portlet:namespace/>orgId").setStyle('border','1px solid red');
        A.one('#<portlet:namespace />orgIdErrorMessage').show(); 
        A.one('#<portlet:namespace />adding').hide();
	}else{
        A.one("#<portlet:namespace/>orgId").setStyle('border','1px solid green');
        A.one('#<portlet:namespace />orgIdErrorMessage').hide();   
        A.one('#<portlet:namespace />adding').show();
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
		        boundingBox: '#createuserForm',
		        rules: {
		            email: {
		              email: true,
		              required: true
		            },          
		          }
		      }		
		    );
		  }
		);
</script>
