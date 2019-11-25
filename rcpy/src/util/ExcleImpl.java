package util;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;

import com.duant.rcpy.domain.Infotosubject;
import com.duant.rcpy.domain.Subject;

/**
 * 
 * @author DT
 *
 */
public class ExcleImpl{

	/**
	 * 
	 * @param titles 标题数组
	 * @param map 需要的map数据
	 * @param out response io流
	 * @throws Exception
	 */
	public void export(String[] titles, Map<String, Object> map,ServletOutputStream out) throws Exception {
		System.out.println(map.keySet().toString());
		System.out.println(map);
		try {
			// 第一步，创建一个workbook，对应一个Excel文件
			HSSFWorkbook workbook = new HSSFWorkbook();
			
			// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
			HSSFSheet sheet = workbook.createSheet("人才培养方案");
			//设置列宽
			sheet.setDefaultColumnWidth(10);
			// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			HSSFRow row = sheet.createRow(0);
			row.setHeightInPoints(20);//设置行的高度
			// 第四步，创建单元格，并设置值表头 设置表头居中
			HSSFFont font = workbook.createFont(); 
			font.setFontName("微软雅黑");//设置字体名称 
			font.setFontHeightInPoints((short)11);//设置字号 
			font.setItalic(false);//设置是否为斜体 
			font.setBold(true);//设置是否加粗 
			font.setColor(IndexedColors.BLACK.index);//设置字体颜色 
			
			HSSFFont font2 = workbook.createFont(); 
			font2.setFontName("微软雅黑");//设置字体名称 
			font2.setFontHeightInPoints((short)10);//设置字号 
			font2.setItalic(false);//设置是否为斜体 
			font2.setBold(false);//设置是否加粗 
			font2.setColor(IndexedColors.BLACK1.index);//设置字体颜色 		
			
			HSSFCellStyle cellStyle1 = workbook.createCellStyle();
			cellStyle1.setAlignment(HorizontalAlignment.CENTER);//水平居中 
			cellStyle1.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
			cellStyle1.setFillPattern(FillPatternType.SOLID_FOREGROUND);//背景 
			cellStyle1.setFillForegroundColor(IndexedColors.WHITE1.index);//背景	
			cellStyle1.setBorderBottom(BorderStyle.THIN);//下边框 
			cellStyle1.setBorderLeft(BorderStyle.THIN);//左边框 
			cellStyle1.setBorderRight(BorderStyle.THIN);//右边框 
			cellStyle1.setBorderTop(BorderStyle.THIN); //上边框
			cellStyle1.setFont(font);
			
			HSSFCellStyle cellStyle2 = workbook.createCellStyle();
			cellStyle2.setAlignment(HorizontalAlignment.CENTER);//水平居中 
			cellStyle2.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
			cellStyle2.setFillForegroundColor(IndexedColors.WHITE.index);//背景
			cellStyle2.setFont(font);

			HSSFCell cell = null;
			//第一行
			for (int i = 0; i < titles.length; i++) {
				cell = row.createCell(i);//列索引从0开始
				cell.setCellValue(titles[i]);//列名1
				cell.setCellStyle(cellStyle1);//列样式 
			}
			//前两列合并
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));
			
			List<Infotosubject> bxtongshi =	(List<Infotosubject>) map.get("bxtongshi");
			List<Infotosubject> xxtongshi = (List<Infotosubject>) map.get("xxtongshi");
			List<Infotosubject> bxzhuanye = (List<Infotosubject>) map.get("bxzhuanye");
			List<Infotosubject> xxzhuanye = (List<Infotosubject>) map.get("xxzhuanye");
			List<Infotosubject> bxjichu = (List<Infotosubject>) map.get("bxjichu");
			List<Infotosubject> xxjichu = (List<Infotosubject>) map.get("xxjichu");
			List<Infotosubject> bxshijian = (List<Infotosubject>) map.get("bxshijian");
			List<Infotosubject> xxshijian = (List<Infotosubject>) map.get("xxshijian");
			
			List<Subject> tongshi = (List<Subject>) map.get("tongshi");
			List<Subject> zhuanye = (List<Subject>) map.get("zhuanye");
			List<Subject> jichu = (List<Subject>) map.get("jichu");
			List<Subject> shijian = (List<Subject>) map.get("shijian");
			
			int xuefencount = 0;
			int xueshicount = 0;
			int begin = 0;
			
			//通识
			if(tongshi.size() > 0) {
				if(bxtongshi.size() > 0) {
					int bxxuefencount = 0;
					int bxxueshicount = 0;
					for(int i = 0; i < bxtongshi.size(); i++) {
						row = sheet.createRow(begin + i + 1);
						row.createCell(0).setCellValue(tongshi.get(i).getProperty1());
						row.createCell(1).setCellValue(tongshi.get(i).getProperty2());
						row.createCell(2).setCellValue(tongshi.get(i).getSubjectid());
						row.createCell(3).setCellValue(tongshi.get(i).getSubjectname());
						row.createCell(4).setCellValue(bxtongshi.get(i).getSemester());
						row.createCell(5).setCellValue(bxtongshi.get(i).getFraction());
						row.createCell(6).setCellValue(bxtongshi.get(i).getClasshour());
						row.createCell(7).setCellValue(bxtongshi.get(i).getClasshourweek());
						row.createCell(8).setCellValue(bxtongshi.get(i).getMode());
						bxxuefencount += bxtongshi.get(i).getFraction();
						bxxueshicount += bxtongshi.get(i).getClasshour();
					}
						row = sheet.createRow( bxtongshi.size() + begin + 1);
						row.createCell(2).setCellValue("小计");
						row.createCell(5).setCellValue(bxxuefencount);
						row.createCell(6).setCellValue(bxxueshicount);	
						//合并必修
						sheet.addMergedRegion(new CellRangeAddress(begin + 1,begin + bxtongshi.size() + 1, 1,1));
						begin += bxtongshi.size() + 1;
						//合并小计
						sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));
						xuefencount += bxxuefencount;
						xueshicount += bxxueshicount;
				}
				if(xxtongshi.size() > 0) {
					int xxxuefencount = 0;
					int xxxueshicount = 0;
					for(int i = 0; i < xxtongshi.size(); i++) {
						row = sheet.createRow( begin + i + 1);
						row.createCell(0).setCellValue(tongshi.get( bxtongshi.size() + i).getProperty1());
						row.createCell(1).setCellValue(tongshi.get( bxtongshi.size() + i).getProperty2());
						row.createCell(2).setCellValue(tongshi.get( bxtongshi.size() + i).getSubjectid());
						row.createCell(3).setCellValue(tongshi.get( bxtongshi.size() + i).getSubjectname());
						row.createCell(4).setCellValue(xxtongshi.get(i).getSemester());
						row.createCell(5).setCellValue(xxtongshi.get(i).getFraction());
						row.createCell(6).setCellValue(xxtongshi.get(i).getClasshour());
						row.createCell(7).setCellValue(xxtongshi.get(i).getClasshourweek());
						row.createCell(8).setCellValue(xxtongshi.get(i).getMode());
						xxxuefencount += xxtongshi.get(i).getFraction();
						xxxueshicount += xxtongshi.get(i).getClasshour();
					}
						row = sheet.createRow( bxtongshi.size() + xxtongshi.size() + begin + 1);
						row.createCell(2).setCellValue("小计");
						row.createCell(5).setCellValue(xxxuefencount);
						row.createCell(6).setCellValue(xxxueshicount);
						//合并选修
						sheet.addMergedRegion(new CellRangeAddress(begin + 1, begin + xxtongshi.size() + 1, 1,1));		
						begin += xxtongshi.size() + 1;
						//小计
						sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));	
						xuefencount += xxxuefencount;
						xueshicount += xxxueshicount;
				}
				//合并属性1
				if(bxtongshi.size() > 0 && xxtongshi.size() > 0) {
					sheet.addMergedRegion(new CellRangeAddress(begin - xxtongshi.size() - bxtongshi.size() - 1, begin, 0, 0));
				}else {
					sheet.addMergedRegion(new CellRangeAddress(begin - xxtongshi.size() - bxtongshi.size(), begin , 0, 0));
				}
			}//
			
			//基础
			if(jichu.size() > 0) {
				if(bxjichu.size() > 0) {
					int bxxuefencount = 0;
					int bxxueshicount = 0;
					for(int i = 0; i < bxjichu.size(); i++) {
						row = sheet.createRow( i + begin + 1);
						row.createCell(0).setCellValue(jichu.get(i).getProperty1());
						row.createCell(1).setCellValue(jichu.get(i).getProperty2());
						row.createCell(2).setCellValue(jichu.get(i).getSubjectid());
						row.createCell(3).setCellValue(jichu.get(i).getSubjectname());
						row.createCell(4).setCellValue(bxjichu.get(i).getSemester());
						row.createCell(5).setCellValue(bxjichu.get(i).getFraction());
						row.createCell(6).setCellValue(bxjichu.get(i).getClasshour());
						row.createCell(7).setCellValue(bxjichu.get(i).getClasshourweek());
						row.createCell(8).setCellValue(bxjichu.get(i).getMode());
						bxxuefencount += bxjichu.get(i).getFraction();
						bxxueshicount += bxjichu.get(i).getClasshour();
					}
						row = sheet.createRow( bxjichu.size() + begin + 1);
						row.createCell(2).setCellValue("小计");
						row.createCell(5).setCellValue(bxxuefencount);
						row.createCell(6).setCellValue(bxxueshicount);	
						//合并必修
						sheet.addMergedRegion(new CellRangeAddress(begin + 1,begin + bxjichu.size() + 1, 1,1));
						begin += bxjichu.size() + 1;
						//合并小计
						sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));
						xuefencount += bxxuefencount;
						xueshicount += bxxueshicount;
				}
				if(xxjichu.size() > 0) {
					int xxxuefencount = 0;
					int xxxueshicount = 0;
					for(int i = 0; i < xxjichu.size(); i++) {
						row = sheet.createRow( begin + i + 1);
						row.createCell(0).setCellValue(jichu.get( bxjichu.size() + i).getProperty1());
						row.createCell(1).setCellValue(jichu.get( bxjichu.size() + i ).getProperty2());
						row.createCell(2).setCellValue(jichu.get( bxjichu.size() + i).getSubjectid());
						row.createCell(3).setCellValue(jichu.get( bxjichu.size() + i).getSubjectname());
						row.createCell(4).setCellValue(xxjichu.get(i).getSemester());
						row.createCell(5).setCellValue(xxjichu.get(i).getFraction());
						row.createCell(6).setCellValue(xxjichu.get(i).getClasshour());
						row.createCell(7).setCellValue(xxjichu.get(i).getClasshourweek());
						row.createCell(8).setCellValue(xxjichu.get(i).getMode());
						xxxuefencount += xxjichu.get(i).getFraction();
						xxxueshicount += xxjichu.get(i).getClasshour();
					}
						row = sheet.createRow( bxjichu.size() + xxjichu.size() + begin + 1);
						row.createCell(2).setCellValue("小计");
						row.createCell(5).setCellValue(xxxuefencount);
						row.createCell(6).setCellValue(xxxueshicount);
						//合计选修
						sheet.addMergedRegion(new CellRangeAddress(begin + 1, begin + xxjichu.size() + 1, 1,1));
						//合并小计
						begin += xxjichu.size() + 1;
						sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));	
						xuefencount += xxxuefencount;
						xueshicount += xxxueshicount;
				}
				//合并属性1
				if(bxjichu.size() > 0 && xxjichu.size() > 0) {
					sheet.addMergedRegion(new CellRangeAddress(begin - xxjichu.size() - bxjichu.size() - 1, begin, 0, 0));
				}else {
					sheet.addMergedRegion(new CellRangeAddress(begin - xxjichu.size() - bxjichu.size(), begin , 0, 0));
				}
			}//
			
			//专业课程
			if(zhuanye.size() > 0) {
				if(bxzhuanye.size() > 0) {
					int bxxuefencount = 0;
					int bxxueshicount = 0;
					for(int i = 0; i < bxzhuanye.size(); i++) {
						row = sheet.createRow( i + begin + 1);
						row.createCell(0).setCellValue(zhuanye.get(i).getProperty1());
						row.createCell(1).setCellValue(zhuanye.get(i).getProperty2());
						row.createCell(2).setCellValue(zhuanye.get(i).getSubjectid());
						row.createCell(3).setCellValue(zhuanye.get(i).getSubjectname());
						row.createCell(4).setCellValue(bxzhuanye.get(i).getSemester());
						row.createCell(5).setCellValue(bxzhuanye.get(i).getFraction());
						row.createCell(6).setCellValue(bxzhuanye.get(i).getClasshour());
						row.createCell(7).setCellValue(bxzhuanye.get(i).getClasshourweek());
						row.createCell(8).setCellValue(bxzhuanye.get(i).getMode());
						bxxuefencount += bxzhuanye.get(i).getFraction();
						bxxueshicount += bxzhuanye.get(i).getClasshour();
					}
						row = sheet.createRow( bxzhuanye.size() + begin + 1);
						row.createCell(2).setCellValue("小计");
						row.createCell(5).setCellValue(bxxuefencount);
						row.createCell(6).setCellValue(bxxueshicount);	
						//合并必修
						sheet.addMergedRegion(new CellRangeAddress(begin + 1,begin + bxzhuanye.size() + 1, 1,1));
						begin += bxzhuanye.size() + 1;
						//合并小计
						sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));
						xuefencount += bxxuefencount;
						xueshicount += bxxueshicount;
				}
				if(xxzhuanye.size() > 0) {
					int xxxuefencount = 0;
					int xxxueshicount = 0;
					for(int i = 0; i < xxzhuanye.size(); i++) {
						row = sheet.createRow(begin + i + 1 );
						row.createCell(0).setCellValue(zhuanye.get( bxzhuanye.size() + i).getProperty1());
						row.createCell(1).setCellValue(zhuanye.get( bxzhuanye.size() + i ).getProperty2());
						row.createCell(2).setCellValue(zhuanye.get( bxzhuanye.size() + i).getSubjectid());
						row.createCell(3).setCellValue(zhuanye.get( bxzhuanye.size() + i).getSubjectname());
						row.createCell(4).setCellValue(xxzhuanye.get(i).getSemester());
						row.createCell(5).setCellValue(xxzhuanye.get(i).getFraction());
						row.createCell(6).setCellValue(xxzhuanye.get(i).getClasshour());
						row.createCell(7).setCellValue(xxzhuanye.get(i).getClasshourweek());
						row.createCell(8).setCellValue(xxzhuanye.get(i).getMode());
						xxxuefencount += xxzhuanye.get(i).getFraction();
						xxxueshicount += xxzhuanye.get(i).getClasshour();
					}
						row = sheet.createRow( bxzhuanye.size() + xxzhuanye.size() + begin + 1);
						row.createCell(2).setCellValue("小计");
						row.createCell(5).setCellValue(xxxuefencount);
						row.createCell(6).setCellValue(xxxueshicount);
						//合计选修
						sheet.addMergedRegion(new CellRangeAddress(begin + 1, begin + xxzhuanye.size() + 1, 1,1));
						//合并小计
						//sheet.addMergedRegion(new CellRangeAddress(begin + xxtongshi.size() + 1, begin + xxtongshi.size() + 1, 2,3));	
						begin += xxzhuanye.size() + 1;
						sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));	
						xuefencount += xxxuefencount;
						xueshicount += xxxueshicount;
				}
				//合并属性1
				if(bxzhuanye.size() > 0 && xxzhuanye.size() > 0) {
					sheet.addMergedRegion(new CellRangeAddress(begin - xxzhuanye.size() - bxzhuanye.size() - 1, begin, 0, 0));
				}else {
					sheet.addMergedRegion(new CellRangeAddress(begin - xxzhuanye.size() - bxzhuanye.size(), begin , 0, 0));
				}
			}//
			
			//实践
			if(shijian.size() > 0) {
				if(bxshijian.size() > 0) {
					int bxxuefencount = 0;
					int bxxueshicount = 0;
					for(int i = 0; i < bxshijian.size(); i++) {
						row = sheet.createRow( i + begin + 1);
						row.createCell(0).setCellValue(shijian.get(i).getProperty1());
						row.createCell(1).setCellValue(shijian.get(i).getProperty2());
						row.createCell(2).setCellValue(shijian.get(i).getSubjectid());
						row.createCell(3).setCellValue(shijian.get(i).getSubjectname());
						row.createCell(4).setCellValue(bxshijian.get(i).getSemester());
						row.createCell(5).setCellValue(bxshijian.get(i).getFraction());
						row.createCell(6).setCellValue(bxshijian.get(i).getClasshour());
						row.createCell(7).setCellValue(bxshijian.get(i).getClasshourweek());
						row.createCell(8).setCellValue(bxshijian.get(i).getMode());
						bxxuefencount += bxshijian.get(i).getFraction();
						bxxueshicount += bxshijian.get(i).getClasshour();
					}
						row = sheet.createRow( bxshijian.size() + begin + 1);
						row.createCell(2).setCellValue("小计");
						row.createCell(5).setCellValue(bxxuefencount);
						row.createCell(6).setCellValue(bxxueshicount);	
						//合并必修
						sheet.addMergedRegion(new CellRangeAddress(begin + 1,begin + bxshijian.size() + 1, 1,1));
						begin += bxshijian.size() + 1;
						//合并小计
						sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));
						xuefencount += bxxuefencount;
						xueshicount += bxxueshicount;
				}
				if(xxshijian.size() > 0) {
					int xxxuefencount = 0;
					int xxxueshicount = 0;
					for(int i = 0; i < xxshijian.size(); i++) {
						row = sheet.createRow( begin + i + 1);
						row.createCell(0).setCellValue(shijian.get( bxshijian.size() + i).getProperty1());
						row.createCell(1).setCellValue(shijian.get( bxshijian.size() + i ).getProperty2());
						row.createCell(2).setCellValue(shijian.get( bxshijian.size() + i).getSubjectid());
						row.createCell(3).setCellValue(shijian.get( bxshijian.size() + i).getSubjectname());
						row.createCell(4).setCellValue(xxshijian.get(i).getSemester());
						row.createCell(5).setCellValue(xxshijian.get(i).getFraction());
						row.createCell(6).setCellValue(xxshijian.get(i).getClasshour());
						row.createCell(7).setCellValue(xxshijian.get(i).getClasshourweek());
						row.createCell(8).setCellValue(xxshijian.get(i).getMode());
						xxxuefencount += xxshijian.get(i).getFraction();
						xxxueshicount += xxshijian.get(i).getClasshour();
					}
						row = sheet.createRow( xxshijian.size() + xxshijian.size() +  begin + 1);
						row.createCell(2).setCellValue("小计");
						row.createCell(5).setCellValue(xxxuefencount);
						row.createCell(6).setCellValue(xxxueshicount);
						//合计选修
						sheet.addMergedRegion(new CellRangeAddress(begin + 1, begin + xxshijian.size() + 1, 1,1));
						//合并小计
						begin += xxshijian.size() + 1;
						sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));	
						xuefencount += xxxuefencount;
						xueshicount += xxxueshicount;
				}
				//合并属性1
				if(bxshijian.size() > 0 && xxshijian.size() > 0) {
					sheet.addMergedRegion(new CellRangeAddress(begin - xxshijian.size() - bxshijian.size() - 1, begin, 0, 0));
				}else {
					sheet.addMergedRegion(new CellRangeAddress(begin - xxshijian.size() - bxshijian.size(), begin , 0, 0));
				}
			}//
				
			row = sheet.createRow( begin + 1);
			row.createCell(0).setCellValue("合计");
			row.createCell(5).setCellValue(xuefencount);
			row.createCell(6).setCellValue(xueshicount);
			sheet.addMergedRegion(new CellRangeAddress( begin + 1, begin + 1, 0,3));
			
			// 第七步，将文件输出到客户端浏览器
			try {
				workbook.write(out);
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 e.printStackTrace();
             throw new Exception("导出信息失败！");
		}
		
	} 
	
}
