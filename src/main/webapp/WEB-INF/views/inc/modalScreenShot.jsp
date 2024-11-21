<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
    
<!-- Portfolio Modals-->
	<!-- Portfolio item 1 modal popup-->
<c:forEach var="index" begin="1" end="6">
	<div class="portfolio-modal modal fade" id="portfolioModal${index }"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="${path}/resources/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">FARM FIND</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto" src="${path }/resources/images/screenshot/pic-${index }.png" alt="..." />
								<p>신수의 알</p>
								<ul class="list-inline">
									<li><strong>Client:</strong>연춘심 </li>
									<li><strong>Category:</strong> Illustration</li>
								</ul>
								<!-- <button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-xmark me-1"></i> Close Project
								</button> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>