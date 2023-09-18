<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/ParteHTML/navBarAmministratore.jsp" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/immagini/favicon.png">
    <%
        ArrayList<Prodotto> tuttiProdotti = (ArrayList<Prodotto>) request.getAttribute("CategorieProdotti");
    %>
    <link rel="stylesheet" type="text/css" href="ParteCSS/CategorieProdotti.css">
    <title><%=request.getAttribute("Categoria")%></title>
</head>



<body>

<header>
    <img src="${pageContext.request.contextPath}/immagini/logo.jpg">
</header>


<% for (Prodotto prodotto : tuttiProdotti) {
    String directory = "immagini/" + prodotto.getIdProdotto() + ".jpg";
%>
<div class="box-container">
    <div class="box">
        <div class="image">
            <a href="CercaProdottoPerModificaServlet?search=<%=prodotto.getNomeProd()%>">
                <img src="<%=directory%>">
            </a>
        </div>
        <div class="info">
            <p><%=prodotto.getNomeProd()%>
            </p>
            <p>Prezzo:<%=prodotto.getPrezzo()%>
            </p>
            <% if (prodotto.getQuantita() != 0) {%>
            <p>In magazzino:<%=prodotto.getQuantita()%>
            </p>
            <%} else {%>
            <p style="color: red">Prodotto Esaurito</p>
            <%}%>
        </div>
    </div>
</div>
<%}%>
</body>
</html>
