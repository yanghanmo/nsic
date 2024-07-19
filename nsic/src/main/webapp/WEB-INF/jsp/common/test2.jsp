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
<script>
	function report(){
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
	    var position = 0;

	    var width = doc.internal.pageSize.getWidth();
	    var height = doc.internal.pageSize.getHeight();    

	    //표지
	    doc.addImage(bg,'PNG', 0, 0, imgWidth, pageHeight, undefined, 'FAST');
	    //높이값은 +8 X 0.265
	    //체크 이미지의 경우 -8 X 0.265
	    doc.text('면적 값 12345', 135, 66); //LEFT, TOP
	    doc.text('200,000,000', 138, 165.5);
	    doc.text('임차할 부분 값', 33, 66);
	    doc.text('500,000', 112.6, 139.9);
	    doc.text('테스트222', 136.35, 53.39);
	    doc.text('테스트333', 88.29, 30.07);
	    
	    doc.text('날인 이름', 40.2, 100.1);
	    doc.text('기타 명', 161.9, 205.9);
	    
	    //doc.text('차임', 161.12, 87.45);
	    doc.text('임차임 부담 내용', 41.61, 261.29);
	    doc.text('정액이 아닌경우', 70.23, 170.93);
	    //doc.text('구조용도', 53.80, 60.16);
	    doc.text('구조용도', 53.80, 59.89);
	    
	    doc.text('테스트', 135.04, 59.86);
	    doc.text('차임', 162.71, 87.56);
	    
	    doc.setFont('malgun_bold');
	    doc.setFontSize(14);
	    doc.text('√', 9.8, 97.2);
	    doc.text('√', 77.6, 108.7);
	    doc.text('√', 145.19, 207.27);
	    doc.text('√', 50.14, 207.32);

	    //doc.text('구조 용도 내용 기입', 53.0, 59.4);
	    
	    //doc.addImage(check, 'PNG', 145.7, 204.3, 3, 3);
	    //doc.addImage(check, 'PNG', 50.0, 198.2, 3, 3);
	    const pngImg = new Image();
		pngImg.src ='/images/sign1.png';
		doc.addImage(pngImg, 'PNG', 129.59, 95.14, 21.2, 10.6);
	    doc.save('nsic.pdf');
	}
</script>
</head>
<body>
<button onclick="report()">레포트 생성</button>
</body>
</html>