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
public class ExcelUntil{
	/**
	 * 
	 * @param titles 标题数组
	 * @param map 需要的map数据
	 * @param out response io流
	 * @throws Exception
	 */
	public void export(String[] titles, Map<Integer,Object> map,ServletOutputStream out) {
		//System.out.println(map);
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
			HSSFFont font1 = workbook.createFont(); 
			font1.setFontName("微软雅黑");//设置字体名称 
			font1.setFontHeightInPoints((short)9);//设置字号 
			font1.setItalic(false);//设置是否为斜体 
			font1.setBold(true);//设置是否加粗 
			font1.setColor(IndexedColors.BLACK.index);//设置字体颜色 
			
			HSSFFont font2 = workbook.createFont(); 
			font2.setFontName("微软雅黑");//设置字体名称 
			font2.setFontHeightInPoints((short)9);//设置字号 
			font2.setItalic(false);//设置是否为斜体 
			font2.setBold(false);//设置是否加粗 
			font2.setColor(IndexedColors.RED.index);//设置字体颜色 		
			
			HSSFCellStyle cellStyle1 = workbook.createCellStyle();
			cellStyle1.setAlignment(HorizontalAlignment.CENTER);//水平居中 
			cellStyle1.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
			cellStyle1.setFont(font1);
			
			HSSFCellStyle cellStyle2 = workbook.createCellStyle();
			cellStyle2.setAlignment(HorizontalAlignment.CENTER);//水平居中 
			cellStyle2.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
			cellStyle2.setFont(font2);

			HSSFCell cell = null;
			//第一行
			for (int i = 0; i < titles.length; i++) {
				cell = row.createCell(i);//列索引从0开始
				cell.setCellValue(titles[i]);//列名1
				cell.setCellStyle(cellStyle1);//列样式 
			}
			//前两列合并
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));
			
			List<List<Subject>> property1List =  (List<List<Subject>>) map.get(1);
			List<List<Infotosubject>> bxList =  (List<List<Infotosubject>>) map.get(2);
			List<List<Infotosubject>> xxList =  (List<List<Infotosubject>>) map.get(3);
					
			int xuefencount = 0;
			int xueshicount = 0;
			int begin = 0;
			
			int bxListSize = bxList.size();
			int xxListSize = xxList.size();
				
			for(int j = 0; j < property1List.size() ; j++) {
				if(j < bxListSize) {	
					if(property1List.get(j).size() > 0){
						//必修
						if(bxList.get(j).size() > 0) {
							int bxxuefencount = 0;
							int bxxueshicount = 0;
							for(int i = 0;i < bxList.get(j).size(); i++) {
								row = sheet.createRow(begin + i + 1);
								row.createCell(0).setCellValue(property1List.get(j).get(i).getProperty1());
								row.createCell(1).setCellValue(property1List.get(j).get(i).getProperty2());
								row.createCell(2).setCellValue(property1List.get(j).get(i).getSubjectid());
								row.createCell(3).setCellValue(property1List.get(j).get(i).getSubjectname());
								row.createCell(4).setCellValue(bxList.get(j).get(i).getSemester());
								row.createCell(5).setCellValue(bxList.get(j).get(i).getFraction());
								row.createCell(6).setCellValue(bxList.get(j).get(i).getClasshour());
								row.createCell(7).setCellValue(bxList.get(j).get(i).getClasshourweek());
								row.createCell(8).setCellValue(bxList.get(j).get(i).getMode());
								bxxuefencount += bxList.get(j).get(i).getFraction();
								bxxueshicount += bxList.get(j).get(i).getClasshour();
							}
							//合计
							row = sheet.createRow( bxList.get(j).size() + begin + 1);
							cell = row.createCell(2); 
							cell.setCellValue("小计");
							cell.setCellStyle(cellStyle2);
							
							cell = row.createCell(5);
							cell.setCellValue(bxxuefencount);
							cell.setCellStyle(cellStyle2);
							
							cell = row.createCell(6);
							cell.setCellValue(bxxueshicount);
							cell.setCellStyle(cellStyle2);	
							//合并必修
							sheet.addMergedRegion(new CellRangeAddress(begin + 1,begin + bxList.get(j).size() + 1, 1,1));
							begin += bxList.get(j).size() + 1;
							//合并小计
							sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));
							xuefencount += bxxuefencount;
							xueshicount += bxxueshicount;	
				}
					}
					//选修
					if(j < xxListSize) {
						if(xxList.get(j).size() > 0 ) {
							int xxxuefencount = 0;
							int xxxueshicount = 0;
							for(int i = 0; i < xxList.get(j).size(); i++) {
								row = sheet.createRow( begin + i + 1);
								row.createCell(0).setCellValue(property1List.get(j).get( bxList.get(j).size() + i).getProperty1());
								row.createCell(1).setCellValue(property1List.get(j).get( bxList.get(j).size() + i).getProperty2());
								row.createCell(2).setCellValue(property1List.get(j).get( bxList.get(j).size() + i).getSubjectid());
								row.createCell(3).setCellValue(property1List.get(j).get( bxList.get(j).size() + i).getSubjectname());
								row.createCell(4).setCellValue(xxList.get(j).get(i).getSemester());
								row.createCell(5).setCellValue(xxList.get(j).get(i).getFraction());
								row.createCell(6).setCellValue(xxList.get(j).get(i).getClasshour());
								row.createCell(7).setCellValue(xxList.get(j).get(i).getClasshourweek());
								row.createCell(8).setCellValue(xxList.get(j).get(i).getMode());
								xxxuefencount += xxList.get(j).get(i).getFraction();
								xxxueshicount += xxList.get(j).get(i).getClasshour();
							}
						
							row = sheet.createRow(xxList.get(j).size() + begin + 1);
							cell = row.createCell(2);
							cell.setCellValue("小计");
							cell.setCellStyle(cellStyle2);
							
							cell = row.createCell(5);
							cell.setCellValue(xxxuefencount);
							cell.setCellStyle(cellStyle2);
							
							cell = row.createCell(6);
							cell.setCellValue(xxxueshicount);
							cell.setCellStyle(cellStyle2);
							
							//合并选修
							sheet.addMergedRegion(new CellRangeAddress(begin + 1, begin + xxList.get(j).size() + 1, 1,1));		
							begin += xxList.get(j).size() + 1;
							//小计
							sheet.addMergedRegion(new CellRangeAddress(begin, begin, 2,3));	
							xuefencount += xxxuefencount;
							xueshicount += xxxueshicount;
					}
					}
					//合并属性1
/*					if(bxList.get(j).size() > 0 && xxList.get(j).size() > 0) {
						sheet.addMergedRegion(new CellRangeAddress(begin - xxList.get(j).size() - bxList.get(j).size() - 1, begin, 0, 0));
					}else {
						sheet.addMergedRegion(new CellRangeAddress(begin - xxList.get(j).size() - bxList.get(j).size(), begin , 0, 0));
					}*/
					
				}
				
			}		
			
			//合计
//			row = sheet.createRow( begin + 1);
//			row.createCell(0).setCellValue("合计");
//			row.createCell(5).setCellValue(xuefencount);
//			row.createCell(6).setCellValue(xueshicount);
			row = sheet.createRow( begin + 1);
			cell = row.createCell(0);
			cell.setCellValue("合计");
			cell.setCellStyle(cellStyle2);//
			cell = row.createCell(5);
			cell.setCellValue(xuefencount);
			cell.setCellStyle(cellStyle2);//
			cell = row.createCell(6);
			cell.setCellValue(xueshicount);
			cell.setCellStyle(cellStyle2);//
			sheet.addMergedRegion(new CellRangeAddress( begin + 1, begin + 1, 0,3));
			
			for(int i = 0; i < titles.length; i++) {
				sheet.autoSizeColumn((short)i); //自动调整第一列宽度
			}
			
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
             try {
				throw new Exception("导出Excel失败！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
	} 
	
}
