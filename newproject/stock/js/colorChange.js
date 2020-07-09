window.onload=function calc()
{
	var n=document.getElementsByName('num');
	console.log(n);
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
			}
		}

	);

}