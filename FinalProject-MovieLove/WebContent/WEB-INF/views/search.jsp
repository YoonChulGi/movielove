<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="spring.vo.bean.MovieVO" %>
<%@ page import="java.util.List" %>
<%
	List<MovieVO> movieList = (List<MovieVO>)request.getAttribute("movieList");
	System.out.println(movieList.get(0).getMOVIE_TITLE());

    //String searchValue = request.getParameter("searchValue");
    JSONArray arrayObj=new JSONArray();
    JSONObject jsonObj = null;
    
   //////////// 임의의 데이터(db라 가정하자) ////////////  
    ArrayList<MovieVO> dblist = movieList;
    ArrayList<MovieVO> resultlist = new ArrayList<MovieVO>();
	
   for(String str : dblist) {
        if(str.toLowerCase().startsWith(searchValue)) {
        	resultlist.add(str);
        }
    }
   ///////////resultlist를 db에서 조회후 뽑아온 list라고 가정한다.///////////
	
   //뽑은 후 json파싱
    for(String str : resultlist) {
       	jsonObj = new JSONObject();
       	jsonObj.put("data", str);
        arrayObj.add(jsonObj);
    }
    
	PrintWriter pw = response.getWriter();
	pw.print(arrayObj);
	pw.flush();
	pw.close();
%>