<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 QnA</title>

<link rel="stylesheet" href="css/sidebar.css">

<script>
	function popup() {
		var url = "myPageQnaBoardInsertForm.do?memail=${memail}";
		var name = "QNA";
		var option = "width = 1000, height = 800, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
	//qna 상세보기
	function qna(a,b,c) {
		location.href="mypageQnaBoardDetail.do?rnum="+a+"&qid="+b+"&cntPerPage="+c;
	}
	
	//답변글 상세보기
	function reply(a,b,c) {
		location.href="mypageQnaBoardReplyDetail.do?rnum="+a+"&qrid="+b+"&cntPerPage="+c;
	}
	
	function title(){
		var i = document.getElementById("title").value;
		document.write("RE:"+i)
	}
	
	function deleteCheck(abc) {
        if(window.confirm("삭제하시겠습니까?")){
        	location.href="mypageQnaBoardDelete.do?qid="+abc+"&nowPage=${pp.nowPage }&cntPerPage=${pp.cntPerPage }"
        	alert("삭제되었습니다!")		
        }
      }
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<!-- 세션이 없을때 마이페이지 -->
	<c:if test="${member == null }">
		<script>
			alert("로그인이 되어 있지 않습니다.");
			location.href = "NaverLogin.do";
		</script>
	</c:if>


	<c:if test="${member != null }">
		<ul>
			<li><a class="mypage_sidebar" href='#'>메뉴</a></li>
			<li><a href='mypage.do'>내 주문내역</a></li>
			<li><a href='cartFormMove.do'>장바구니</a></li>
			<li><a href='mypageQnA.do'>내가 쓴 QnA</a></li>
			<li><a href='mypageReview.do'>내가 쓴 Review</a></li>
			<li><a href='mypageAskBoard.do'>내가 물어본 상품문의</a></li>
			<li><a href='updateForm.do'>내 정보 수정</a></li>
			<li><a href='deleteForm.do'>회원 탈퇴</a></li>
		</ul>

		<c:if test="${not empty qlist}">
			<div class="content">
				<h1>내가 쓴 QnA</h1>
				<div class="container_orders">
					<table border="1" class="ordertable">
						<tr>
							<th>제목</th>
							<th>내용</th>
							<th>첨부파일</th>
							<th>작성일</th>
						</tr>
						<c:forEach items="${qlist }" varStatus="loop" var="QnaBoard">

							<!-- 문의글 출력 -->
							<c:if test="${QnaBoard.qrid ==0 }">
								<tr>
									<td onclick="javascript:qna(${QnaBoard.rnum },${QnaBoard.qid },${pp.cntPerPage })">${QnaBoard.qid } ${QnaBoard.qnatitle }</td>
									<td onclick="javascript:qna(${QnaBoard.rnum },${QnaBoard.qid },${pp.cntPerPage })">${QnaBoard.qnacontent }</td>
									<!-- 첨부파일 -->
									<c:if test="${QnaBoard.qnaorifile != null }">
										<td style="position: relative;"
										onclick="javascript:qna(${QnaBoard.rnum },${QnaBoard.qid },${pp.cntPerPage })">
										<img src="./images/${QnaBoard.qnaorifile }" width="50" height="50"
											class="toggle-image"> <span class="text-on-image">${o.PTEXT}</span>
										</td>
									</c:if>
									<c:if test="${QnaBoard.qnaorifile == null }">
										<td onclick="javascript:qna(${QnaBoard.rnum },${QnaBoard.qid },${pp.cntPerPage })">첨부파일이 없습니다.</td>
									</c:if>

									<td onclick="javascript:qna(${QnaBoard.rnum },${QnaBoard.qid },${pp.cntPerPage })"><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
											value="${QnaBoard.qnareg }"></fmt:formatDate></td>
									<td>
										<input type="button" value="삭제"
										onclick="location.href='javascript:deleteCheck(${QnaBoard.qid})'">
									</td>
								</tr>
							</c:if>

							<!-- 새로운부분. 댓글 출력. 댓글의 경우 상대가 지워도 이쪽에선 모름. 따라서 Y 조건이 반드시 필요 -->
							<c:if test="${QnaBoard.qrid !=0 && QnaBoard.qrdrop != 'Y'}">
								<tr
									onClick="javascript:reply(${QnaBoard.rnum },${QnaBoard.qrid },${pp.cntPerPage })">
									<td>ㅤㄴ답변 확인</td>
									<td>${QnaBoard.qrcontent }</td>
									<td>첨부파일이 없습니다.</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
											value="${QnaBoard.qrreg }"></fmt:formatDate></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<!-- container_review end -->
			</div>
		</c:if>

		<c:if test="${empty qlist}">
			<div class="content_noQnA">
				<h1>작성한 QnA글이 없습니다</h1>
			</div>
		</c:if>


		<!-- 다른 페이지로 넘어가기 위한 숫자들 자리 -->
		<div align="center">
			<c:if test="${pp.startPage != 1 }">
				<a style="text-decoration: none; color: deeppink"
					href="./mypageQnA.do?nowPage=${pp.startPage - 1 }&cntPerPage=${pp.cntPerPage}">
					<- </a>
			</c:if>
			<c:forEach begin="${pp.startPage }" end="${pp.endPage }" var="p">
				<c:choose>
					<c:when test="${p == pp.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != pp.nowPage }">
						<a style="text-decoration: none; color: deeppink"
							href="./mypageQnA.do?nowPage=${p }&cntPerPage=${pp.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${pp.endPage != pp.lastPage}">
				<a style="text-decoration: none; color: deeppink"
					href="./mypageQnA.do?nowPage=${pp.endPage+1 }&cntPerPage=${pp.cntPerPage}">
					-> </a>
			</c:if>
		</div>


		<!-- 글 입력 버튼 생성 -->
		<button type="button" class="putsub" onclick="javascript:popup()">문의작성</button>
	</c:if>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>