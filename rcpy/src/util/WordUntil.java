package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

import com.duant.rcpy.domain.Text;

public class WordUntil {
	
	HWPFDocument doc = null;
	FileInputStream fis;
	Range range = null;

	public void export(Map<String, Object> map,ServletOutputStream out) {
		String path = "rcpy.doc";
		File file = new File("C:\\rcpy.doc");
		//File file = new File("rcpy.doc");
		Text text = new Text();
		text = (Text) map.get("text");
		try {
				try {
					fis = new FileInputStream(file);	
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("导出失败！！！");
			}	
			doc = new HWPFDocument(fis);
			range = doc.getRange();
			range.replaceText("${title}", text.getTitle() == null ? "" : text.getTitle().replaceAll("\n", "\r\n  ") + "");
			range.replaceText("${targettext}",text.getTargettext() == null ? "" : text.getTargettext().replaceAll("\n", "\r\n  ") + "");
			range.replaceText("${requiretext}",text.getRequiretext() == null ? "" : text.getRequiretext().replaceAll("\n", "\r\n  ") + "");
			range.replaceText("${feature}",text.getFeaturetext() == null ? "" : text.getFeaturetext().replaceAll("\n", "\r\n  ") + "");
			range.replaceText("${xuezhitext}",text.getXuezhitext() == null ?  "" : text.getXuezhitext().replaceAll("\n", "\r\n  ") + "");
			range.replaceText("${subjecttext}",text.getSubjecttext() == null ? "" : text.getSubjecttext().replaceAll("\n", "\r\n  ") + "");
			doc.write(out);
		}catch (Exception e) {
			
		}finally {
			try {	
				doc.close();
				out.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
}
