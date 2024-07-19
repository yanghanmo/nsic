<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript" type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/report.js"></script>
<script src="/js/bg.js"></script>
<script src="/js/check.js"></script>
<script src="/js/Malgun.js"></script>
<script src="/js/malgun_bold.js"></script>
<style>
  .spot {
    color: #000;
    background: yellow;
    opacity: 0.5;
  }
  
  body {
    font-family: "맑은 고딕", san-serif;
  }
</style>
<script>
	$(document).click(function(e) {
	    if ($(e.target).closest('#bg').length) {
	    	
	    	var pSel = $('#pSel').val();

	    	$('#ex'+pSel).css('display', 'block');
	    	
	    	if(pSel == '1' ){
	    		$('#ex1').addClass("spot");
	    		$('#ex2').removeClass("spot");
	    	}else if(pSel == '2'){
	    		$('#ex2').addClass("spot");
	    		$('#ex1').removeClass("spot");
	    	}else{
	    		$('#ex1').removeClass("spot");
	    		$('#ex2').removeClass("spot");
	    	}
	    	
	    	//합성 좌표용
	    	let positionT = ((e.offsetY+10)*0.265).toFixed(2); 
	    	let positionL = (e.offsetX*0.265).toFixed(2);
	    	let positionT2 = ((e.offsetY)*0.265).toFixed(2); //이미지
	    	//alert(positionT+", " +positionL+"\n"+positionT2+","+positionL);
	    	
	    	//화면 좌표용
	    	let positionY = ((e.offsetY)*0.265).toFixed(2);
	    	let positionX = ((e.offsetX)*0.265).toFixed(2);
	    	
	    	$('#xpoint').val(positionL);
	    	
	    	if(pSel == '5'){
	    		$('#ypoint').val(positionT2);
	    	}else{
	    		$('#ypoint').val(positionT);
	    	}
	    	//var spanVal = "<span style='position:absolute;top:"+positionY+"mm;left:"+positionX+"mm;font-size:10px;'>테스트 값</span>";
	    	//$('#bg').append(spanVal);
	    	//$('#ex').css('display', 'block');

    		$('#ex'+pSel).css('top', positionY+'mm');
    		$('#ex'+pSel).css('left', positionX+'mm');

	    	if(pSel == '5'){
	    		$('#py'+pSel).val(positionY);
	    		$('#px'+pSel).val(positionX);
	    		$('#rpy'+pSel).val(positionT2);
	    		$('#rpx'+pSel).val(positionL);
	    	}else{
	    		$('#py'+pSel).val(positionY);
	    		$('#px'+pSel).val(positionX);
	    		$('#rpy'+pSel).val(positionT);
	    		$('#rpx'+pSel).val(positionL);
	    	}
	    	
	    	
	    }
	});
	
	
	
	
	$(document).ready(function() {	
		$('#pSel').val('1');
		$("#sel").on("change", function(){
		    //selected value
		    var ex = $("option:selected", this).attr("value");
		    
		    if(ex == 'ex1' ){
	    		$('#ex1').addClass("spot");
	    		$('#ex2').removeClass("spot");
	    	}else if(ex == 'ex2'){
	    		$('#ex2').addClass("spot");
	    		$('#ex1').removeClass("spot");
	    	}else{
	    		$('#ex1').removeClass("spot");
	    		$('#ex2').removeClass("spot");
	    	}
		    
		    if(ex == 'ex1'){
		    	$('#pSel').val('1');
		    	if($('#px1').val() != '0'){
		    		$('#ex1').css('display', 'block');	
		    	}
		    	
		    	$('#xpoint').val($('#px1').val());
		    	$('#ypoint').val($('#py1').val());
		    	
		    }else if(ex == 'ex2'){
			    	$('#pSel').val('2');
			    	if($('#px2').val() != '0'){
			    		$('#ex2').css('display', 'block');	
			    	}
			    	$('#xpoint').val($('#px2').val());
			    	$('#ypoint').val($('#py2').val());
			    	
		    }else if(ex == 'ex3'){
		    	$('#pSel').val('3');
		    	if($('#px3').val() != '0'){
		    		$('#ex3').css('display', 'block');	
		    	}
		    	$('#xpoint').val($('#px3').val());
		    	$('#ypoint').val($('#py3').val());
	    	}else if(ex == 'ex4'){
		    	$('#pSel').val('4');
		    	if($('#px4').val() != '0'){
		    		$('#ex4').css('display', 'block');	
		    	}
		    	$('#xpoint').val($('#px4').val());
		    	$('#ypoint').val($('#py4').val());
	    	}else if(ex == 'ex5'){
		    	$('#pSel').val('5');
		    	if($('#px5').val() != '0'){
		    		$('#ex5').css('display', 'block');	
		    	}
		    	$('#xpoint').val($('#px5').val());
		    	$('#ypoint').val($('#py5').val());
	    	}   
		});
		
		$('#leftp').click(function() {
			var pSel = $('#pSel').val();
			if($('#px'+pSel).val() == '0'){
				alert('좌표 지정을 먼저 해주십시요.');
				return false;
			}
			var chgVal = ($('#px'+pSel).val()-0.2).toFixed(2);
			
			$('#px'+pSel).val(chgVal);
			$('#xpoint').val(($('#xpoint').val()-0.2).toFixed(2));
			$('#rpx'+pSel).val(($('#rpx'+pSel).val()-0.2).toFixed(2));
			$('#ex'+pSel).css('left', chgVal+'mm');
			
		});
		
		$('#rightp').click(function() {
			var pSel = $('#pSel').val();
			if($('#px'+pSel).val() == '0'){
				alert('좌표 지정을 먼저 해주십시요.');
				return false;
			}
			var chgVal1 =parseFloat($('#px'+pSel).val())+0.20;
			var chgVal = chgVal1.toFixed(2);
			$('#px'+pSel).val(chgVal);
			$('#xpoint').val((parseFloat($('#xpoint').val())+0.2).toFixed(2));
			$('#rpx'+pSel).val((parseFloat($('#rpx'+pSel).val())+0.2).toFixed(2));
			$('#ex'+pSel).css('left', chgVal+'mm');
		});
		
		$('#topp').click(function() {
			var pSel = $('#pSel').val();
			if($('#py'+pSel).val() == '0'){
				alert('좌표 지정을 먼저 해주십시요.');
				return false;
			}
			var chgVal = ($('#py'+pSel).val()-0.2).toFixed(2);
			
			$('#py'+pSel).val(chgVal);
			$('#ypoint').val(($('#ypoint').val()-0.2).toFixed(2));
			$('#rpy'+pSel).val(($('#rpy'+pSel).val()-0.2).toFixed(2));
			$('#ex'+pSel).css('top', chgVal+'mm');
			
		});
		
		$('#bottomp').click(function() {
			var pSel = $('#pSel').val();
			if($('#py'+pSel).val() == '0'){
				alert('좌표 지정을 먼저 해주십시요.');
				return false;
			}
			var chgVal1 =parseFloat($('#py'+pSel).val())+0.20;
			var chgVal = chgVal1.toFixed(2);
			
			$('#py'+pSel).val(chgVal);
			$('#ypoint').val((parseFloat($('#ypoint').val())+0.2).toFixed(2));
			$('#rpy'+pSel).val((parseFloat($('#rpy'+pSel).val())+0.2).toFixed(2));
			$('#ex'+pSel).css('top', chgVal+'mm');
			
		});
	});

	function report(ch){
		var imgWidth = 210; //210 
	    var pageHeight = 297;  //295

	    var doc = new jsPDF({
        	orientation: 'p',
        	unit: 'mm',
        	format: 'a4'
      	});
	    doc.addFileToVFS('malgun.ttf', malgun);
	    doc.addFont('malgun.ttf', 'malgun', 'normal');
	    doc.addFileToVFS('malgun_bold.ttf', bold);
	    doc.addFont('malgun_bold.ttf', 'malgun_bold', 'normal');
	    
	    doc.setFont('malgun');
	    doc.setFontSize(9);
	    doc.setTextColor(40,40,40);
	    
	    var position = 0;

	    var width = doc.internal.pageSize.getWidth();
	    var height = doc.internal.pageSize.getHeight();    

	    //표지
	    doc.addImage(bg,'PNG', 0, 0, imgWidth, pageHeight, undefined, 'NORMAL');
	    //높이값은 +8 X 0.265
	    //체크 이미지의 경우 -8 X 0.265
	    if(parseFloat($('#rpy1').val()) > 0){
	    	doc.text('일반 텍스트 예시1', $('#rpx1').val(), $('#rpy1').val()); //LEFT, TOP
	    }
	    if(parseFloat($('#rpy2').val()) > 0){
	    	doc.text('일반 텍스트 예시2', $('#rpx2').val(), $('#rpy2').val());
	    }
	    
	    
	    doc.setFont('malgun_bold');
	    doc.setFontSize(14);
	    if(parseFloat($('#rpy3').val()) > 0){
	    	doc.setTextColor(215,55,15);
	    	doc.text('√', $('#rpx3').val(),  $('#rpy3').val());
	    	doc.setTextColor(40,40,40);
	    }
	    if(parseFloat($('#rpy4').val()) > 0){
	    	
	    	doc.text('√', $('#rpx4').val(),  $('#rpy4').val());
	    }
	    
	    //doc.text('구조 용도 내용 기입', 53.0, 59.4);
	    
	    //doc.addImage(check, 'PNG', 145.7, 204.3, 3, 3);
	    //doc.addImage(check, 'PNG', 50.0, 198.2, 3, 3);
	    const pngImg = new Image();
		pngImg.src ='/images/sign1.png';
		if(parseFloat($('#rpy5').val()) > 0){
			doc.addImage(pngImg, 'PNG', parseFloat($('#rpx5').val()), parseFloat($('#rpy5').val()), 21.2, 10.6);
		}
		
		if(ch == 'a'){
			doc.save('nsic.pdf');
		}else if(ch == 'b'){
			window.open(doc.output('bloburl'));
		}
	}

</script>
</head>
<body>
<div id="bg" style="border:1px solid black;width:210mm;height:297mm;padding:0px;margin:0px;">
	<img src="/images/bg.jpg" style="width:210mm;height:297mm;">
</div>

<div id="config" style="position:absolute;border:1px solid black;left:215mm;top:0px;width:350px;height:500px;padding:5px;">
<br/>* 항목: 
<select id="sel" style="width:290px;height:30px;">
	<option value="ex1">일반 텍스트 1</option>
	<option value="ex2">일반 텍스트 2</option>
	<option value="ex3">체크박스 예시1</option>
	<option value="ex4">체크박스 예시2</option>
	<option value="ex5">SIGN 예시</option>
</select>
<br/><br/>
* X좌표: <input type="text" id="xpoint" style="width:120px;height:30px;" readonly=readonly>
<br/><br/>
* Y좌표: <input type="text" id="ypoint" style="width:120px;height:30px;" readonly=readonly>

<br/><br/>
<div>* 상세 조절: 
	<button id="leftp" style="padding:3px;">←</button>
	<button id="rightp" style="padding:3px;">→</button>
	<button id="topp" style="padding:3px 7px;">↑</button>
	<button id="bottomp" style="padding:3px 7px;">↓</button>
</div>
<div>
<br/><br/>
&nbsp;&nbsp;<button style="height:30px;" onclick="report('a')">pdf 저장하기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button style="height:30px;color:green;" onclick="report('b')">pdf 미리보기</button>
</div>
</div>
<br/>

<span id="ex" style="position:absolute;display:none;font-size:12px;color:red">테스트 값</span>
<input type="hidden" id="py">
<input type="hidden" id="px">

<input type="hidden" id="pSel">

<span id="ex1" class="spot" style="position:absolute;display:none;font-size:12px;color:red;">테스트 1 값 예시</span>
<span id="ex2" style="position:absolute;display:none;font-size:12px;color:red;">테스트 2 값 예시</span>
<span id="ex3" style="border:solid 1px red;padding:0px 3px;position:absolute;display:none;font-size:12px;color:#fff;background:red;opacity: 0.5;font-weight:bold;">V</span>
<span id="ex4" style="border:solid 1px red;padding:0px 3px;position:absolute;display:none;font-size:12px;color:#fff;background:red;opacity: 0.5;font-weight:bold;">V</span>
<span id="ex5" style="position:absolute;display:none;border:1px solid black;padding:0px;"><img src="/images/sign2.png"></span>

<input type="hidden" id="py1" value='0'>
<input type="hidden" id="px1" value='0'>
<input type="hidden" id="py2" value='0'>
<input type="hidden" id="px2" value='0'>
<input type="hidden" id="py3" value='0'>
<input type="hidden" id="px3" value='0'>
<input type="hidden" id="py4" value='0'>
<input type="hidden" id="px4" value='0'>
<input type="hidden" id="py5" value='0'>
<input type="hidden" id="px5" value='0'>
<input type="hidden" id="rpy1" value='0'>
<input type="hidden" id="rpx1" value='0'>
<input type="hidden" id="rpy2" value='0'>
<input type="hidden" id="rpx2" value='0'>
<input type="hidden" id="rpy3" value='0'>
<input type="hidden" id="rpx3" value='0'>
<input type="hidden" id="rpy4" value='0'>
<input type="hidden" id="rpx4" value='0'>
<input type="hidden" id="rpy5" value='0'>
<input type="hidden" id="rpx5" value='0'>
</body>
</html>