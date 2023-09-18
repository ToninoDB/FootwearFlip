package Controller;

import Model.Prodotto;
import Model.ProdottoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/HomePage")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("valore")==null)
        {
            ArrayList<Prodotto> prodotti = new ArrayList<>();
            try {
                prodotti = ProdottoDAO.getProdottiRandom(8);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("prodotti", prodotti);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/HomePage.jsp");
            dispatcher.forward(request, response);
        }
        else if(request.getParameter("valore").equals("home")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/amministratore/VediTuttiIProdotti.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}