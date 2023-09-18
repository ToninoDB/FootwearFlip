<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Metodo di pagamento</title>
    <link rel="icon" type="image/x-icon" href="immagini/favicon.png">
    <link rel="stylesheet" type="text/css" href="ParteCSS/PagamentoProdotti.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        function confermaParametri(){
            var nomeRGX=/^[a-zA-Z' ']*$/;
            var nomeCognome =document.getElementById('credenziali').value;

            if((nomeRGX.test(nomeCognome)) === false){
                alert("Nome e cognome non validi!");
                return false;
            }

            var numeroCarta =document.getElementById('NCarta').value;
            var numeroCartaRGX = /^[0-9]*$/;

            if((numeroCartaRGX.test(numeroCarta)) === false){
                alert("Formato del numero carta non valido!");
                return false;
            }
            if(numeroCarta.length !== 16)
            {
                alert("Dimensione del numero di carta errato!");
                return false;
            }

            var dataRGX= /^[0-9'/']*$/;

            var dataScadenza = document.getElementById('dataScadenza').value;
            // Verifica che la data sia nel formato "mm/aa" e che il mese sia tra 1 e 12
            var datePattern = /^(0[1-9]|1[0-2])\/\d{2}$/;
            if (!datePattern.test(dataScadenza)) {
                alert("Formato data non valido (mm/aa)");
                return false;
            }

            const [mese, anno] = dataScadenza.split("/");
            var meseInt = parseInt(mese, 10); // Converti il mese in un numero intero
            var annoInt = parseInt(anno, 10); // Converti l'anno in un numero intero

            if (meseInt < 1 || meseInt > 12) {
                alert("Il mese deve essere compreso tra 1 e 12");
                return false;
            }

            // Calcola l'anno completo aggiungendo '20' ai due numeri finali (esempio: da '23' a '2023')
            var annoCompleto = 2000 + annoInt;

            // La data di scadenza è il primo giorno del mese successivo
            var dataScadenzaCarta = new Date(annoCompleto, meseInt - 1, 1);

            var dataCorrente = new Date();

            if (dataScadenzaCarta <= dataCorrente) {
                alert("La carta di credito è scaduta");
                return false;
            }


            if((dataRGX.test(dataScadenza)) === false){
                alert("Formato data errato!");
                return false;
            }

            var numeroCVV =document.getElementById('cvv').value;
            console.log(numeroCVV);
            var numeroCVVRGX = /^[0-9]*$/;

            if((numeroCVVRGX.test(numeroCVV)) === false){
                alert("Formato del numero cvv non valido!");
                return false;
            }
            if(numeroCVV.length !== 3)
            {
                alert("Dimensione del numero cvv errato!");
                return false;
            }
            alert("Pagamento effettuato con successo");
            return true;
        }
    </script>
</head>
<body>
<form method="post" action="DatiPagamentoServlet">
<table>
        <tr>
            <th>
                <label for="credenziali">Inserire nome e cognome del titolare</label><br>
                <input type="text"  name="credenziali" id="credenziali" required><br>
                <label for="NCarta"><b>Inserire il numero di carta</b></label><br>
                <input type="number" name="NCarta" id="NCarta" required><br>
                <label for="dataScadenza"><b>Inserire la data di scadenza</b></label><br>
                <input type="text" name="dataScadenza" id="dataScadenza" required><br>
                <label for="cvv"><b>Inserisci il CVV</b></label><br>
                <input type="number" name="cvv" id="cvv" required><br>
                <br>
            </th>
        </tr>
    <th>
        <button onclick="return confermaParametri()" type="submit" class="cart"><i class="fa fa-credit-card"></i></button>
        <button type="submit" class="cart" onclick="window.location.href='HomePage'"><i class="fa fa-home"></i></button>
    </th>
</table>
</form>
</body>
</html>
