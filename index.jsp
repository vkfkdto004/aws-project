<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shink-to-fit=no">
	<title>강의평가 웹 사이트</title>
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapas" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapase navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						회원 관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
					</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-conrtrol mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="부트캠프">부트캠프</option>
				<option value="공인교육">공인교육</option>
				<option value="기타">기타</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
		</form>
		<div class="card bg-light mt-3">>
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">퍼블릭클라우드아키텍쳐&nbsp;<small>김영철</small></div>
					<div class="col-4 text-right">
						종합<span style="color: red;">A</span>
				</div>
			</div>
		</div>
		<div class="card-body">
			<h5 class="card-title">
				정말 좋은 강의에요.&nbsp;<small>(2023년 3차수)</small>
			</h5>
			<p class="card-text">강의가 지루하지 않고 많은 것을 배울 수 있었습니다.</p>
			<div class="row">
				<div class="col-9 test-left">
					수업내용 <span style="color: red;">A</span>
					수업시간 <span style="color: red;">A</span>
					종합 <span style="color: red;">A</span>
					<span style="color: green;">(추천: 19)</span>
				</div>
				<div class="col-3 text-right">
					<a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
					<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
				</div>
			</div>
		</div>
	</div>
	
	</section>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-diaLog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>강의명</label>
								<input type="text" name="lectureName" class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>강사명</label>
								<input type="text" name="professorName" class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-row">
								<div class="form-group col-sm-4">
									<label>수강 연도</label>
									<select name="lectureYear" class="form-control">
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>
										<option value="2023" selected>2023</option>
									</select>
								</div>
								<div class="form-group col-sm-4">
									<label>수강 차수</label>
									<select name="semesterDivide" class="form-control">
										<option value="1차수">1차수</option>
										<option value="2차수">2차수</option>
										<option value="3차수" selected>3차수</option>
										<option value="4차수">4차수</option>
										<option value="5차수">5차수</option>
										<option value="6차수">6차수</option>
									</select>
								</div>
							</div>
								<div class="form-group col-sm-4">
									<label>강의 구분</label>
									<select name="lectureDivide" class="form-control">
										<option value="부트캠프" selected>부트캠프</option>
										<option value="공인교육">공인교육</option>
										<option value="기타">기타</option>
									</select>
							   </div>
							   <div class="form-group">
							   		<label>제목</label>
							   	<input type="text" name="evaluationTime" class="form-control" maxlength="30">
							   </div>
							   <div class="form-group">
							   		<label>내용</label>
							    	<textarea name="evaluationContent" class="form-contril" maxlength="2048" style="height: 180px;"></textarea>
							   </div>
							   <div class="form-row">
							   		<div class="form-group col-sm-3">
							   			<label>수업내용</label>
							   			<select name="lectureScore" class="form-control">
							   				<option value="A" selected>A</option>
							   				<option value="B" >B</option>
							   				<option value="C" >C</option>
							   				<option value="D" >D</option>
							   				<option value="F" >F</option>
							   			</select>
							   		</div>				   	
							   		<div class="form-group col-sm-3">
							   			<label>수업시간</label>
							   			<select name="lectureBreaktime" class="form-control">
							   				<option value="A" selected>A</option>
							   				<option value="B" >B</option>
							   				<option value="C" >C</option>
							   				<option value="D" >D</option>
							   				<option value="F" >F</option>
							   			</select>
							   		</div>
							   		<div class="form-group col-sm-3">
							   			<label>종합</label>
							   			<select name="totalScore" class="form-control">
							   				<option value="A" selected>A</option>
							   				<option value="B" >B</option>
							   				<option value="C" >C</option>
							   				<option value="D" >D</option>
							   				<option value="F" >F</option>
							   			</select>
							   		</div>
							   </div>
							   <div class="modal-footer">
							   		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							   		<button type="submit" class="btn btn-primary">등록하기</button>
							   </div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-diaLog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
							   <div class="form-group">
							   		<label>신고 제목</label>
							   	<input type="text" name="reportTitle" class="form-control" maxlength="30">
							   </div>
							   <div class="form-group">
							   		<label>신고 내용</label>
							    	<textarea name="reportContent" class="form-contril" maxlength="2048" style="height: 180px;"></textarea>
							   </div>
							   <div class="modal-footer">
							   		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							   		<button type="submit" class="btn btn-danger">신고하기</button>
							  </div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2023 AWS Project 4조 All Rights Reserved.
	</footer>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/pooper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>