package Controller;

import Model.Prodotto;
import Model.ProdottoDAO;
import Model.Utente;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/AggiuntaProdottoServlet")
public class AggiuntaProdottoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Prodotto p = new Prodotto();
        p.setIdProdotto(request.getParameter("idProdotto"));
        p.setNomeCategoria(request.getParameter("nomeCategoria"));
        p.setNomeProd(request.getParameter("nomeProdotto"));
        p.setDescrizione(request.getParameter("descrizione"));
        p.setTaglia(Integer.parseInt(request.getParameter("taglia")));
        p.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
        p.setQuantita(Integer.parseInt(request.getParameter("quantita")));
        ProdottoDAO.aggiuntaProdotto(p);
        RequestDispatcher dispatcher = request.getRequestDispatcher("HomeServletAmministratore");
        dispatcher.forward(request, response);
    }
}
