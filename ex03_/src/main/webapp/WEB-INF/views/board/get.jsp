<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<jsp:include page="../includes/header.jsp" />

<!-- Begin Page Content -->
<div class="container-fluid w-75">

	<!-- Page Heading -->

	<!-- DataTales Example -->
	<div class="card shadow mb-2">
		<div class="card-header py-3">
			<h6 class="m-0 mt-2 font-weight-bold text-success float-left">자유거래
				게시판</h6>
			<a href="list${cri.listLink}" data-oper="list"
				class="btn btn-outline-info float-right"><i
				class="fas fa-align-justify"></i></a>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="pinfo" />
				<c:if test="${pinfo.username == board.writer}">
					<a href="modify${cri.listLink}&bno=${board.bno}" data-oper="modify"
						class="btn btn-outline-warning float-right mx-1"><i
						class="fas fa-cut"></i></a>
				</c:if>
			</sec:authorize>
		</div>
		<div class="card-body pt-0">
			<form method="post" class="needs-validation" novalidate>
				<!-- 1개의 input type="text" name="bno", value값 지정, readonly -->
				<div class="form-group d-none">
					<label for="bno" class="font-weight-bold text-warning">bno</label>
					<input type="text" class="form-control" id="bno" name="bno"
						required value="${board.bno}" readonly>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group mb-0">
					<label for="title" class="font-weight-bold text-warning"></label> <input
						type="text" class="form-control" id="title"
						placeholder="게시글 제목을 입력하세요." name="title" required
						value="${board.title}" readonly>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group mb-0">
					<label for="writer" class="font-weight-bold text-warning"></label>
					<input type="text" class="form-control" id="writer"
						placeholder="작성자를 입력하세요." name="writer" required
						value="${board.writer}" readonly>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group mb-0">
					<label for="title" class="font-weight-bold text-warning"></label>
					<textarea class="form-control" rows="10" id="content"
						placeholder="게시글 내용을 입력하세요." name="content" required readonly>${board.content}</textarea>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
			</form>
		</div>
	</div>


	<div class="card shadow mb-2">
		<div class="card-header py-2">
			<h6 class="m-0 font-weight-bold text-success float-left"
				style="font-size: 20px;">
				<i class="far fa-images"></i>
			</h6>
			<h6 class="m-2 font-weight-bold text-success float-left"
				style="font-size: 10px;">사진</h6>
		</div>
		<div class="card-body">
			<div class="uploadResult ">
				<ul class="list-group list-group-horizontal">
				</ul>
			</div>
		</div>
	</div>
	<div class="card shadow mb-2">
		<div class="card-header py-2">
			<h6 class="m-0 mt-2 font-weight-bold text-success float-left"
				style="font-size: 20px;">
				<i class="far fa-comment-dots"></i>
			</h6>
			<h6 class="m-2 mt-3 font-weight-bold text-success float-left"
				style="font-size: 10px;">댓글</h6>
			<sec:authorize access="isAuthenticated()">
				<button id="addReplyBtn" class="btn btn-outline-danger float-right">
					<i class="fas fa-pencil-alt"></i>
				</button>
			</sec:authorize>
		</div>
		<div class="card-body">
			<ul class="list-group chat">
				<!-- <li class="list-group-item">                       
		                        	<div class="header">
			                        	<strong>user00</strong>
			                        	<small class="float-right">2021-04-12 12:37</small>
		                        	</div>
		                       		<p class="mt-2">Good Job <br> Good Job Good Job <br> Good Job</p>
	                       		</li> -->
			</ul>
			<!-- <button id="btnShowMore" class="btn btn-primary btn-block my-4">더보기</button> -->
			<div class="reply-footer"></div>
		</div>
	</div>
</div>
<!-- Result Modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header p-2">
				<h6 class="m-0 mt-2 font-weight-bold text-success float-left" style="font-size: 20px;">
					<i class="far fa-comment-dots"></i>
				</h6>
			
				<h5 class="modal-title m-2 mt-3 font-weight-bold text-success float-left" id="myModalLabel" style=" font-size: 12px">댓글</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body mb-2">
				<form method="post" class="needs-validation" novalidate>
					<!-- 1개의 input type="text" name="bno", value값 지정, readonly -->
					<div class="form-group  mb-0">
						<label for="reply" class="font-weight-bold text-info">reply</label>
						<input type="text" class="form-control" id="reply" name="reply"
							required placeholder="댓글을 작성해주세요.">
						
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
						<p class="text-danger mb-0 mt-4"> <i class="fas fa-exclamation"></i> 비속어 사용 시 사용에 제한이될 수 있습니다. </p>
						
						<!-- <div class="modal-footer p-0">
							<button id="modalModBtn" class="btn btn-warning btn-sm ac"
								type="button" data-dismiss="modal">Modify</button>
							<button id="modalRemoveBtn" class="btn btn-danger btn-sm ac"
								type="button" data-dismiss="modal">Remove</button>
							<button id="modalRegBtn" class="btn btn-outline-danger btn-sm ac"
								type="button" data-dismiss="modal"><i class="fas fa-pencil-alt"></i></button>
							<button id="modalCloseBtn" class="btn btn-outline-secondary btn-sm"
								type="button" data-dismiss="modal"><i class="fas fa-times"></i></button>
						</div> -->
						
					</div>
					<div class="form-group d-none">
						<label for="replyer" class="font-weight-bold text-info">replyer</label>
						<input type="text" class="form-control" id="replyer"
							name="replyer" required placeholder="replyer">
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<label for="replyDate" class="font-weight-bold text-info">replyDate</label>
						<input type="text" class="form-control" id="replyDate"
							name="replyDate" required placeholder="2021-01-01 13:50">
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" class="btn btn-warning btn-sm ac"
					type="button" data-dismiss="modal">Modify</button>
				<button id="modalRemoveBtn" class="btn btn-danger btn-sm ac"
					type="button" data-dismiss="modal">Remove</button>
				<button id="modalRegBtn" class="btn btn-primary btn-sm ac"
					type="button" data-dismiss="modal">등록</button>
				<button id="modalCloseBtn" class="btn btn-secondary btn-sm"
					type="button" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- Result Modal-->
<div class="modal fade" id="imageModal">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-body text-center">
				<img class="mw-100">
			</div>
		</div>
	</div>
</div>
<script>
	// Disable form submissions if there are invalid fields
	(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    // Get the forms we want to add validation styles to
	    var forms = document.getElementsByClassName('needs-validation');
	    // Loop over them and prevent submission
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();
				</script>
<script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script>
                	var bno = <c:out value="${board.bno}" />;
                	var replyUL = $(".chat");
//                	var pageNum = 1;
                	
                	showList();
                	
                	function showList(rno) {
                		replyService.getList({bno:bno, rno:rno}, function(list) {
                			// 댓글 목록 출력
                    		console.log(list);
                    		
                    		// if(page == -1) showList(result.realEnd);
                    		if(!list.length) {
                    			$("#btnShowMore").prop("disabled", true).text("추가 댓글이 없습니다");
                    		}
                    		
                    		var str = "";
                    		for(var i in list) {
                    			str += '<li class="list-group-item" data-rno="' + list[i].rno + '">';                       
                    			str += '	<div class="header">';
                    			str += '    	<strong>' + list[i].replyer + '</strong>';
                    			str += '    	<small class="float-right">' + replyService.displayTime(list[i].replyDate) + '</small>';
                    			str += '	</div>';
                    			str += '	<p class="mt-2">' + list[i].reply + '</p>';
                    			str += '</li>';
                    		}
                    		replyUL.html(replyUL.html() + str);
                    		
                    		// 댓글 페이징
                    		/*
                    		str = '<ul class="pagination float-right mt-4">'; 
                    		if(result.prev) {
	               				str += '<li class="paginate_button page-item previous" > ';
	               				str += '	<a class="page-link" href="' + (result.startPage - 1) + '">Prev</a>';
	               				str += '</li>';
                    		}
                    		for(var i = result.startPage ; i <= result.endPage ; i++) {
                    			var active = result.cri.pageNum == i ? "active" : "";
                    			str += '<li class="paginate_button page-item ' + active + '">';
                    			str += '<a class="page-link" href="' + i + '">' + i + '</a>';
                    			str += '</li>';
                    		}
                    		if(result.next) {
                    			str += '<li class="paginate_button page-item next" > ';
                    			str += '<a class="page-link" href="' + (result.endPage + 1) + '">Next</a>';
                    			str += '</li>';
                    		}
                    		str += '</ul>';
                    		$(".reply-footer").html(str);
                    		*/
                    	})
                	}
                	var replyer = '';
            		<sec:authorize access="isAuthenticated()">
            		replyer = '<sec:authentication property="principal.username"/>';
					</sec:authorize>
					var csrf = '${_csrf.headerName}';
					var csrfToken = "${_csrf.token}";
					$(document).ajaxSend(function(e, xhr) {
						xhr.setRequestHeader(csrf, csrfToken);
					})
					
                	$(function() {
                		// 등록폼 버튼 이벤트
                		$("#addReplyBtn").click(function() {
                			$("#myModal").find("input").val("")
                			$("#replyer").val(replyer).prop("readonly", true);
                			$("#replyDate").closest("div").hide();
                			$(".ac").hide().eq(2).show();
                			$("#myModal").modal("show");
                		})
                		
                		// 댓글 목록 모달 팝업 이벤트
                		$(".chat").on("click", "li", function() {
                			var rno = $(this).data("rno");
                			console.log(rno);
                			replyService.get(rno, function(result) {
                        		console.log(result);
                        		$("#reply").val(result.reply);
                        		$("#replyer").val(result.replyer);
                        		$("#replyDate").val(replyService.displayTime(result.replyDate)).prop("readonly", true).closest("div").show();
                        		$("#myModal").data("rno", rno);
                        		
                        		$(".ac").show().eq(2).hide();
                        		if(!replyer) {
                        			$(".ac").hide();
                        		}
                        		$("#myModal").modal("show");
                        	});
                		})
                		
                		// 등록 적용버튼 이벤트
                		$("#modalRegBtn").click(function() {
                			var reply = {bno:bno, reply:$("#reply").val(), replyer:replyer};
                			console.log(reply);
                			replyService.add(reply, function(result) {
                        		alert(result); 
                        		$("#myModal").modal("hide");
                        		
                        		showList(-1);
                        	}); 
                		});
                		// 수정 적용버튼 이벤트
                		$("#modalModBtn").click(function() {
                			var reply = {rno: $("#myModal").data("rno"), reply:$("#reply").val(), replyer:replyer};
                			console.log(reply);
                			replyService.update(reply, function(result) {
                        		alert(result); 
                        		$("#myModal").modal("hide");
                        		
                        		showList(pageNum);
                        	}); 
                		});
                		// 삭제 적용버튼 이벤트
                		$("#modalRemoveBtn").click(function() {
                			replyService.remove({rno:$("#myModal").data("rno"), replyer:replyer}, function(result) {
                        		alert(result); 
                        		$("#myModal").modal("hide");
                        		
                        		showList(pageNum);
                        	}); 
                		});
                		
                		// 댓글 페이지 버튼 이벤트
                		$(".reply-footer").on("click", "a", function() {
                			event.preventDefault();
                			
                			pageNum = $(this).attr("href");
                			showList(pageNum);
                		});
                		
                		// btnShowMore 이벤트
                		$("#btnShowMore").click(function() {
                			// 마지막 rno 가져오기
                			var rno = $(".chat li:last").data("rno");
                			// showList() 호출
                			showList(rno);
                		});
                		//스크롤 바닥 감지
                    	window.onscroll = function(e) {
                			console.log(e);
                    	    //추가되는 임시 콘텐츠
                    	    //window height + window scrollY 값이 document height보다 클 경우,
                    	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                    	    	// 마지막 rno 가져오기
                    			var rno = $(".chat li:last").data("rno");
                    			// showList() 호출
                    			showList(rno);
                    	    }
                    	};
                    	$.getJSON("${pageContext.request.contextPath}/board/getAttachList", {bno:bno}, function(uploadResultArr) {
        					var str = "";
        					for(var i in uploadResultArr) {
        						var obj = uploadResultArr[i];
        						console.log(obj);
        						str += "<li class='list-group-item' "
        						str += " data-filename='" + obj.fileName 
        						str += "' data-image='" + obj.image 
        						str += "' data-uuid='" + obj.uuid 
        						str += "' data-uploadpath='" + obj.uploadPath 
        						str += "' >"
        						if(!obj.image) {
        							str += "<a href='${pageContext.request.contextPath}/download?fileName=" + obj.downPath + "'><i class='fas fa-paperclip text-muted'></i> " + obj.fileName + "</a>"; 
        						}
        						else {
        							str += "<a href='javascript:showImage(\"" + obj.downPath + "\")'>";
        							str += "<img src='${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
        						}
        						str += "</li>";
        					}
        					$(".uploadResult ul").html(str);
                    	})
                    	
                	})
                   	function showImage(path) {
						$("#imageModal img").attr("src", "/display?fileName="+path)
						$("#imageModal").modal("show");
					}
                	
                	
                	
                	
                	
                </script>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<jsp:include page="../includes/footer.jsp" />