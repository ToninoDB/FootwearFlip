<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/immagini/favicon.png">
    <title>Contatti</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="ParteCSS/Contatti.css">
    <script>
        $(document).ready(function(){
            $("#1").mouseenter(function () {
                $("#1").css("color","#b81414");
            });
            $("#1").mouseleave(function(){
                $("#1").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#2").mouseenter(function () {
                $("#2").css("color","#b81414");
            });
            $("#2").mouseleave(function(){
                $("#2").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#3").mouseenter(function () {
                $("#3").css("color","#b81414");
            });
            $("#3").mouseleave(function(){
                $("#3").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#4").mouseenter(function () {
                $("#4").css("color","#b81414");
            });
            $("#4").mouseleave(function(){
                $("#4").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#5").mouseenter(function () {
                $("#5").css("color","#b81414");
            });
            $("#5").mouseleave(function(){
                $("#5").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#5").css("display","none");
            $("#5").css("color","transparent");
        });

        $(document).ready(function(){
            $("#chiSiamo").click(function(){
            $("#5").slideToggle("slow");
            $("#5").css("color","black");
            $("#5").css("font-weight","bold");
            });
        });

    </script>
</head>
<body>
<img src="${pageContext.request.contextPath}/immagini/favicon.png" class="contatti">
<div style="text-align: center">
    <p>Indirizzo:<br>Via Stabia, 559<br>80057 Sant'Antonio Abate (NA)</p>
    <p>Contatti Telefonici:<br>Cellulare: 3450613529<br>Cellulare 2: 3926010358</p>
    <p>E-mail:<br>footwear.flip@gmail.com</p>
    <p id="4">Orario:<br>Lun - Ven 09:30 - 18:00<br>Sabato 09:00 - 13:00<br>Domenica chiuso</p>
    <button style="display: block; margin: 0 auto" id="chiSiamo" class="cart">Chi siamo</button>
    <button style="display: block; margin: 0 auto" class="cart" onclick="window.location.href='HomePage'">HomePage</button>
</div>

   <p id="5">Ci occupiamo della vendita di snickers.<br>
        Nel nostro servizio di vendita snickers offriamo al cliente un'ampia gamma di soluzioni con un ottimo rapporto qualità-prezzo.<br>
        Potrete valutare le nostre scarpe in memory foam che si adattano alla perfezione alle forme del corpo <br>
        Per maggiori informazioni sul nostro servizio di vendita e per gli altri accessori indispensabili, contattateci utilizzando il numero di telefono indicato sul sito.
    </p>
</body>
</html>
