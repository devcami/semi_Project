<%@page import="mypage.model.dto.ActorInfo"%>
<%@page import="member.model.dto.MemberRole"%>
<%@page import="member.model.dto.Member"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<ActorInfo> list = (List<ActorInfo>) request.getAttribute("list");
	String pagebar = (String) request.getAttribute("pagebar");

	String searchKeyword = request.getParameter("searchKeyword");
	
%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/ann.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/actor.css"/>

<section id="ann-list-container">
<div class="top-logo">
  <span>배우를 찾아라!</span>
</div>

	<div class="container">
		<div class="inner">
			
			
			<form action="<%= request.getContextPath() %>/mypage/actorInfo" id="annFinderFrm">
				<input type="text" name="actorInfo" id="searchTitle" placeholder=" 배우를 검색하세요."
						value="<%= (searchKeyword != null) ? searchKeyword : "" %>" />
				<button class="btn-search-title">검색</button>
			</form>
		<br>
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4" id="ann-container">
		<script> let a; </script>
		<% if(list != null && !list.isEmpty()){
			long miliseconds = System.currentTimeMillis();
			Date today = new Date(miliseconds); 
			for(int i = 0; i < list.size(); i++){ 
		%>
			 <div class="col">
			    <div class="card h-100 ann-card" onclick="actorView(this);">
					
					<div class="card-body <%= request.getContextPath() %>/actor/actorView">
						<h5 class="card-title"><%= list.get(i).getActorName() %></h5>
						<p class="card-text"><%= list.get(i).getMemberId() %></p>
						 <img class="actor_photo" src="<%= request.getContextPath() %>/upload/portfolio/<%= list.get(i).getAttachment().getRenamedFilename()%>">
						<input type="hidden" name="actorNo" class="actorNo" value="<%= list.get(i).getActorNo() %>"/> 
						
					</div>
					
				</div>
			  </div>
	<% 	} %>
	<% } else { %>
			<div><p>조회된 배우가 없습니다.</p></div>
	<% } %>
		</div>
	</div>
	<div id="pagebar">
		<%= request.getAttribute("pagebar") %>
	</div>
	
</section>
<script>
const actorView = (actor) => {
	   let actorNo;
	   actorNo = actor.firstElementChild.lastElementChild.value
		console.log(actorNo);
	   location.href=`<%= request.getContextPath() %>/actor/actorView?actor=\${actorNo}`;
	};

	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>