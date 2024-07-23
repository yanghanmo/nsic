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
<!-- <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script> -->
<style>
  .spot {
    color: #000;
    background: yellow;
    opacity: 0.5;
  }
  
  input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

label {
    display: inline-block;
    color: #fff;
    background-color: royalblue;
    cursor: pointer;
    border-radius:3px;
    margin-left: 5px;
}

  body {
    font-family: "맑은 고딕", san-serif;
  }
  
  .draggable {
	  cursor: move;
	  position: absolute;
	  user-select: none;
  }
</style>
<script>
function draggable(elem) {
	var pos1 = 0, pos2 = 0; //이동한 xy좌표값
	var pos3 = 0, pos4 = 0; // xy좌표값
	var pos5 = 0, pos6 = 0; //db저장용
	if (document.getElementById(elem.id)) { //myDiv1Header 뜻함
		document.getElementById(elem.id).onmousedown = dragMouseDown;
	//onmouserdown할때 dragMouseDown함수를 등록하겠다
	}
	
	//클로저(중첩함수)
	function dragMouseDown(e) { //드래그하기위해 마우스 다운할때
		e = e || window.event; //브라우저따라 안먹을 수 있으니 두개 써주기
		
		//let positionT = ((e.offsetY+10)*0.265).toFixed(2); 
    	//let positionL = (e.offsetX*0.265).toFixed(2);
    	//let positionT2 = ((e.offsetY)*0.265).toFixed(2); //이미지
    	
    	
    	//화면 좌표용
    	//let positionY = ((e.offsetY)*0.265).toFixed(2);
    	//let positionX = ((e.offsetX)*0.265).toFixed(2);
    	
		//alert(e.button); //마우스 클릭 - 왼0 휠1 오2
		if(e.button==0){ //마우스 좌측 버튼 클릭시
		pos3 = e.clientX;
		pos4 = e.clientY;
		//pos3 = ((e.offsetX)*0.265).toFixed(2);
		//pos4 = ((e.offsetY)*0.265).toFixed(2);
		
		//드래그 드롭 작업을 위한 클릭한 위치좌표 얻어오기
		//console.log(pos3+" / "+pos4); //클릭한 위치값
		//console.log(elem.offsetLeft+" / "+elem.offsetTop);  //위치값
		//left="8px" -> 8 변환 필요
		//offset= 8 (숫자형으로 돌려주기 때문에 변환 필요 없음)
		
		document.onmousemove= elementDrag; //문서 전체에서 마우스 move, up 일어남
		document.onmouseup= closeDragElement;
		}
	}
	
	function elementDrag(e) {
		//console.log("document.onmousemove...elementDrag");
		e=e||window.event;
		
		pos1 = pos3 - e.clientX; //이동한 거리x 
		pos2 = pos4 - e.clientY;  //이동한 거리y
		//pos1 = pos3 - ((e.offsetX)*0.265).toFixed(2);
		//pos2 = pos4 - ((e.offsetY)*0.265).toFixed(2);
			
		//console.log(pos1+" / "+pos2);
		
		//pos3 = ((e.offsetX)*0.265).toFixed(2);
		//pos4 = ((e.offsetY)*0.265).toFixed(2);
		//elem.style.left =(elem.offsetLeft - pos1)+"mm"; //+"px" 주의
		//elem.style.top =(elem.offsetTop - pos2)+"mm"; //+"px" 주의
		//$('#ex5').css('top', pos4+'mm');
    	//$('#ex5').css('left', pos3+'mm');
    	$('#ex5').css('top', (elem.offsetTop-pos2)+'px');
    	$('#ex5').css('left', (elem.offsetLeft-pos1)+'px');
    	//$('#ex5').style.left =(elem.offsetLeft - pos1)+"mm"; //+"px" 주의
    	//$('#ex5').style.top =(elem.offsetTop - pos2)+"mm"; //+"px" 주의
		
		//원래 위치값도 옮겨줘야함 (3번쨰로 옮기면 2번째로 옮겨진 그 위치가 원래 위치값이 되니까 )
		pos3 = e.clientX;
		pos4 = e.clientY;
		
		/*
		$('#xpoint').val(pos3);
    	$('#ypoint').val(pos4);
    	$('#py5').val(pos4);
		$('#px5').val(pos3);
		$('#rpy5').val(pos4);
		$('#rpx5').val(pos3);*/
	}
	
	function closeDragElement(e) {
		//console.log("document.onmouseup...closeDragElement");
		
		document.onmousemove=null;
		document.onmouseup= null;
		
		pos5 = ((elem.offsetLeft)*0.265).toFixed(2);
		pos6 = ((elem.offsetTop)*0.265).toFixed(2);
		
		//$('#ex5').css('top', pos4+'mm');
    	//$('#ex5').css('left', pos3+'mm');
		
		//원래 위치값도 옮겨줘야함 (3번쨰로 옮기면 2번째로 옮겨진 그 위치가 원래 위치값이 되니까 )
		//pos3 = e.clientX;
		//pos4 = e.clientY;
		
		
		$('#xpoint').val(pos5);
    	$('#ypoint').val(pos6);
    	$('#py5').val(pos6);
		$('#px5').val(pos5);
		$('#rpy5').val(pos6);
		$('#rpx5').val(pos5);
	}
}
draggable(document.getElementById("ex5"));
/* document.addEventListener('DOMContentLoaded', function () {
	  // 마우스의 위치값 저장
	  let x = 0;
	  let y = 0;
	  
	  // 대상 Element 가져옴
	  const ele = document.getElementById('ex5');
		
	  // 마우스 누른 순간 이벤트
	  const mouseDownHandler = function (e) {
	    // 누른 마우스 위치값을 가져와 저장
	    x = e.clientX;
	    y = e.clientY;
	    
	    // 마우스 이동 및 해제 이벤트를 등록
	    document.addEventListener('mousemove', mouseMoveHandler);
	    document.addEventListener('mouseup', mouseUpHandler);
	  };

	  const mouseMoveHandler = function (e) {
	    // 마우스 이동시 초기 위치와의 거리차 계산
	    const dx = e.clientX - x;
	    const dy = e.clientY - y;

	    // 마우스 이동 거리 만큼 Element의 top, left 위치값에 반영
	    ele.style.top = `${ele.offsetTop + dy}px`;
	    ele.style.left = `${ele.offsetLeft + dx}px`;

	    // 기준 위치 값을 현재 마우스 위치로 update
	    x = e.clientX;
	    y = e.clientY;
	  };

	  const mouseUpHandler = function () {
	    // 마우스가 해제되면 이벤트도 같이 해제
	    document.removeEventListener('mousemove', mouseMoveHandler);
	    document.removeEventListener('mouseup', mouseUpHandler);
	  };

	  ele.addEventListener('mousedown', mouseDownHandler);
	}); */
	
	 /* $( function() {
		    $( "#ex5" ).draggable();
		  } ); */
	
	
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
		 $("#file1").on("change", handleImgFileSelect);
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
	    //const pngImg1 = new Image();
		//pngImg1.src ='/images/ex2.png';
		//doc.addImage(pngImg1, 'PNG', 0, 0, imgWidth, pageHeight, undefined, 'NORMAL');

	    
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
		//pngImg.src ='/images/sign1.png';
		pngImg.src ='/nsicBg/sign_ex.png';
		//var si = "iVBORw0KGgoAAAANSUhEUgAAAGQAAAAyCAYAAACqNX6+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6M0Q1MkQ3N0UzRjRGMTFFRjg2QzY4MzA4OEZGQ0EwQjMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6M0Q1MkQ3N0YzRjRGMTFFRjg2QzY4MzA4OEZGQ0EwQjMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozRDUyRDc3QzNGNEYxMUVGODZDNjgzMDg4RkZDQTBCMyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDozRDUyRDc3RDNGNEYxMUVGODZDNjgzMDg4RkZDQTBCMyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PlJEhYsAAAT3SURBVHja7FuLcaMwECWJGyAlKCXgEkgJuARfCbgEXIIpAZcAJeASoATTQGY4aW512eytPnzisS/amZ3YGCRLu+/tR87TOI5RkPuR57AFwSBBgkGCQYIEgwSDBAkG+f9ls3iAzewhWqlnqcefbICPj4+bIiQHvUpVFWiFPksCHv6Vp6WVOkGI2uRUauF4bJB6kFr+dANghMi93K+FkFjqCWhIvd4pY1v0NRiDd9TNCoPkCBE7iAtB/jjmHlgjYz4/I9Ui1kDIHv5egjH+SgrxUjlqD6zwTu5RRqokTbVSY6nKcMsoSw6iJhQrJgAjaPrAxlAbXcMaeoiVShr0msbdK9B9+bzAGDFCh0bIGrSn4f6ogtdB46RK8bcGw5QywB9nZ1kqI4BArmW7wCg1QoXyqrcHNkiLUvo3WM9N6pCYoOOy0liHB48dCaKo/iatE4kOATSzBl0JtIjyzhID9b26GQlONDetf17gCfFKBqHF4j2lrfWEteH09jzXseYaBOfV/UKvHmCMd3h9L9Sji9xyBjpm78fkwhCyq4RkDsNCg9xbENfp/Bliga8R8ZqiWyFkb6GrOPpsJD5q87BG392XrgSpx2ZT+OS0VyKkI5O/gkfopmKCqGx7RzRk28wM1UOxA82vzPUT6VhsfSdflPZCdkU9YYCFaM/aQXAWlmCZQ/aiK/PKI1gWcG+7oANwRd8rhrE0PdFzmQus4zX62hTlxjfFD12rjbBeN2sohPjqy8tLJnVEWknN4fVeagSaSu3QeyH1hJ5LyPsRxomY61QLNK7WGK7jcSJ0jZuHak7uywz3Ua3RMzW6foJ14j3r6PN0j6fGkIx5n0BQLpHnFYAUfF8WfbblLxZq+BV9bdXvLMFTc/4V1UWYfobI/0QyJ+99M6WEZJyaLQ6wTmGgx2UIYTyI86IEvCR3eBVF2hWe9bl3BETk8JwJSTnjwfrZiPne+J7WEx17Zt4TYYaRIETYELKZyMW2lkeOUOBqGVAv31qe4Tz1irxfEA4/ogIzJXOZah3K7Y1nMkBPRul5UE4SAvfeeKIjtXhi4ulNWK8enI7jw8h4sPb01jJWbfBcqtWM+FF5xKbOEF8Wx5DC0d2ccn5B2y4uNNW0TY08PSY1w5GgN/X0elrUnT3iRuZAVRrNOCtyGoSpzHuA3kDycDGD+lxtFzq3TkUHhmrmntHnjm6zTltTco1r/9govlnFIIz3N7KYOUM2hPm0itwHS5TTdxP6Q0em0BSWWEMdpLfEAmzU0rB+YYk5Z/K9Mmbf/BxmYt2hNEWfF64sgsSCzpCT62xFWDiYG7e18PPeI2uKHfEwY2KWYDJE4ci+ClMs8o4hQFUUmgeJjgaV/QcGKblhyBPj0frHACegit7CwQODnmRCfaCzosrStR4Y9FxIdiYYKuot2ecA6KicNYiDsgQNvurMl7mvJLybTuDuGuZ5QgG5As6u0YK4dDV20EFDNr5jaDI2NAh1e6eAsQeDoU1nOD2Zo/M+prDQVUtTQcN9Gvq0hWCjGA31nCnUCtKayTwKRlPqXaC5UubzdGKbJvFsw9AWUO5LWWv/lLRAlNWAlt/Y8dXF6JLDrQRQKUjm1zCZUQz3poCMxT8Up93etQ1CW9GYPt6jIE6DbL5hjgMKuqbzgyBrHVAF+V4J/0EVDBIkGCQYJEgwSDBIkGCQYJAgwSA/XH4LMACtcr8gmVYoAgAAAABJRU5ErkJggg==";
		if(parseFloat($('#rpy5').val()) > 0){
			doc.addImage(pngImg, 'PNG', parseFloat($('#rpx5').val()), parseFloat($('#rpy5').val()), 21.2, 10.6);
		}
		
		if(ch == 'a'){
			doc.save('nsic.pdf');
		}else if(ch == 'b'){
			window.open(doc.output('bloburl'));
		}
	}

function fn_fileUpload(){
		
		if($('.upload-name').val() == ''){
			Toast.fire({
   			    icon: 'warning',
   			    title: '파일을 첨부해주세요.'
   			})
   			return false;
		} 
		
		loading.show();

        var form = new FormData();

        form.append( "file1", $("#file1")[0].files[0] );

        $.ajax({
             url : "/fileUpload.do"
           , type : "POST"
           , processData : false
           , contentType : false
           , dataType:'json'
           , data : form
           , success:function(data) {
        	   $("#imgbg").attr("src", "C:/contents/"+data.result);
           }
           ,error: function () 
           { 
        	  alert('첨부 실패');
           }
       });
	}


function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var reg = /(.*?)\/(exe|psd|pdf)$/; //exe파일 등 제한 확정자 등록
    
    var file = document.getElementById("file1");
    var filePath = file.value;
	//전체경로를 \ 나눔.
	var filePathSplit = filePath.split('\\'); 
	//전체경로를 \로 나눈 길이.
	var filePathLength = filePathSplit.length;
	//마지막 경로를 .으로 나눔.
	var fileNameSplit = filePathSplit[filePathLength-1].split('.');
	//파일명 : .으로 나눈 앞부분
	var fileName = fileNameSplit[0];
	//파일 확장자 : .으로 나눈 뒷부분
	var fileExt = fileNameSplit[1];
	//파일 크기
	var fileSize = file.files[0].size;
	fileSize = (fileSize/1024/1024).toFixed(1);

    filesArr.forEach(function(f) {
         if (f.type.match(reg)) {
        	 
  			  alert('등록이 불가능한 확장자입니다.');
  			
            return false;
        }else{
        	$(".upload-name").val(fileName+"."+fileExt+"["+fileSize+" MB]");
        } 
    	
    });
}


</script>
</head>
<body>
<div id="bg" style="border:1px solid black;width:210mm;height:297mm;padding:0px;margin:0px;">
	<!-- <img src="/images/ex2.png" style="width:210mm;height:297mm;"> -->
	<img id="imgbg" src="/images/bg.jpg" style="width:210mm;height:297mm;">
	<!-- <img id="imgbg" src="C:/temp/test.png" style="width:210mm;height:297mm;"> -->
</div>

<div id="config" style="position:absolute;border:1px solid black;left:215mm;top:0px;width:350px;height:500px;padding:5px;">
<br/>* 항목: 
<select id="sel" style="width:290px;height:30px;">
	<option value="ex1">일반 텍스트 1</option>
	<option value="ex2">일반 텍스트 2</option>
	<option value="ex3">체크박스 예시1(빨강옵션)</option>
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
<br/><br/>
<!--  <input class="upload-name" value="" placeholder="" readonly="readonly">
						    <label for="file1" id="findFile">파일 찾기</label> 
						    <input type="file" id="file1" accept="image/*, .pdf">
						<button onclick="fn_fileUpload()" class='custom-btn btn-15' id='attach'>
							파일 등록
						</button> -->
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
<!-- <div id="ex5" class="draggable" style="position:absolute;display:none;border:1px solid black;padding:0px;"><img src="/images/sign2.png"></div> -->
<div id="ex5" class="draggable" style="position:absolute;display:none;border:1px solid black;padding:0px;font-size:1.5em;">Sign예시</div>

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