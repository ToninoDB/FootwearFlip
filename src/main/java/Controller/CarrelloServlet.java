package Controller;

import Model.Prodotto;
import Model.Utente;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.*;

@WebServlet("/CarrelloServlet")
public class CarrelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente u = (Utente) session.getAttribute("Utente");
        ArrayList<Prodotto> cartList = new ArrayList<Prodotto>();
        ArrayList<Integer> qList = new ArrayList<Integer>();
        if(u!=null)
        {
            ArrayList<Prodotto> cart_list = (ArrayList<Prodotto>) session.getAttribute("cart-list");
            ArrayList<Integer> q_List = (ArrayList<Integer>)session.getAttribute("quantitaArticoli");
            Prodotto p = (Prodotto) session.getAttribute("prod");
            String id = p.getIdProdotto();
            if (cart_list == null && q_List==null)
            {
                cartList.add(p);
                qList.add(Integer.valueOf(request.getParameter("quantita")));
                session.setAttribute("cart-list", cartList);
                session.setAttribute("quantitaArticoli",qList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("HomePage");
                dispatcher.forward(request, response);
            }
            else
            {
                cartList = cart_list;
                qList=q_List;
                boolean exist = false;
                for(int i=0;i<cart_list.size();i++)
                {
                    if (cart_list.get(i).getIdProdotto().equals(id) && request.getParameter("quantita")!=null)
                    {
                        exist = true;
                        int qval = qList.get(i);
                        qval+=Integer.valueOf((request.getParameter("quantita")));
                        qList.set(i,qval);
                    }
                }
                if (!exist && request.getParameter("quantita")!=null)
                {
                    cartList.add(p);
                    qList.add(Integer.valueOf(request.getParameter("quantita")));
                    RequestDispatcher dispatcher = request.getRequestDispatcher("HomePage");
                    dispatcher.forward(request, response);
                }
                else
                {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("HomePage");
                    dispatcher.forward(request, response);
                }
            }
        }
        else
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
            dispatcher.forward(request, response);
        }

        if ((request.getParameter("action").contains("rimuovi")))
        {
            String x[] = request.getParameter("action").split("rimuovi");
            String val = x[1];
            for (int i = 0; i < cartList.size(); i++)
            {
                if (cartList.get(i).getIdProdotto().equalsIgnoreCase(val))
                {
                    cartList.remove(i);
                    qList.remove(i);
                    session.setAttribute("cart-list", cartList);
                    session.setAttribute("quantitaArticoli",qList);
                }
            }
            RequestDispatcher dispatcher1 = request.getRequestDispatcher("HomePage");
            dispatcher1.forward(request, response);
        }
        else
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
            dispatcher.forward(request, response);
        }
    }
}