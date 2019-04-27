  	function disableDiv(type){
  		var s_active=document.getElementById("s_active");
  		var f_active=document.getElementById("f_active");
  		var student=document.getElementById("student");
  		var faculty=document.getElementById("faculty");
  		if(type==0){
  			student.style.display="block";
  			faculty.style.display = "none";
  			s_active.classList.add("active");
  			f_active.classList.remove("active")
  		}else{
  			student.style.display="none";
			faculty.style.display = "block";
  			f_active.classList.add("active")
  			s_active.classList.remove("active")
			}
  	}
  	var count=0;
  	function add_to_Todo(){
  		var input=document.getElementById("todo-input");

  		if(input.value.trim()==="")return;
  		var list=document.getElementById("table-body");
  		var tr = document.createElement("tr");
  		tr.setAttribute("id", count);
  		var td_content = document.createElement("td");
  		var td_button=document.createElement("td");
  		td_content.setAttribute("id","content"+count.toString());
  		td_content.setAttribute("style", "text-align:left");
  		td_content.setAttribute("style", "text-decoration: none");
  		td_content.appendChild(document.createTextNode(input.value));

  		td_button.setAttribute("style", "text-align:right; width:20%")
  		var anchor=document.createElement("a");
  		anchor.setAttribute("href","#main-table");
  		anchor.appendChild(document.createTextNode("x"));
  		anchor.setAttribute("id","anchor"+count);
  		//anchor.setAttribute("onClick",close(+count));
  		td_button.appendChild(anchor);
  		tr.appendChild(td_content);
  		tr.appendChild(td_button);
  		list.appendChild(tr);
  		//tr.setAttribute("onClick", "action(content"+count.toString()+")");
  		
  		input.value="";
  		count++;
  	}
  	
  	function action(tr){
			document.getElementById(tr).style.textDecoration="line-through";
  	}
  	function close(tr){
  		console.log("Element: "+tr+"--"+document.getElementById(tr));
  		document.getElementById(tr).setAttribute("style", "display:none");
  	}
  	
  	function setMenuActive(link){
  		var n0=document.getElementById("n0");
  		var n1=document.getElementById("n1");
  		var n2=document.getElementById("n2");
  		var n3=document.getElementById("n3");
  		var n4=document.getElementById("n4");


  		if(link.equals("dashboard")){
  			n0.classList.add("active");
  			n1.classList.remove("active");
  			n2.classList.remove("active");
  			n3.classList.remove("active");
  			n4.classList.remove("active");

  		}else if(link.equals("grades")){
  			n0.classList.remove("active");
  			n1.classList.remove("active");
  			n2.classList.remove("active");
  			n3.classList.add("active");
  			n4.classList.remove("active");

  		}else if(link.equals("profile")){
  			n0.classList.remove("active");
  			n1.classList.remove("active");
  			n2.classList.remove("active");
  			n3.classList.remove("active");
  			n4.classList.add("active");

  		}else if(link.equals("registration")){
  			n0.classList.remove("active");
  			n1.classList.add("active");
  			n2.classList.remove("active");
  			n3.classList.remove("active");
  			n4.classList.remove("active");

  		}else if(link.equals("student_schedule")){
  			n0.classList.remove("active");
  			n1.classList.remove("active");
  			n2.classList.add("active");
  			n3.classList.remove("active");
  			n4.classList.remove("active");
  		}
  			
  	}
  	function unselectOption(id, name) {
  	  var option = document.getElementByID(id);
  	  option.options[list.selectedIndex].selected=false;
	  for(var i=0; i<option.length; i++){
		  if(option.options[i].text.equals(name))
			  option.options[i].selected=true; return;}
	  option.options[0].selected=true;
  	}
  	
  	function onSubmitDeleteRows(id){
  		var table=document.getElementById(id);
  		for(var i=0; i<table.rows.length-1; i++) {
			var row = table.rows[i];
			//if(table.rows[i].id=="none") {break;}
				table.deleteRow(i);
		}

  	}
//  	function edit(){
//  		document.getElementName("fname").disabled=false;
//  		document.getElementName("mname").disabled=false;
//  		document.getElementName("lname").disabled=false;
//  		document.getElementName("major").disabled=false;
//  		document.getElementName("level").disabled=false;
//  		document.getElementName("byear").disabled=false;
//  		document.getElementName("edit").style.display = "none";
//  		document.getElementName("update").style.display = "block";
//
//  		return;
//  	}
//  	