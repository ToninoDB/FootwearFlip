package Controller;

import Model.Prodotto;
import Model.ProdottoDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ProdottiCasualiServlet", value = "/ProdottiCasualiServlet")
public class ProdottiCasualiServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        int numeroProdottiDaEstrarre = 5; // Puoi impostare qualsiasi numero di prodotti casuali
        ArrayList<Prodotto> prodottiCasuali = null;
        try {
            prodottiCasuali = prodottoDAO.getProdottiRandom(numeroProdottiDaEstrarre);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("prodottiCasuali", prodottiCasuali);
        request.getRequestDispatcher("prodottiCasuali.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
