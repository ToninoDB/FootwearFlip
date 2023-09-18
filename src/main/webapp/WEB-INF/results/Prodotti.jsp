<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/ParteHTML/navBar.jsp" %>
<%@ include file="/ParteHTML/Filter.html" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="/immagini/favicon.png\">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ParteCSS/CategorieProdotti.css">
    <%
        String x;
        ArrayList<Prodotto> prod = new ArrayList<Prodotto>();
        if (request.getParameter("action") != null) {
            prod = (ArrayList<Prodotto>) request.getAttribute(request.getParameter("action"));
            x = request.getParameter("action");
        } else {
            prod = (ArrayList<Prodotto>) request.getAttribute("filtra");
            x = (String) request.getAttribute("filtraggio");
        }
    %>
    <title><%=x%>
    </title>
</head>
<body>


<% for (Prodotto p : prod) {
    String directory = "immagini/" + p.getIdProdotto() + ".jpg";
%>

<div class="box-container">
    <div class="box">
        <div class="image">
            <a href="RicercaServlet?search=<%=p.getNomeProd()%>">
                <img src="<%=directory%>">
            </a>
        </div>
        <div class="info">
            <b style="text-align: center;">Modello:<%=p.getNomeProd()%>
            </b><br>
            <b style="text-align: center;color: red"><%=p.getPrezzo()%> €</b>
        </div>
    </div>
</div>
<%}%>
</body>
</html>