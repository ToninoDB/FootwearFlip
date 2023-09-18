<%@ page import="Model.Prodotto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="immagini/favicon.png">

    <link rel="stylesheet" href="ParteCSS/Login.css">
    <link rel="stylesheet" href="ParteCSS/styleSito.css">
    <title>Login</title>
    <% String x=" ";
    if(request.getAttribute("parametri")!=null)
    {
        x="Email o password errati!";
    }%>
</head>



<body>

<header>
    <img src="${pageContext.request.contextPath}/immagini/logo.jpg">
</header>

<table>
    <form action="LoginServlet" method="post">
        <tr>
            <th>
                <label for="email">Inserisci l'email</label><br>
                <input type="email" placeholder="Inserisci l'email" name="Email" id="email" required><br>
                <label for="password"><b>Inserisci la password</b></label><br>
                <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
                <button onclick="confermaParametri()" type="submit" id="submit" class="cart">Login</button>
                <p style="color: darkred; text-align: center"><%=x%></p>
                <br>
            </th>
        </tr>
    </form>
    <th>
        <button type="submit" class="cart"><a style="text-decoration: none; color: white; text-underline: none" href="Registrazione">Registrati</a></button>
    </th>
</table>

<script>
    function confermaParametri() {
        let email = document.getElementById('email').value;
        let password = document.getElementById('password').value;
        let emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        let resultEmail = emailRGX.test(email);
        let passwordRGX=/^[a-zA-Z0-9!@#$%^&*]*$/;
        let resultPassword=passwordRGX.test(password);

        if (password.length < 8) {
            alert("La password non rispetta il numero minimo di caratteri");
            return false;
        }

        if (resultEmail === false) {
            alert("L'email non rispecchia il formato corretto.Riprovare");
            return false;
        }

        if (resultPassword === false) {
            alert("La password non rispecchia il formato corretto.Riprovare");
            return false;
        }
        return true;
    }
</script>
</body>
</html>