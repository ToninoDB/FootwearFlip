package Model;

public class Prodotto {
    private String idProdotto, nomeProd, descrizione, nomeCategoria;
    private double prezzo;
    private int quantita, taglia;

    public String getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(String idProdotto) {
        this.idProdotto = idProdotto;
    }

    public String getNomeProd() {
        return nomeProd;
    }

    public void setNomeProd(String nomeProd) {
        this.nomeProd = nomeProd;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public int getTaglia() {
        return taglia;
    }

    public void setTaglia(int taglia) {
        this.taglia = taglia;
    }

    @Override
    public String toString() {
        return "Prodotto{" +
                "idProdotto='" + idProdotto + '\'' +
                ", nomeProd='" + nomeProd + '\'' +
                ", descrizione='" + descrizione + '\'' +
                ", nomeCategoria='" + nomeCategoria + '\'' +
                ", prezzo=" + prezzo +
                ", quantita=" + quantita +
                ", taglia=" + taglia +
                '}';
    }
}