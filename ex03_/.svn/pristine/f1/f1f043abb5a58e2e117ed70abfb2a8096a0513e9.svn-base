<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/topbar.jsp" />
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>


<%-- <jsp:include page="includes/sideBar.jsp" /> --%>
<!-- Page Content -->
<!--
  <div class="container">
    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4"><img src="resources/img/logo.jpg" alt="로고 이미지" style="width: 150px; margin-left: 50px"></h1>
        
      <div id="box">
            <li class="main1 list-group-item">
      			Category
                <ul class="sub1" style="list-style: none; display: none;">
                    <a href="#">텐트</a><br>
                    <a href="#">그늘막</a><br>
                    <a href="#">타프</a><br>
                    <a href="#">침낭</a><br>
                    <a href="#">캠핑테이블</a><br>
                    <a href="#">캠핑의자</a><br>
                    <a href="#">그릴/화로</a><br>
                    <a href="#">난방/보온</a><br>
                    <a href="#">코펠/식기도구</a><br>
                    <a href="#">랜턴/램프</a><br>
                    <a href="#">온/냉장</a><br>
                    <a href="#">캠핑공구</a><br>
                    <a href="#">기타</a><br>
                </ul>
            </li>
            <li class="main2 list-group-item">
      			Brand
                <ul class="sub2" style="display:none">
                    <a href="#">코베아</a><br>
                    <a href="#">버팔로</a><br>
                    <a href="#">BUCK703</a><br>
                    <a href="#">로티캠프</a><br>
                    <a href="#">캠프365</a><br>
                    <button> 브랜드 더보기 </button>
                </ul>
            </li>
            <li class="main3 list-group-item">
      			Ornament
                <ul class="sub3" style="display:none">
                     <a href="#">LED/전구</a><br>
                     <a href="#">텐트 장식</a><br>
                     <a href="#">편의 용품</a><br>
                     <a href="#">?</a><br>
                     <a href="#">?</a><br>
                </ul>
            </li>
            
        </div>
        <script>
            $(".main1").click(function(){
                if($(".sub1").is(":visible")){
                    $(".sub1").slideUp();
                }
                else{
                    $(".sub1").slideDown();
                }
            })
            $(".main2").click(function(){
                if($(".sub2").is(":visible")){
                    $(".sub2").slideUp();
                }
                else{
                    $(".sub2").slideDown();
                }
            })
            $(".main3").click(function(){
                if($(".sub3").is(":visible")){
                    $(".sub3").slideUp();
                }
                else{
                    $(".sub3").slideDown();
                }
            })
        </script>

      </div> -->
<!-- /.col-lg-3 -->

<div class="col-lg-12">

	<div id="carouselExampleIndicators" class="carousel slide my-4"
		data-ride="carousel" style="width: 1175px">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!--  <div class="carousel-item active" style="width:690px; height:268px; background: url(resources/img/main1.jpg) no-repeat bottom; background-size: cover;"> -->
			<div class="carousel-item active">
				<img class="d-block" src="${pageContext.request.contextPath}/resources/img/mainlogo1.jpg"
					alt="main img1" style="width: 1200px; height: 350px;">
			</div>
			<!-- <div class="carousel-item" style="width:690px; height:268px; background: url(resources/img/main1.jpg) no-repeat bottom; background-size: cover;"> -->
			<div class="carousel-item">
				<img class="d-block" src="${pageContext.request.contextPath}/resources/img/mainlogo2.jpg" alt="main img2"
					style="width: 1200px; height: 350px;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="${pageContext.request.contextPath}/resources/img/mainlogo3.jpg" alt="main img3"
					style="width: 1200px; height: 350px;">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<h2>오늘의 상품</h2>
	<div class="row">
		<c:forEach items="${list}" var="board">
			<div class="col-lg-3 col-md-3 mb-2">
				<div class="card h-100">
					<a href="board/get${pageMaker.cri.listLink}&bno=${board.bno}">
						<span style="display:block; height:360px; background: center url('${empty board.attachList ? '${pageContext.request.contextPath}/resources/img/missing.png' : '/display?fileName=' += board.attachList[0].downPath}') no-repeat ; background-size: cover;"></span></a>
					<div class="card-body">
						<h4 class="card-title"></h4>
						<a href="get${pageMaker.cri.listLink}&bno=${board.bno}"><c:out
									value="${board.title}" /> <span class="text-muted small">[${board.replyCnt}]</span></a>

					</div>
					<div class="card-footer">
						<small class="text-muted" style="list-style: none;">
							<c:out value="${board.writer}" />
							<fmt:formatDate value="${board.regdate}" />
						</small>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- /.row -->


	<!-- 갤러리형 게시판 끝 -->
</div>
<!-- /.col-lg-9 -->


<!-- /.row -->


<!-- /.container -->




<jsp:include page="includes/footer.jsp" />