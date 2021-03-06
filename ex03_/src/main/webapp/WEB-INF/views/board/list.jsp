<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/topbar.jsp" />

	
                <!-- Begin Page Content -->
                <div class="container-fluid">

                   
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 mt-2 font-weight-bold text-success float-left">자유거래 게시판</h6>
                            <a href="${pageContext.request.contextPath}/board/register" class="btn btn-danger float-right"><i class="fas fa-pencil-alt"></i></a>
                        </div>
                        <div class="card-body">
		                    <div class="table-responsive">
		                    	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
		                    		<div class="row">
		                    			<div class="col-sm-12 col-md-6">
		                    				<div class="dataTables_length" id="dataTable_length">
		                    					<label> 
		                    						<select id="amountNumber" name="dataTable_length" class="custom-select custom-select-sm form-control form-control-sm">
		                    							<option value="10">10개</option>
		                    							<option value="25">25개</option>
		                    							<option value="50">50개</option>
		                    							<option value="100">100개</option>
		                    						</select>
		                    					</label>
		                    				</div>
		                    			</div>
		                    			<%-- <div class="col-sm-12 col-md-6">
		                    				<div id="dataTable_filter" class="dataTables_filter dataTables_length">
		                    					<form id="searchForm">
		                    					<label>Search : 
		                    						<select id="searchMenu" name="type" class="custom-select custom-select-sm form-control form-control-sm" style="width: 100px;">
		                    							<option value="">--</option>
		                    							<option value="T">제목</option>
		                    							<option value="C">내용</option>
		                    							<option value="W">작성자</option>
		                    							<option value="TC">제목 or 내용</option>
		                    							<option value="TW">제목 or 작성자</option>
		                    							<option value="WC">내용 or 작성자</option>
		                    							<option value="TCW">제목 or 내용 or 작성자</option>
		                    						</select> 
		                    						<input type="search" name="keyword" class="form-control form-control-sm mr-1"  aria-controls="dataTable">
		                    						<button class="btn btn-sm btn-facebook float-right">search</button>
		                    					</label>
		                    					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                        						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		                    					</form>
		                    				</div>
		                    			</div> --%>
		                    		</div>
		                            <div class="row">
		                                <table class="table table-striped" id="dataTable" width="100%" cellspacing="0">
		                                    <thead>
		                                        <tr style="border-top: solid 3px; border-bottom: solid 3px;">
		                                            <th style="text-align:center; width: 100px;">번호</th>
		                                            <th>제목</th>
		                                            <th style="text-align: center; width: 200px;"">작성자</th>
		                                            <th style="text-align: center; width: 200px;"">작성일</th>
		                                            <!-- <th>수정일</th> -->
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                    	<c:forEach items="${list}" var="board">
												<tr>
													<td style="text-align:center; width: 100px;">${board.bno}</td>
													<td><a href="get${pageMaker.cri.listLink}&bno=${board.bno}"><c:out value="${board.title}"/> <span class="text-muted small">[${board.replyCnt}]</span></a></td>
													<td style="text-align:center; width: 200px;"><c:out value="${board.writer}"/></td>
													<td style="text-align:center; width: 200px;"><fmt:formatDate value="${board.regdate}"/></td>
													<%-- <td><fmt:formatDate value="${board.updateDate}"/></td> --%>
												</tr>
												</c:forEach>                                    	
		                                    </tbody>
		                                </table>
		                            </div>
	                                <div class="row">
	                                	<div class="col-sm-12 col-md-5">
	                                		<%-- <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing ${list[0].bno} to ${list[pageMaker.cri.amount-1].bno} of ${pageMaker.total} entries </div> --%>
	                                		<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">${pageMaker.total}개의 게시글 </div>
	                                	</div>
	                                	<div class="col-sm-12 col-md-7">
	                                		<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
	                                			<ul class="pagination">
	                                				<c:if test="${pageMaker.prev}">
	                                				<li class="paginate_button page-item previous" id="dataTable_previous">
	                                					<a href="list${pageMaker.cri.listLink2}&pageNum=${pageMaker.startPage - 1}" aria-controls="dataTable" tabindex="0" class="page-link">Prev</a>
	                                				</li>
	                                				</c:if>
	                                				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
	                                				<li class="paginate_button page-item ${num == pageMaker.cri.pageNum ? 'pagination' : ''}">
	                                					<a href="list${pageMaker.cri.listLink2}&pageNum=${num}" aria-controls="dataTable" tabindex="0" class="page-link">${num}</a>
	                                				</li>
	                                				</c:forEach>
	                                				<c:if test="${pageMaker.next}">
	                                				<li class="paginate_button page-item next" id="dataTable_next">
	                                					<a href="list${pageMaker.cri.listLink2}&pageNum=${pageMaker.endPage + 1}" aria-controls="dataTable" tabindex="0" class="page-link">Next</a>
	                                				</li>
	                                				</c:if>
	                                			</ul>
	                                		</div>
	                                	</div>
	                                </div>
	                            </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- Result Modal-->
		    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		        aria-hidden="true">
		        <div class="modal-dialog" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="myModalLabel">Alert</h5>
		                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">×</span>
		                    </button>
		                </div>
		                <div class="modal-body">처리가 완료되었습니다.</div>
		                <div class="modal-footer">
		                    <button class="btn btn-danger" type="button" data-dismiss="modal">Close</button>
		                </div>
		            </div>
		        </div>
		    </div>
            <script>
            	$(function() {
            		var result = '${result}';
	            	
            		checkModal(result);
            		history.replaceState({}, null, null);
            		function checkModal(result) {
	            		if(result === '' || history.state) {
	            			return;
	            		}
	            		if(parseInt(result) > 0) {
	            			$(".modal-body").html("게시글 " + result + "번이 등록되었습니다");
	            		}
	            		$("#myModal").modal("show");
            		}
            		
            		$("#amountNumber").change(function() {
            			console.log(location);
            			location.href = "list${pageMaker.cri.listLink3}&amount=" + $(this).val();
            			
            		}).val('${pageMaker.cri.amount}');
            		
            		$("#searchMenu").val('${pageMaker.cri.type}')
            			.next().val('${pageMaker.cri.keyword}')
            	}); 
            	
            
            </script>
            <!-- End of Main Content -->
<jsp:include page="../includes/footer.jsp" />