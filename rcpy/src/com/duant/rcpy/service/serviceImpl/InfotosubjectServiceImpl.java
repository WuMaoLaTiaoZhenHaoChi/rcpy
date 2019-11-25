package com.duant.rcpy.service.serviceImpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.duant.rcpy.domain.Infotosubject;
import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.domain.Table;
import com.duant.rcpy.mapper.InfoMapper;
import com.duant.rcpy.mapper.InfotosubjectMapper;
import com.duant.rcpy.mapper.SubjectMapper;
import com.duant.rcpy.service.InfotosubjectService;
import com.duant.rcpy.service.SubjectService;

@Transactional
@Service
public class InfotosubjectServiceImpl implements InfotosubjectService {
	
	@Resource
	private InfoMapper infoMapper;
	@Resource
	private InfotosubjectMapper itsMapper;
	@Resource
	private SubjectMapper subjectMapper;
	@Resource
	private SubjectService subjectService;
	@Resource
	private Table table;
	@Resource
	private Infotosubject its;
	
	@Override
	public Map<Integer, List<Table>> showTableMap(int infoid) {
		Map<Integer, List<Table>> tableMap = new HashMap<>();
		List<Subject> subjectList = subjectService.selectAllByInfoid(infoid);
		
		List<Table> ggjcList = new ArrayList<>();
		List<Table> zydljcList = new ArrayList<>();
		List<Table> zyjcList = new ArrayList<>();
		List<Table> zyList = new ArrayList<>();
		List<Table> jsjylList = new ArrayList<>();
		List<Table> jzsjList = new ArrayList<>();
		List<Table> dektList = new ArrayList<>();
		
		for(Subject subject : subjectList) {
			its = itsMapper.selectSubjectIdByIAndS(infoid, subject.getSubjectid());
			table = new Table(subject.getProperty1(), subject.getProperty2(), subject.getSubjectid(), 
					subject.getSubjectname(), its.getSemester(), its.getFraction(), 
					its.getClasshour(), its.getClasshourweek(), its.getMode());
			if("公共基础课程".equals(subject.getProperty1())){
				ggjcList.add(table);
			}
			if("专业大类基础课程".equals(subject.getProperty1())){
				zydljcList.add(table);
			}
			if("专业基础课".equals(subject.getProperty1())){
				zyjcList.add(table);
			}
			if("专业基础课程".equals(subject.getProperty1())){
				jsjylList.add(table);
			}
			if("教师教育类课程".equals(subject.getProperty1())){
				ggjcList.add(table);
			}
			if("集中实践模块".equals(subject.getProperty1())){
				jzsjList.add(table);
			}
			if("第二课堂模块".equals(subject.getProperty1())){
				dektList.add(table);
			}
		}

		tableMap.put(1, ggjcList);
		tableMap.put(2, zydljcList);
		tableMap.put(3, zyjcList);
		tableMap.put(4, zyList);
		tableMap.put(5, jsjylList);
		tableMap.put(6, jzsjList);
		tableMap.put(7, dektList);

		return tableMap;
	}

	@Override
	public List<Table> showTable(int infoid) {
		
		List<Subject> subjectList = subjectService.selectAllByInfoid(infoid);
		List<Table> tableList = new ArrayList<>();
		for(Subject subject : subjectList) {
			its = itsMapper.selectSubjectIdByIAndS(infoid, subject.getSubjectid());
			table = new Table(subject.getProperty1(), subject.getProperty2(), subject.getSubjectid(), 
					subject.getSubjectname(), its.getSemester(), its.getFraction(), 
					its.getClasshour(), its.getClasshourweek(), its.getMode());
			tableList.add(table);
		}
		return tableList;
	}
	
	@Autowired
	private InfotosubjectMapper infotosubjectMapper;
	
	@Override
	public int insert(Infotosubject its) {
		return infotosubjectMapper.insert(its);
	}

	@Override
	public int deleteByPrimaryKey(Integer infoid,Integer subjectid) {
		return infotosubjectMapper.deleteByPrimaryKey(infoid, subjectid);
	}

	@Override
	public int updateByPrimaryKey(Infotosubject its) {
		return infotosubjectMapper.updateByPrimaryKey(its);
	}

	@Override
	public List<Infotosubject> selectAllByPrimaryKey(Integer infoid) {
		return infotosubjectMapper.selectAllByPrimaryKey(infoid);
	}

	@Override
	public List<Integer> selectSubjectIdByPrimaryKey(Integer infoid, Integer semester) {
		return infotosubjectMapper.selectSubjectIdByPrimaryKey(infoid, semester);
	}

	@Override
	public Infotosubject selectSubjectIdByIAndS(Integer infoid, Integer subjectid) {
		return infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
	}

	@Override
	public Map<String, Object> showTableForWeb(int infoid) {
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Subject> subjectList = subjectService.selectAllByInfoid(infoid);
		Set<String> property1Set = new HashSet<String>();
		Set<String> property2Set = new HashSet<String>();
		
		List<Subject> tongshiList = new ArrayList<Subject>();
		List<Subject> jichuList = new ArrayList<Subject>();
		List<Subject> zhuanyeList = new ArrayList<Subject>();
		List<Subject> shijianList = new ArrayList<Subject>();	
		List<Subject> zhuanyejcList = new ArrayList<Subject>();
		List<Subject> dierktList = new ArrayList<Subject>();
		List<Subject> jiaoshijyList = new ArrayList<Subject>();
		
		List<Infotosubject> bxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxjichuList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxshijianList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxzhuanyejcList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxdierktList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxjiaoshijyList = new ArrayList<Infotosubject>();
		
		
		List<Infotosubject> xxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxjichuList= new ArrayList<Infotosubject>();
		List<Infotosubject> xxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxshijianList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxzhuanyejcList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxdierktList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxjiaoshijyList = new ArrayList<Infotosubject>();
		
		for(Subject sub : subjectList) {
			Integer subjectid= sub.getSubjectid();
			Infotosubject infotosubject = infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
			
			property1Set.add(sub.getProperty1());
			property2Set.add(sub.getProperty2());
			
			if("必修".equals(sub.getProperty2())) {
				resultMap.put("bixiu", sub);
				if("公共基础课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					bxtongshiList.add(infotosubject);
				}else if("专业大类基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					bxjichuList.add(infotosubject);
				}else if("专业基础课".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					bxzhuanyeList.add(infotosubject);
				}else if("集中实践模块".equals(sub.getProperty1())) {
					shijianList.add(sub);
					bxshijianList.add(infotosubject);
				}else if("专业基础课程".equals(sub.getProperty1())) {
					zhuanyejcList.add(sub);
					bxzhuanyejcList.add(infotosubject);
				}else if("教师教育类课程".equals(sub.getProperty1())) {
					jiaoshijyList.add(sub);
					bxjiaoshijyList.add(infotosubject);
				}else if("第二课堂模块".equals(sub.getProperty1())) {
					dierktList.add(sub);
					bxdierktList.add(infotosubject);
				}
			}
			
		}
		
		for(Subject sub : subjectList) {
			Integer subjectid= sub.getSubjectid();
			Infotosubject infotosubject = infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
			
			property1Set.add(sub.getProperty1());
			property2Set.add(sub.getProperty2());
			
			if("选修".equals(sub.getProperty2())) {
				resultMap.put("xuanxiu", sub);
				if("公共基础课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					xxtongshiList.add(infotosubject);
				}else if("专业大类基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					xxjichuList.add(infotosubject);
				}else if("专业基础课".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					xxzhuanyeList.add(infotosubject);
				}else if("集中实践模块".equals(sub.getProperty1())) {
					shijianList.add(sub);
					xxshijianList.add(infotosubject);
				}else if("专业基础课程".equals(sub.getProperty1())) {
					zhuanyejcList.add(sub);
					xxzhuanyejcList.add(infotosubject);
				}else if("教师教育类课程".equals(sub.getProperty1())) {
					jiaoshijyList.add(sub);
					xxjiaoshijyList.add(infotosubject);
				}else if("第二课堂模块".equals(sub.getProperty1())) {
					dierktList.add(sub);
					xxdierktList.add(infotosubject);
				}
			}
			
		}
		
		
		resultMap.put("tongshi", tongshiList);
		resultMap.put("jichu", jichuList);
		resultMap.put("zhuanye", zhuanyeList);
		resultMap.put("shijian", shijianList);
		resultMap.put("zhuanyejc", zhuanyejcList);
		resultMap.put("jiaoshijy", jiaoshijyList);
		resultMap.put("dierkt", dierktList);
		
		resultMap.put("bxtongshi", bxtongshiList);
		resultMap.put("bxjichu", bxjichuList);
		resultMap.put("bxzhuanye", bxzhuanyeList);
		resultMap.put("bxshijian", bxshijianList);
		resultMap.put("bxzhuanyejc", bxzhuanyejcList);
		resultMap.put("bxjiaoshijy", bxjiaoshijyList);
		resultMap.put("bxdierkt", bxdierktList);
		
		resultMap.put("xxtongshi", xxtongshiList);
		resultMap.put("xxjichu", xxjichuList);
		resultMap.put("xxzhuanye", xxzhuanyeList);
		resultMap.put("xxshijian", xxshijianList);
		resultMap.put("xxzhuanyejc", xxzhuanyejcList);
		resultMap.put("xxjiaoshijy", xxjiaoshijyList);
		resultMap.put("xxdierkt", xxdierktList);
		
		if(property1Set.size() > 0) {
			resultMap.put("property1sum", property1Set.size());
		}
		if(property2Set.size() > 0) {
			resultMap.put("property2sum", property2Set.size());
		}	
		
		return resultMap;
		
	}

	@Override
	public Map<Integer, Object> showTableForExcel(Integer infoid, Integer semester) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Subject> subjectList = new ArrayList<>();
		if(semester > 0) {
			subjectList = subjectService.selectAllByPrimaryKey(infoid, semester);
		}else {
			subjectList = subjectService.selectAllByInfoid(infoid);
		}
		
		Set<String> property1Set = new HashSet<String>();
		Set<String> property2Set = new HashSet<String>();
		
		List<Subject> tongshiList = new ArrayList<Subject>();
		List<Subject> jichuList = new ArrayList<Subject>();
		List<Subject> zhuanyeList = new ArrayList<Subject>();
		List<Subject> shijianList = new ArrayList<Subject>();	
		List<Subject> zhuanyejcList = new ArrayList<Subject>();
		List<Subject> dierktList = new ArrayList<Subject>();
		List<Subject> jiaoshijyList = new ArrayList<Subject>();
		
		List<Infotosubject> bxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxjichuList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxshijianList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxzhuanyejcList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxdierktList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxjiaoshijyList = new ArrayList<Infotosubject>();
		
		
		List<Infotosubject> xxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxjichuList= new ArrayList<Infotosubject>();
		List<Infotosubject> xxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxshijianList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxzhuanyejcList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxdierktList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxjiaoshijyList = new ArrayList<Infotosubject>();
		
		for(Subject sub : subjectList) {
			Integer subjectid= sub.getSubjectid();
			Infotosubject infotosubject = infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
			
			property1Set.add(sub.getProperty1());
			property2Set.add(sub.getProperty2());
			
			if("必修".equals(sub.getProperty2())) {
				resultMap.put("bixiu", sub);
				if("公共基础课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					bxtongshiList.add(infotosubject);
				}else if("专业大类基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					bxjichuList.add(infotosubject);
				}else if("专业基础课".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					bxzhuanyeList.add(infotosubject);
				}else if("集中实践模块".equals(sub.getProperty1())) {
					shijianList.add(sub);
					bxshijianList.add(infotosubject);
				}else if("专业基础课程".equals(sub.getProperty1())) {
					zhuanyejcList.add(sub);
					bxzhuanyejcList.add(infotosubject);
				}else if("教师教育类课程".equals(sub.getProperty1())) {
					jiaoshijyList.add(sub);
					bxjiaoshijyList.add(infotosubject);
				}else if("第二课堂模块".equals(sub.getProperty1())) {
					dierktList.add(sub);
					bxdierktList.add(infotosubject);
				}
			}
			
		}
		
		for(Subject sub : subjectList) {
			Integer subjectid= sub.getSubjectid();
			Infotosubject infotosubject = infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
			
			property1Set.add(sub.getProperty1());
			property2Set.add(sub.getProperty2());
			
			if("选修".equals(sub.getProperty2())) {
				resultMap.put("xuanxiu", sub);
				if("公共基础课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					xxtongshiList.add(infotosubject);
				}else if("专业大类基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					xxjichuList.add(infotosubject);
				}else if("专业基础课".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					xxzhuanyeList.add(infotosubject);
				}else if("集中实践模块".equals(sub.getProperty1())) {
					shijianList.add(sub);
					xxshijianList.add(infotosubject);
				}else if("专业基础课程".equals(sub.getProperty1())) {
					zhuanyejcList.add(sub);
					xxzhuanyejcList.add(infotosubject);
				}else if("教师教育类课程".equals(sub.getProperty1())) {
					jiaoshijyList.add(sub);
					xxjiaoshijyList.add(infotosubject);
				}else if("第二课堂模块".equals(sub.getProperty1())) {
					dierktList.add(sub);
					xxdierktList.add(infotosubject);
				}
			}
			
		}
		
		List<List<Subject>> list1 = new ArrayList<List<Subject>>();
		List<List<Infotosubject>> listInfotosubject1 = new ArrayList<List<Infotosubject>>();
		List<List<Infotosubject>> listInfotosubject2 = new ArrayList<List<Infotosubject>>();
		
		list1.add(tongshiList);
		list1.add(jichuList);
		list1.add(zhuanyeList);
		list1.add(shijianList);
		list1.add(zhuanyejcList);
		list1.add(jiaoshijyList);
		list1.add(dierktList);
		
		listInfotosubject1.add(bxtongshiList);
		listInfotosubject1.add(bxjichuList);
		listInfotosubject1.add(bxzhuanyeList);
		listInfotosubject1.add(bxshijianList);
		listInfotosubject1.add(bxzhuanyejcList);
		listInfotosubject1.add(bxjiaoshijyList);
		listInfotosubject1.add(bxdierktList);
		
		listInfotosubject2.add(xxtongshiList);
		listInfotosubject2.add(xxjichuList);
		listInfotosubject2.add(xxzhuanyeList);
		listInfotosubject2.add(xxshijianList);
		listInfotosubject1.add(xxzhuanyejcList);
		listInfotosubject1.add(xxjiaoshijyList);
		listInfotosubject1.add(xxdierktList);
		
		Map<Integer, Object> map= new HashMap<Integer, Object>();
		map.put(1, list1);
		map.put(2, listInfotosubject1);
		map.put(3, listInfotosubject2);
		
		return map;
	}

}
