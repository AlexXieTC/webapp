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
import bean.Stock;
import bean.User;

@WebServlet("/purchase")
public class PurchaseServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		req.setCharacterEncoding("UTF-8");

		String forwardURL = "/stock/error.jsp";

		String pushedButton=req.getParameter("button");
		if(pushedButton.equals("修正する")) {
			int purchaseNumber = Integer.parseInt(req.getParameter("parchaseNumber"));
			req.setAttribute("purchaseNumber", purchaseNumber);
			req.getRequestDispatcher("/stock/purchase/purchaseInput.jsp").forward(req, resp);
			return;
		}

		HttpSession session = req.getSession();

		//SessionScopeから更新後の情報を持つbeanを取得
		User uBean = (User) session.getAttribute("user");
		Price pBean = (Price) session.getAttribute("price");
		Stock sBean = (Stock) session.getAttribute("stock");

		//更新後の情報を持つuserBeanの作成
		User updateUserBean = null;
		try {
			updateUserBean = uBean.clone();
		} catch (CloneNotSupportedException e1) {
			e1.printStackTrace();
		}
		int purchaseNumber = Integer.parseInt(req.getParameter("purchaseNumber"));
		updateUserBean.setMoney(updateUserBean.getMoney() - (purchaseNumber * pBean.getOpenPrice()));

		//既にAssetがあるかどうか確認
		Asset aBean = (Asset) session.getAttribute("asset");
		Asset updateAssetBean = null;
		boolean isInsert = (aBean == null);
		//挿入用AssetBeanの生成
		if (isInsert) {
			aBean = new Asset();
			aBean.setStockCode(sBean.getStockCode());
			aBean.setUserID(uBean.getId());
			aBean.setNumber(purchaseNumber);

		} else {
			try {
				updateAssetBean = aBean.clone();
			} catch (CloneNotSupportedException e) {
				e.printStackTrace();
			}
			updateAssetBean.setNumber(updateAssetBean.getNumber() + purchaseNumber);
		}

		boolean isSuccess = false;
		try {

			if (isInsert)
				isSuccess = dao.PurchaseDAO.insert(updateUserBean, aBean);
			else
				isSuccess = dao.PurchaseDAO.update(updateUserBean, updateAssetBean);

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		if (isSuccess) {
			forwardURL = "/stock/purchase/purchaseComplete.jsp";

			session.setAttribute("user", updateUserBean);
			session.removeAttribute("price");
			session.removeAttribute("stock");
			session.removeAttribute("asset");

			System.out.println("更新処理完了");


		}

		req.getRequestDispatcher(forwardURL).forward(req, resp);

	}
}
