<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.getAttribute("cart");
session.removeAttribute("cart");
response.sendRedirect("ShopMallMain.jsp");
%>