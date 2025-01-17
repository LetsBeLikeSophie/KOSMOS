<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.board.vo.KosmosBoardVO" %>
<%@ page import="java.util.List" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>게시판</title>
<link rel="stylesheet" href="default.css">
  <link rel="stylesheet" href="gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
<style type="text/css">
	.tt{
		text-align: center;
		font-weight: bold;
	}
</style> 
<link rel="stylesheet" href="/KOSMOS/common/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/KOSMOS/common/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){			
		/*
			CSS 선택자 우선순위 점수
			직접기입  : styl='' : 1000 점 
			id : #sbnum : 100점
			class : .sbnum : 10점
			속성 : [name="sbnum"] : 10점
		*/
		// sbnum
		$(document).on("click", "#bo_num", function(){
			//alert("chkInSbnum >>> : ");		
			if($(this).prop('checked')){			 
				//$('input[type="checkbox"][name="sbnum"]').prop('checked',false);
				$('.bo_num').prop('checked',false);
				$(this).prop('checked',true);
			}
		});
			
		// 검색버튼
		//  U
		$(document).on("click", "#searchBtn", function(){
			alert("searchBtn >>> : ");			
			$("#boardList").attr({ "method":"GET"
				                  ,"action":"boardSelectAll.k"}).submit();
		});
		// datepicker : from ~ to 기간조회
		$("#startdate").datepicker({		
			showOn: "button",    // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage: "/KOSMOS/img/cal_0.gif", 
			buttonImageOnly : true,            
			buttonText: "날짜선택",             
			dateFormat: "yy-mm-dd",             
			changeMonth: true,                  			
			onClose: function(selectedDate) {    
				$("#enddate").datepicker("option", "minDate", selectedDate);
			}                
		});		
		$("#enddate").datepicker({
			showOn: "button", 
			buttonImage: "/KOSMOS/img/cal_0.gif", 
			buttonImageOnly : true,
			buttonText: "날짜선택",
			dateFormat: "yy-mm-dd",
			changeMonth: true,			
			onClose: function(selectedDate) {	
				$("#startdate").datepicker("option", "maxDate", selectedDate);
			}               
		});			
		
		//  I
		$(document).on("click", "#I", function(){
			//alert("I >>> : ");
			location.href="boardForm.k";
		});
		//  U
		$(document).on("click", "#U", function(){
			// alert("U >>> : ");	
			if ($('.bo_num:checked').length == 0){
				alert("수정할 글번호 하나를 선택하세요!!");
				return;
			}
			var v1 = $("#ISUD_TYPE").val('U');
	         alert("v1 >>> : " + v1.val());
	         $("#boardList").attr({
	            "method":"POST",
	            "action":"boardSelect.k?ISUD_TYPE="+v1.val()
	         }).submit();
			
		});
		//  D
		$(document).on("click", "#D", function(){
			alert("게시글이 삭제되었습니다");	
			if ($('.bo_num:checked').length == 0){
				alert("삭제할 글번호 하나를 선택하세요!!");
				return;
			}
			$("#boardList").attr({ "method":"POST"
				                  ,"action":"boardDelete.k"}).submit();
		});
	//  댓글버튼 단건조회 S
		$(document).on("click", "#S", function(){
			alert("S >>> : ");	
			if ($('.bo_num:checked').length == 0){
				alert("댓글쓸 게시물 하나를 선택하세요!!");
				return;
			}
			var v1 = $("#ISUD_TYPE").val('S');
	         alert("v1 >>> : " + v1.val());
	         $("#boardList").attr({
	            "method":"POST",
	            "action":"boardSelect.k?ISUD_TYPE="+v1.val()
	         }).submit();
		});
	});

</script>
</head>
<style type="text/css">

	.content-top{
		height: 60px;
	}
	
	#s_left{
		border: 1px solid black;
		width:20%;
		height:700px;
		float:left;
	}
	
	#s_right{
		border: 1px solid black;
		width:20%;
		height:700px;
		float:left;
	}
	
	#contents{
		border: 1px solid black;
		width: 59.5%;
		float:left;
	}
	
	#footer{
		border-top:double;
		width:100%;
		height:70px;
		float:bottom;
	}
	
</style>
<body>
<div style="width:1400px; margin:0 auto;"></div>
<header>
  <h1><a href="">코스모스고등학교<span class="hide"></span></a></h1>
  <nav>
    <ul class="gnb">
      <li>
        <a href="kosmos_main_page.html">Home</a>
      </li>
      <li>
          <a href="#">Login</a>
      </li>
      <li>
        <a href="#">학교 소개</a>
        <ul>
          <li><a href="kosmos_words.html">학교장 인사</a></li>
          <li><a href="kosmos_history.html">학교 연혁</a></li>
          <li><a href="kosmos_info.html">학교 소개</a></li>
          <li><a href="kosmos_symbol.html">학교 상징</a></li>
          <li> <a href="kosmos_map.html">학교 위치</a></li>
        </ul>
      </li>
      <li>
        <a href="#">수강신청</a>
      </li>
      <li>
        <a href="#">수업정보</a>
        <ul>
          <li><a href="#">과목정보</a></li>
          <li><a href="#">시간표</a></li>
        </ul>
      </li>
      <li>
        <a href="#">공지사항</a>
      </li>
      <li>
      	<a href="#">코스모스숲</a>
      </li>
      <li>
      	<a href="#">마이페이지</a>
      </li>
    </ul>
  </nav>
</header>
<div class="bg_gnb"></div>
<div class="content-top">제일 위</div>
<div class="content" align="center">
	<div id="s_left">사이드바 왼쪽</div>
	<div id="contents">
	<% request.setCharacterEncoding("UTF-8");%> 
<%

	//페이징 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;	

	Object objPaging = request.getAttribute("pagingBVO");
	KosmosBoardVO pagingBVO = (KosmosBoardVO)objPaging;
	
	Object obj = request.getAttribute("listAll");
	List<KosmosBoardVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("nCnt >>> : " + nCnt);	
%>
<form name="boardList" id="boardList">
<table border="1" align="center">
<thead>
<tr>
	<td colspan="10" align="center">
		<h2>코스모스숲</h2>
	</td>
</tr>
<tr>
<td  colspan="10" align="left">
<select id="keyfilter" name="keyfilter" style="border:1px solid black;"> 
	<option value="key1">제목</option>
	<option value="key2">내용</option>
	<option value="key3">제목+내용</option>
	<option value="key4">작성자</option>
	<option value="key5">글번호</option>
</select>
<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" style="border:1px solid black;"><br>
<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일 "style="border:1px solid black;">
~ <input type="text" id="enddate" name="enddate" size="12" placeholder="종료일"style="border:1px solid black;">
<button type="button" id="searchBtn">검색</button>
</td>
</tr>
<tr>
	<td class="tt" style="width:100px;">체크</td>
	<td class="tt" style="width:100px;">글번호</td>
	<td class="tt">제목</td>
	<!--  
	<td class="tt">이름</td>		
	<td class="tt">내용</td>
	<td class="tt">최종작성일</td>
	<td class="tt">사진</td>
	-->
</tr>
</thead>
<%
for(int i=0; i<nCnt; i++){		
	KosmosBoardVO bvo = list.get(i);	
	pageSize = Integer.parseInt(pagingBVO.getPageSize());
	groupSize = Integer.parseInt(pagingBVO.getGroupSize());
	curPage = Integer.parseInt(pagingBVO.getCurPage());
	totalCount = Integer.parseInt(bvo.getTotalCount());
	
%>					
<tbody>
<tr>
	<td align="center">
		<input type="checkbox" name="bo_num" id="bo_num" class="bo_num" value=<%= bvo.getBo_num() %> >
	</td>		
	<td class="tt"><%= bvo.getBo_num() %> </td>
	<td class="tt"><%= bvo.getBo_subject() %> </td>
	<!-- 
	<td class="tt"><%= bvo.getMs_num() %> </td>
	<td class="tt"><%= bvo.getBo_contents() %> </td>
	<td class="tt"><%= bvo.getBo_upddate() %> </td>
	<td class="tt"><img src="/kosmos/fileupload/board/sm_<%= bvo.getBo_file() %>"> </td>	
	-->
</tr>	
<%
}//end of for
%>						
<tr>
	<td colspan="3" align="right">	
		<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE" value="">	
		<input type="button" value="글쓰기" id='I'>	
		<input type="button" value="글수정" id='U'>
		<input type="button" value="글삭제" id='D'>	
		<input type="button" value="댓글" id='S'>						
	</td>
</tr>	
<tr>
		<td colspan="7">
			<jsp:include page="BoardPaging.jsp" flush="true">
				<jsp:param value="boardSelectAll.k" name="url"/>
				<jsp:param value="" name="str"/>
				<jsp:param value="<%=pageSize %>" name="pageSize"/>
				<jsp:param value="<%=groupSize %>" name="groupSize"/>
				<jsp:param value="<%=curPage %>" name="curPage"/>
				<jsp:param value="<%=totalCount %>" name="totalCount"/>
			</jsp:include>
		</td>
	</tr>
</tbody>			
</table>
</form>	
	
	</div>
	<div id="s_right">사이드바 오른쪽</div>
<div id="footer" align="center">
	<div class="container">
		서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
		교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
		Copyright (c) 코스모스고등학교 All Rights Reseved
	</div>
</div>
</div>
</body>
</html>