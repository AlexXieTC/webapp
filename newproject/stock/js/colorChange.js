window.onload=function calc()
{
	var n=document.getElementsByName('num');
	var i=document.getElementsByName('inum');
	console.log("colorchange.js do");
	console.log(n);
	console.log(i);
	n.forEach(
		value=>{
			console.log(value.innerText);
			num=eval(value.innerText);
			if (num< 0)
			{
				value.className = "green";
			}else if(num==0){
				value.className = "white";
			}else{
				value.className = "red";
				value.innerText="+"+value.innerText;
			}
		}


	);
	i.forEach(
			value=>{
				console.log(value.innerText);
				inum=eval(value.innerText);
				if (inum< 0)
				{
					value.className = "igreen";
				}else if(inum==0){
					value.className = "white";
				}else{
					value.className = "ired";
					value.innerText="+"+value.innerText;
				}
			}

		);

}
