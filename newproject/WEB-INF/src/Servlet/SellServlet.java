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
		req.setCharacterEncoding("Shift-JIS");

		String forwardURL = "/stock/error.jsp";

		String pushedButton = req.getParameter("button");
		if (pushedButton.equals("修正する")) {
			int sellNumber = Integer.parseInt(req.getParameter("sellNumber"));
			req.setAttribute("sellNumber", sellNumber);
			req.getRequestDispatcher("/stock/sell/sellInput.jsp").forward(req, resp);
			return;
		}

		HttpSession session = req.getSession();

		//SessionScopeから更新後の情報を持つbeanを取得
		User uBean = (User) session.getAttribute("user");
		Price pBean = (Price) session.getAttribute("price");
//		Stock sBean = (Stock) session.getAttribute("stock");

		//更新後の情報を持つuserBeanの作成
		User updateUserBean = null;
		try {
			updateUserBean = uBean.clone();
		} catch (CloneNotSupportedException e1) {
			e1.printStackTrace();
		}
		int sellNumber = Integer.parseInt(req.getParameter("sellNumber"));
		updateUserBean.setMoney(updateUserBean.getMoney() + (sellNumber * pBean.getOpenPrice()));

		//更新用のAssetがあるかどうか確認
		Asset aBean = (Asset) session.getAttribute("asset");
		Asset updateAssetBean = null;
		try {
			updateAssetBean = aBean.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		updateAssetBean.setNumber(updateAssetBean.getNumber() - sellNumber);

		boolean isSuccess = false;
		try {

			isSuccess = dao.PurchaseDAO.update(updateUserBean, updateAssetBean,pBean.getStockName(),-sellNumber);

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

			System.out.println("更新処理完了");

			//sell処理と使いまわすのならメッセージを追加するべき？

		}

		req.getRequestDispatcher(forwardURL).forward(req, resp);

	}

}
