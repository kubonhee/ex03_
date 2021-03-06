<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../includes/header.jsp" />

                <!-- Begin Page Content -->
                <div class="container-fluid w-75">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-2">
                        <div class="card-header py-3">
                            <h6 class="m-0 mt-2 font-weight-bold text-success float-left">자유거래 게시판 - 글쓰기</h6>
                        </div>
                        <div class="card-body pt-0 pb-2">
                        <form method="post" class="needs-validation" novalidate>
	                        <div class="form-group mb-0">
					      		<label for="title" class="font-weight-bold text-warning"></label>
					      		<input type="text" class="form-control" id="title" placeholder="[판매/구매] 상품명 / 가격을 입력해주세요." name="title" required>
					      		<div class="valid-feedback">Valid.</div>
      							<div class="invalid-feedback">Please fill out this field.</div>
					   		</div>
	                        <div class="form-group mb-0 pb-2">
					      		<label for="title" class="font-weight-bold text-warning"></label>
					      		<textarea class="form-control" rows="10" id="content" placeholder="게시글 내용을 입력하세요." name="content" required></textarea>
					      		<div class="valid-feedback">Valid.</div>
      							<div class="invalid-feedback">Please fill out this field.</div>
					   		</div>
	                        <div class="form-group d-none">
					      		<label for="writer" class="font-weight-bold text-warning">writer</label>
					      		<input type="text" class="form-control" id="writer" placeholder="작성자를 입력하세요." name="writer" required readonly value='<sec:authentication property="principal.username"/>'>
					      		<div class="valid-feedback">Valid.</div>
      							<div class="invalid-feedback">Please fill out this field.</div>
					   		</div>
					   		<a href="list${cri.listLink}" data-oper="list" class="btn btn-outline-info float-right">
					   			<i class="fas fa-align-justify"></i>
					   		</a>
							<button type="reset" class="btn btn-outline-secondary float-right d-none" >reset</button>
					   		<button type="submit" class="btn btn-outline-danger float-right mx-1"><i class="fas fa-pencil-alt"></i></button>
					   		
					   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>
                        </div>
                    </div>
                    <div class="card shadow mb-2">
                        <div class="card-header py-2">
                            <h6 class="m-0 font-weight-bold text-success float-left" style="font-size: 20px;">
								<i class="far fa-images"></i>
							</h6>
							<h6 class="m-2 font-weight-bold text-success float-left" style="font-size: 10px;">사진</h6>
                        </div>
                        <div class="card-body">
                        	<div class="uploadDiv"> 
								<input id="files" type="file" name="files" multiple>
							</div>
							
							<div class="uploadResult ">
								<ul class="list-group list-group-horizontal">
								</ul>
							</div>
							<!-- Result Modal-->
						    <div class="modal fade" id="imageModal" >
						        <div class="modal-dialog modal-xl" >
						            <div class="modal-content">
						                <div class="modal-body text-center">
						                	<img class="mw-100">
						                </div>
						            </div>
						        </div>
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
				<script>
				var regex = /(.*?)\.(exe|sh|jsp|php|jar)/gi;
				var maxSize = 1024 * 1024 * 5; 
				var cloneObj = $(".uploadDiv").clone();
				var uploadResult = $(".uploadResult ul");
				var csrf = '${_csrf.headerName}';
				var csrfToken = "${_csrf.token}";
				
				console.log(cloneObj);
				$(".uploadDiv").on("change", "#files", function() {
					var formData = new FormData();
					var files = $("#files")[0].files;
					console.log(files);
					
					for(var i in files) {
						if(!checkExtension(files[i].name, files[i].size)) {
							$(".uploadDiv").html(cloneObj.html());
							return false;
						}
						formData.append("files", files[i]);
					}
					console.log(formData);
					$.ajax({
						url : '/uploadAction',
						type : 'post',
						data : formData,
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrf, csrfToken)
						},
						dataType : 'json',
						processData : false,
						contentType : false,
						success : function(result) {
							console.log(result);
							showUploadedFile(result);
							$(".uploadDiv").html(cloneObj.html());
						}
					});
				})
				function checkExtension(name, size) {
					if(size >= maxSize) {
						alert("파일 사이즈 초과");
						return false;
					}
					
					if(regex.test(name)) {
						alert("해당 종류의 파일은 업로드 할수 없습니다.");
						return false;
					}	
					return true;
				}
				function showUploadedFile(uploadResultArr) {
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
							str += "<a href='${pageContext.request.contextPath}/javascript:showImage(\"" + obj.downPath + "\")'>";
							str += "<img src='${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
						}
						str += "<i class='fas fa-times text-danger removeFileBtn'></i>"
						str += "</li>";
					}
					uploadResult.append(str);
				}
				function showImage(path) {
					$("#imageModal img").attr("src", "${pageContext.request.contextPath}/display?fileName="+path)
					$("#imageModal").modal("show");
				}
				$(".uploadResult").on("click", ".removeFileBtn", function() {
					var $li = $(this).closest("li");
					var data = {
						fileName : $li.data("filename"), 
						image: $li.data("image"),
						uuid : $li.data("uuid"),
						uploadPath : $li.data("uploadpath")
					}
					console.log(data);
					console.log(JSON.stringify(data));
					$.ajax({
						url : "/deleteFile",
						type : "post",
						data : JSON.stringify(data),
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrf, csrfToken)
						},
						contentType : "application/json; charset=utf-8",
						success : function(result) {
							alert(result);
							$li.remove();
						}
					});
				});
				
				$("button[type='submit']").click(function() {
					event.preventDefault();
					var str = "";
					var attrs = ["fileName", "uuid", "uploadPath", "image"];
					$(".uploadResult li").each(function(i, it) {
						for(var j in attrs) {
							var tmp = '<input type="hidden" name="attachList[' + i + '].';
							tmp += attrs[j] + '" value="' + $(it).data(attrs[j].toLowerCase()) +  '">';
							console.log(tmp);
							str += tmp;
						}
					});
					console.log(str);
					//$(this).closest("form").append(str);
					//console.log($(this).closest("form").serialize());
					$(this).closest("form").append(str).submit();
				})
			</script>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
<jsp:include page="../includes/footer.jsp" />