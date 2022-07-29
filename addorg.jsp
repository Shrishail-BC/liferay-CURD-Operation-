<%@ include file="init.jsp"%>
<portlet:defineObjects/>

  	<portlet:renderURL var="cancelURL">
    <portlet:param name="mvcPath" value="/view.jsp"/>
	</portlet:renderURL>
	
    <portlet:actionURL var="addorganizationActionURL" windowState="normal" name="createorg"/>
    <portlet:resourceURL var="addorganizationURL"/>
  
    <h3>Add Organization</h3>
	
 	<form action="<%=addorganizationActionURL%>" name="<portlet:namespace/>createorgForm" id="createorgForm" method="POST">
 	   <div class="col-6">     
     	<label class="control-label" >Name</label>
     	 <div class="controls"> 
     	<input type="text" name="<portlet:namespace/>organizationName" class="form-control field-required " id="<portlet:namespace/>organizationName"/>
     	</div>
     	<div style="display:none;" id="<portlet:namespace/>organizationNameExistanceErrorMessage">
   		  <p style="color:red;"> organization Name Already Exist, Please Use Any other</p>
     	</div><br>
     
		<label class="control-label field-required " >Country</label><br>
		<select class="form-control "  style="text-transform: capitalize" id="<portlet:namespace/>CountryId" name="<portlet:namespace/>CountryId">
			<option value="0" > Select Country </option>
		 <c:forEach items="${Country}" var="country">  
   		<option style="text-transform: capitalize" value="${country.countryId}"> ${country.name}</option>
    </c:forEach>			
  </select>
  <div style="display:none;" id="<portlet:namespace/>countryExistanceErrorMessage">
   		  <p style="color:red;"> Select of these Countrys</p>
     	</div>
     <br>
     
       <div class="row ml-2">
    	<div style="display:none;" id="<portlet:namespace/>adding">
   		  <input type="submit" class="btn btn-primary"  value="Add" name="<portlet:namespace/>Addorg"  id="<portlet:namespace/>Addorg"/>		
     	</div>
           <a href="<%= cancelURL %>" class="btn btn-secondary mx-3 ">Cancel </a> 
           </div>
	</div>
	</form> 
	<script>
    AUI().use('aui-base','aui-io-request','aui-node', function(A){       
        var organizationNameValidation=false;
        
        A.one("#<portlet:namespace/>organizationName").on('blur',function(){
        var organizationName=A.one("#<portlet:namespace/>organizationName").get("value");
        
        A.io.request('<%=addorganizationURL%>',{
        dataType : 'json',
        method : 'GET',
        data : { 
        	<portlet:namespace/>organizationName :organizationName,
        	<portlet:namespace/>cmd:'ORGANIZATION'
        },
        on : {
        success : function() {
        var data = this.get('responseData');
        var isorganizationNameExist=data.organizationNameExist;
        
        if(isorganizationNameExist=='true'){
               A.one("#<portlet:namespace/>organizationName").setStyle('border','1px solid red');
               A.one('#<portlet:namespace />organizationNameExistanceErrorMessage').show();
               A.one('#<portlet:namespace />adding').hide();
               organizationNameValidation=false;
       		 }
        if(isorganizationNameExist=='false'){
               A.one("#<portlet:namespace/>organizationName").setStyle('border','1px solid green');
               A.one('#<portlet:namespace />organizationNameExistanceErrorMessage').hide();
               A.one('#<portlet:namespace />adding').show();
               organizationNameValidation=true;
        	}
       	 }
        }
      });
        });
     
        A.one("#<portlet:namespace/>CountryId").on('blur',function(){              	
            A.one("#<portlet:namespace/>CountryId").get("value");          
       		var CountryId=A.one("#<portlet:namespace/>CountryId").get("value");

        if(CountryId == 0){
            A.one("#<portlet:namespace/>CountryId").setStyle('border','1px solid red');
            A.one('#<portlet:namespace />countryExistanceErrorMessage').show(); 
            A.one('#<portlet:namespace />adding').hide();
    	}else{
            A.one("#<portlet:namespace/>CountryId").setStyle('border','1px solid green');
            A.one('#<portlet:namespace />countryExistanceErrorMessage').hide();   
            A.one('#<portlet:namespace />adding').show();
  		  }
         
    });
        A.one("#<portlet:namespace/>Addorg").on('blur',function(){              	
            A.one("#<portlet:namespace/>CountryId").get("value");          
       		var CountryId=A.one("#<portlet:namespace/>CountryId").get("value");

        if(CountryId == 0){
            A.one("#<portlet:namespace/>CountryId").setStyle('border','1px solid red');
            A.one('#<portlet:namespace />countryExistanceErrorMessage').show(); 
            A.one('#<portlet:namespace />adding').hide();
    	}else{
            A.one("#<portlet:namespace/>CountryId").setStyle('border','1px solid green');
            A.one('#<portlet:namespace />countryExistanceErrorMessage').hide();   
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
		        boundingBox: '#createorgForm',
		      }		
		    );
		  }
		);
</script>


 