package news;

public class NewsParameter {
	public static void main(String[] args) {
		String str=NewsParameter.category(0);
		System.out.println(str);
	}
	public static String category(int stockCode) {
		String category ="";
		String cls ="";

		switch(stockCode) {
		case 4911:
			category="科学";
			cls="category-chem";
			break;
		case 7203:
			category="輸送用機器";
			cls="category-tran";
			break;
		case 9202:
			category="空運業";
			cls="category-sky";
			break;
		case 8267:
			category="小売業";
			cls="category-retail";
			break;
		case 9064:
			category="陸運業";
			cls="category-land";
			break;
		case 9984:
			category="情報・通信業";
			cls="category-info";
			break;
		default:
			category="テクノロジー";
			cls="category-tech";
			break;
		}

		String tag ="<div class=\"category %s\">%s</div>";
		return String.format(tag, cls,category);
	}
}
