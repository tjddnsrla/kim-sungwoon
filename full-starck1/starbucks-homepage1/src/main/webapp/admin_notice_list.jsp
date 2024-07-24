<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "com.starbucks.utils.DBManager" %>
<%
	String searchKeyword = request.getParameter("search");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks 공지사항 어드민 페이지</title>
    <link rel="shortcut icon" href="./favicon.ico" />
    <link rel="icon" href="./favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
    <link re="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script> -->
    <script src="./js/jquery-3.7.1.js"></script>
    <!-- lodash -->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    
    <link href="./css/notice_admin.css" rel="stylesheet">
    <script defer src="./js/notice_admin.js"></script>
</head>
<body>
	<!-- 1. 공지사항 어드민 화면은 class="card"로 적용 -->
	<div class="card">
		<div class="card-header">
			<h1>스타벅스 공지사항 어드민</h1>	
		</div>
		
		<div class="card-body">
			<!-- 검색어 텍스트 박스 -->
			<input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요" />
			<a href="#" class="btn">검색</a>
		</div>
		
		<div class="notice-reg-area">
			<a href="/starbucks-homepage1/admin_notice_insert.jsp" class="btn">등록</a>
		</div>
		
		<div class="content-box">
			<div class="content-header">
				<div>번호</div>
				<div>제목</div>
				<div>작성자</div>
				<div></div>
			</div>
			<!-- 공지사항 어드민 게시글 제목 리스트 -->
			<%
			//DB접속 객체 가져오기
			Connection conn = DBManager.getDBConnection();

			//DB조회쿼리 실행하여 DB에 있는 데이터 값 가져오기
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//String selectSql = "SELECT * FROM board ORDER BY seq DESC";
				String selectSql;
				if (searchKeyword != null & searchKeyword != "") {
					selectSql = "SELECT * FROM board WHERE TITLE LIKE '%" 
						+ searchKeyword + "%' ORDER BY seq DESC";
				} else {
					selectSql = "SELECT * FROM board ORDER BY seq DESC";	
				}

				pstmt = conn.prepareStatement(selectSql);
				rs = pstmt.executeQuery(); // sql실행

				while (rs.next()) {
			%>
			<div class="content-items">
				<div><%= rs.getInt("SEQ") %></div>
                <div><%= rs.getString("TITLE") %></div>
                <div><%= rs.getString("WRITER") %></div>
                <div>
                	<button style="cursor: pointer;" onClick="">수정</button>
                	<button style="cursor: pointer;" onClick="">삭제</button>
               	</div>
			</div>
		<%
			}
		} catch (SQLException se) {
			System.out.println("게시판 조회 쿼리 실행 오류: " + se.getMessage());
		} finally {
			DBManager.dbClose(conn, pstmt, rs);
		}
		%>
		</div>
	</div>
</body>
</html>