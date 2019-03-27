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
  	