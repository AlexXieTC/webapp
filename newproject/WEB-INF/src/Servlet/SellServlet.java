package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Asset;
import bean.Price;
import bean.User;

@WebServlet("/sell")
public class SellServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

		String forwardURL = "/stock/sell/sellerror.jsp";
		HttpSession session = req.getSession();

		//SessionScopeから更新後の情報を持つbeanを取得
		User uBean = (User) session.getAttribute("user");
		Price pBean = (Price) session.getAttribute("price");
		Asset aBean = (Asset) session.getAttribute("asset");

		//不正処理対策
		//戻る、日付の不一致対策
		if((pBean==null)||(!pBean.getDate().equals(uBean.getSimulationDate()))) {
			resp.sendRedirect(req.getContextPath()+"/showinfo");
			return;
		}

		String pushedButton = req.getParameter("button");
		if (pushedButton.equals("修正する")) {
			int sellNumber = Integer.parseInt(req.getParameter("sellNumber"));
			req.setAttribute("sellNumber", sellNumber);
			req.getRequestDispatcher("/stock/sell/sellInput.jsp").forward(req, resp);
			return;
		}


		//更新後の情報を持つuserBeanの作成
		User updateUserBean = null;
		try {
			updateUserBean = uBean.clone();
		} catch (CloneNotSupportedException e1) {
			e1.printStackTrace();
		}
		int sellNumber = Integer.parseInt(req.getParameter("sellNumber"));
		updateUserBean.setMoney(updateUserBean.getMoney() + (sellNumber * pBean.getOpenPrice()));
		aBean.setNumber(aBean.getNumber() - sellNumber);

		boolean isSuccess = false;
		try {
			isSuccess = dao.PurchaseDAO.update(updateUserBean, aBean,pBean.getStockName(),-sellNumber);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		if (isSuccess) {
			forwardURL = "/stock/sell/sellComplete.jsp";

			session.setAttribute("user", updateUserBean);
			session.removeAttribute("price");
			session.removeAttribute("stock");
			session.removeAttribute("asset");


			//sell処理と使いまわすのならメッセージを追加するべき？

		}else {
			session.removeAttribute("price");
			req.setAttribute("sell_error", "error");
		}

		req.getRequestDispatcher(forwardURL).forward(req, resp);

	}

}
