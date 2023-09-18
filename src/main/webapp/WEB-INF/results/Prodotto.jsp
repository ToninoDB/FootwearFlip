<%@ page import="Model.Prodotto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/immagini/favicon.png">
    <link rel="stylesheet" type="text/css" href="ParteCSS/paginaProdotto.css">
    <link rel="stylesheet" type="text/css" href="ParteCSS/styleSito.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <% Prodotto p = (Prodotto) request.getAttribute("prodotto");
        String directory = "immagini/" + p.getIdProdotto() + ".jpg";
    %>
    <title><%=p.getNomeProd()%></title>
    <style>
        .box-container .box .image img{
            width: 500px;height: 500px;
            border-style: solid;
            border-width: 2px;
            filter:drop-shadow(0 3px 5px rgba(0,0,0,.7));
        }

        .box-container{
            border: none;
            margin-top: 3%;
            margin-left: 40%;
            margin-right: 50%;
            float: left;
            border: 0;
        }
    </style>
</head>
<body>

<header>
    <img src="${pageContext.request.contextPath}/immagini/logo.jpg">
</header>

<div class="box-container" >
    <div class="box">
        <div class="image">
            <img src="<%=directory%>">
        </div>
        <div class="info">
            <p><%= p.getDescrizione() %>
            </p>
            <p>Quantità disponibile:<%=p.getQuantita()%>
            </p>

            <b><p>Le consegne sono previste per un limite dai 7 ai 30 giorni lavorativi</p></b>
        </div>
    </div>
    <table>
        <tr>
            <th>
                <h1>Modello:<%=p.getNomeProd()%>
                </h1>
                <h2><%=p.getPrezzo()%>€</h2>
            </th>
        </tr>
        <% if (p.getQuantita() == 0) {%>
        <th>
            <p style="color: red">Prodotto non disponibile</p>
        </th>
        <%} else {%>
        <th>
            <form action="CarrelloServlet">
                <label>Seleziona quantità:</label>
                <select name="quantita" id="quantita">
                <% for(int i=1;i<=p.getQuantita();i++)
                {
                    if(p.getQuantita()!=0)
                        {%>
                    <option value="<%=i%>"><%=i%></option>
                        <%}%>
                    <%}%>
                </select>
                <button class="cart" type="submit"><i class="fa fa-shopping-cart"></i></button>
            </form>
        </th>
        <%}%>
        <tr>
            <td>
                <button class="cart"><a style="text-decoration: none; color: white; text-underline: none" href="HomePage"><i class="fa fa-home"></i></a></button>
            </td>
        </tr>
    </table>
</div>
</body>
</html>