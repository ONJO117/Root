<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3>이미지 리스트</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<c:forEach items="${imageList }" var="vo">
				<div class="col-md-3">
					<div class="profile-card-2">
						<div class="imageDataRow" data-no="${vo.no }">
							<img src="${vo.fileName }" class="img img-responsive" alt="Photo Lists"
								style="width: 100%; height: 300px;">
								<div class="profile-name">${vo.title }</div>
							<div class="profile-username">${vo.name }(${vo.id })<fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
