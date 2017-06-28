 $(function () {
      // Invoke the plugin
     // $('input, textarea').placeholder();
  });


  //from set
	$.fn.setForm = function(jsonValue) {  
	    var obj=this;  
	    $.each(jsonValue, function (name, ival) {  
	        var $oinput = obj.find("input[name='" + name + "']");  
	        if ($oinput.attr("type")== "radio" || $oinput.attr("type")== "checkbox"){  
	             $oinput.each(function(){  
	                 if(Object.prototype.toString.apply(ival) == '[object Array]'){//checkboxs 
	                      for(var i=0;i<ival.length;i++){  
	                          if($(this).val()==ival[i])  
	                             $(this).attr("checked", "checked");  
	                      }  
	                 }else{  
	                     if($(this).val()==ival)  
	                        $(this).attr("checked", "checked");  
	                 }  
	             });  
	        }else if($oinput.attr("type")== "textarea"){//textarea
	            obj.find("[name="+name+"]").html(ival);  
	        }else{  
	             obj.find("[name="+name+"]").val(ival);   
	        }  
	   });  
	};

	//form clear
	$.fn.clear=function(){
		 // iterate over all of the inputs for the form
		  // element that was passed in
		  var form = this;
		  $(':input', form).each(function() {
		    var type = this.type;
		    var tag = this.tagName.toLowerCase(); // normalize case
		    // it's ok to reset the value attr of text inputs,
		    // password inputs, and textareas
		    if (type == 'text' || type == 'password' || tag == 'textarea' || type=='hidden' || type=='number')
		      this.value = "";
		    // checkboxes and radios need to have their checked state cleared
		    // but should *not* have their 'value' changed
		    else if (type == 'checkbox' || type == 'radio')
		      this.checked = false;
		    // select elements need to have their 'selectedIndex' property set to -1
		    // (this works for both single and multiple select elements)
		    else if (tag == 'select')
		      this.selectedIndex = -1;
		  });
		
	}

	//js post submit
	//use method : post("<%=basePath %>task/index.shtml",{'timerUuid':uuid,'note':timerName});
	function post(url, params) {
	    var temp = document.createElement("form");
	    temp.action = url;
	    temp.method = "post";
	    temp.style.display = "none";
	    for (var x in params) {
	        var opt = document.createElement("input");
	        opt.name = x;
	        opt.value = params[x];
	        temp.appendChild(opt);
	    }
	    document.body.appendChild(temp);
	    temp.submit();
	    return temp;
	}   