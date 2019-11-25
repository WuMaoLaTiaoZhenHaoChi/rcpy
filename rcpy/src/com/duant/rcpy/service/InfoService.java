package com.duant.rcpy.service;

import java.util.List;
import java.util.Map;

import com.duant.rcpy.domain.Info;

public interface InfoService {
	public int replaceIntoInfo(Info info);
	
	//审核通过
	Integer updateChangeByInfoid(Integer infoid);
	
	//审核不通过
	Integer updateSubmitByInfoid(Integer infoid);
	
	/**
	 * 用户提交
	 * @param infoid
	 * @return
	 */
	Integer updateInfoByInfoid(Integer infoid,Integer userid);
	/**
	 * @param infoid
	 * @return Info
	 */
	public Info selectByPrimaryKey(Integer infoid);
	
	/**
	 * @return List<Info>
	 */
	public List<Info> selectAllInfo();
	
	
	/**
	 * 分页查询
	 * @param start
	 * @param pageSize
	 * @return
	 */
	List<Info> selectInfoByPage(Integer start,Integer pageSize);
	
	/**
	 * @return
	 */
	public List<Integer> selectAllGrade();
	
	/**
	 * @param grade
	 * @return
	 */
	public List<String> selectAllCollegeByGrade(Integer grade);
	
	/**
	 * @param grade
	 * @param college
	 * @return
	 */
	public List<String> selectAllSpecialtyByCollege(Integer grade,String college);
	
	/**
	 * 通过Grade College Specialty 查询Info
	 * @param grade
	 * @param college
	 * @param specialty
	 * @return
	 */
	public Info selectInfoByGCS(Integer grade,String college,String specialty);
	
	//web端表格
	public Map<String,Object> showTable(Integer infoid);
	
	//excel 通过专业和学期
	public Map<Integer,Object> showTableBysemster2(Integer infoid,Integer semester);
	
	//excel 通过专业
	public Map<Integer,Object> showTableBysemster1(Integer infoid) ;
	
}
