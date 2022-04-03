<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3>공지사항</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<table class="table">
				<tr>
					<th>제목</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>수정일</th>
				</tr>
				<c:forEach items="${noticeList }" var="vo">
					<tr class="noticeDataRow" data-no="${vo.no }" style="text-align: center">
						<td>${vo.title}</td>
						<td><fmt:formatDate value="${vo.startDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${vo.endDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${vo.updateDate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>