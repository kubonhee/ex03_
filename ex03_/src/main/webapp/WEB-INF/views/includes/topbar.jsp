<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset=UTF-8">
<title>2021. 4. 27.오후 10:29:08</title>
</head>
<body>
<div class="col-sm-12 col-md-12" style="text-align: center;">
					<div id="dataTable_filter"
						class="dataTables_filter dataTables_length form-group">
						<form id="searchForm" action="board/list"">
							<a href="${pageContext.request.contextPath}/index">
                           		<img class="p-1 m-1" alt="loginImg" src="${pageContext.request.contextPath}/resources/img/mainlogo4.svg" style="width: 250px; height: 80px;">
                            </a>
							<label>
								<select id="searchMenu" name="type"
									class="custom-select d-none custom-select-sm form-control form-control-sm"
									style="width: 100px;">
										<option value="TCW">--</option>
										<option value="T">제목</option>
										<option value="C">내용</option>
										<option value="W">작성자</option>
										<option value="TC">제목 or 내용</option>
										<option value="TW">제목 or 작성자</option>
										<option value="WC">내용 or 작성자</option>
										<option value="TCW">제목 or 내용 or 작성자</option>
								</select> 
								<input type="search" name="keyword"class="form-control form-control-sm mr-1" aria-controls="dataTable" style="width: 600px; height: 50px; border: color: red;">
							</label> 
								<button class="btn btn-sm text-danger"><i class="fas fa-search"></i></button>
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> 
								<input type="hidden"
								name="amount" value="${pageMaker.cri.amount}">
						</form>
					</div>
				</div>
</body>
</html>