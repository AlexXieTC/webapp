package news;

import java.util.Random;

public class NewsParameter {
	public static void main(String[] args) {
		String str=NewsParameter.category(0);
		System.out.println(NewsParameter.getImageName(9984));
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

	public static String articleClass(int arrayNumber) {
		String  cls="card";
		switch(arrayNumber%6) {
		case 5:
			cls+=" bg-primary";
			break;
		case 1:
			cls+=" bg-dark";
			break;
		}

		return cls;
	}

	public static String getImageName(int stockCode) {
		String fileName ="";

		switch(stockCode) {
		case 4911:
			fileName="chem01.jpg";
			break;
		case 7203:
			fileName="car/car"+getRandomNumber(4)+".jpg";
			break;
		case 9202:
			fileName="sky01.jpg";

			break;
		case 8267:
			fileName="sup02.jpg";
			break;
		case 9064:
			fileName="del01.jpg";

			break;
		case 9984:
			fileName="com/com"+getRandomNumber(4)+".jpg";
			break;
		}


		return fileName;
	}

	public static String getRandomNumber(int fileNumber) {
		Random rand = new Random();
		int number =rand.nextInt(fileNumber)+1;
		String path="";
		if(number<10)path+="0";
		path +=number;
		return path;
	}

}
