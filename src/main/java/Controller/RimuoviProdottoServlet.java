package Controller;

import Model.Prodotto;
import Model.ProdottoDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RimuoviProdottoServlet", value = "/RimuoviProdottoServlet")
public class RimuoviProdottoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessione = request.getSession();
        Prodotto p = (Prodotto) sessione.getAttribute("idModificaPrezzo");
            ProdottoDAO.cancellaProdotto(p.getIdProdotto());
            ArrayList<Prodotto> tuttiProdotti = ProdottoDAO.doRetriveAll();
            request.setAttribute("tuttiProdotti", tuttiProdotti);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/amministratore/VediTuttiIProdotti.jsp");
            ds.forward(request, response);
    }
}
