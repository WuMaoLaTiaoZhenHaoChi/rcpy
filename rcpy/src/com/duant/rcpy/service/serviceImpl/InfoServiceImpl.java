package com.duant.rcpy.service.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.duant.rcpy.domain.Info;
import com.duant.rcpy.domain.Infotosubject;
import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.mapper.InfoMapper;
import com.duant.rcpy.mapper.InfotosubjectMapper;
import com.duant.rcpy.mapper.SubjectMapper;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.SubjectService;

@Transactional
@Service
public class InfoServiceImpl implements InfoService{
	
	@Autowired
	private InfoMapper infoMapper;
	@Autowired
	private InfotosubjectMapper infotosubjectMapper;
	@Autowired
	private SubjectService subjectService;
	
	//管理员插入一条info
	@Override
	public int replaceIntoInfo(Info info) {
		int i = 0;
		Info info1 = infoMapper.selectInfoByGCS(info.getGrade(), info.getCollege(), info.getSpecialty());
		if(info1 != null)
			info.setInfoid(info1.getInfoid());
		i = infoMapper.replaceIntoInfo(info);
		return i;
	}
	
	@Override
	public Integer updateChangeByInfoid(Integer infoid) {
		return infoMapper.updateChangeByInfoid(infoid);
	}

	@Override
	public Integer updateSubmitByInfoid(Integer infoid) {
		return infoMapper.updateSubmitByInfoid(infoid);
	}
	
	//用户提交
	@Override
	public Integer updateInfoByInfoid(Integer infoid,Integer userid){
		return infoMapper.updateInfoByInfoid(infoid, userid);
	}
	
	@Override
	public Info selectByPrimaryKey(Integer infoid) {
		return infoMapper.selectByPrimaryKey(infoid);
	}

	@Override
	public List<Info> selectAllInfo() {
		return infoMapper.selectAllInfo();
	}
	
	//分页
	@Override
	public List<Info> selectInfoByPage(Integer start, Integer pageSize) {
		return infoMapper.selectInfoByPage(start, pageSize);
	}

	@Override
	public List<Integer> selectAllGrade() {
		return infoMapper.selectAllGrade();
	}

	@Override
	public List<String> selectAllCollegeByGrade(Integer grade) {
		return infoMapper.selectAllCollegeByGrade(grade);
	}

	@Override
	public List<String> selectAllSpecialtyByCollege(Integer grade, String college) {
		return infoMapper.selectAllSpecialtyByCollege(grade, college);
	}

	@Override
	public Info selectInfoByGCS(Integer grade, String college, String specialty) {
		return infoMapper.selectInfoByGCS(grade, college, specialty);
	}
	
	@Override
	public Map<Integer,Object> showTableBysemster2(Integer infoid,Integer semester) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Subject> subjectList = subjectService.selectAllByPrimaryKey(infoid, semester);
		
		Set<String> property1Set = new HashSet<String>();
		Set<String> property2Set = new HashSet<String>();
		
		List<Subject> tongshiList = new ArrayList<Subject>();
		List<Subject> jichuList = new ArrayList<Subject>();
		List<Subject> zhuanyeList = new ArrayList<Subject>();
		List<Subject> shijianList = new ArrayList<Subject>();
		
		List<Infotosubject> bxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxjichuList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxshijianList = new ArrayList<Infotosubject>();
		
		List<Infotosubject> xxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxjichuList= new ArrayList<Infotosubject>();
		List<Infotosubject> xxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxshijianList = new ArrayList<Infotosubject>();
		
		for(Subject sub : subjectList) {
			Integer subjectid= sub.getSubjectid();
			Infotosubject infotosubject = infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
			
			property1Set.add(sub.getProperty1());
			property2Set.add(sub.getProperty2());
			
			if("必修".equals(sub.getProperty2())) {
				resultMap.put("bixiu", sub);
				if("通识课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					bxtongshiList.add(infotosubject);
				}else if("学科基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					bxjichuList.add(infotosubject);
				}else if("专业课程".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					bxzhuanyeList.add(infotosubject);
				}else if("实践环节".equals(sub.getProperty1())) {
					shijianList.add(sub);
					bxshijianList.add(infotosubject);
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
				if("通识课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					xxtongshiList.add(infotosubject);
				}else if("学科基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					xxjichuList.add(infotosubject);
				}else if("专业课程".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					xxzhuanyeList.add(infotosubject);
				}else if("实践环节".equals(sub.getProperty1())) {
					shijianList.add(sub);
					xxshijianList.add(infotosubject);
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
		
		listInfotosubject1.add(bxtongshiList);
		listInfotosubject1.add(bxjichuList);
		listInfotosubject1.add(bxzhuanyeList);
		listInfotosubject1.add(bxshijianList);
		
		listInfotosubject2.add(xxtongshiList);
		listInfotosubject2.add(xxjichuList);
		listInfotosubject2.add(xxzhuanyeList);
		listInfotosubject2.add(xxshijianList);
		
		Map<Integer, Object> map= new HashMap<Integer, Object>();
		map.put(1, list1);
		map.put(2, listInfotosubject1);
		map.put(3, listInfotosubject2);
		
		return map;
	}


	@Override
	public Map<String, Object> showTable(Integer infoid) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Subject> subjectList = subjectService.selectAllByInfoid(infoid);
		Set<String> property1Set = new HashSet<String>();
		Set<String> property2Set = new HashSet<String>();
		List<Subject> tongshiList = new ArrayList<Subject>();
		List<Subject> jichuList = new ArrayList<Subject>();
		List<Subject> zhuanyeList = new ArrayList<Subject>();
		List<Subject> shijianList = new ArrayList<Subject>();
		
		List<Infotosubject> bxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxjichuList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxshijianList = new ArrayList<Infotosubject>();
		
		List<Infotosubject> xxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxjichuList= new ArrayList<Infotosubject>();
		List<Infotosubject> xxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxshijianList = new ArrayList<Infotosubject>();
		
		for(Subject sub : subjectList) {
			Integer subjectid= sub.getSubjectid();
			Infotosubject infotosubject = infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
			
			property1Set.add(sub.getProperty1());
			property2Set.add(sub.getProperty2());
			
			if("必修".equals(sub.getProperty2())) {
				resultMap.put("bixiu", sub);
				if("通识课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					bxtongshiList.add(infotosubject);
				}else if("学科基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					bxjichuList.add(infotosubject);
				}else if("专业课程".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					bxzhuanyeList.add(infotosubject);
				}else if("实践环节".equals(sub.getProperty1())) {
					shijianList.add(sub);
					bxshijianList.add(infotosubject);
				}
			}
			/*else if("选修".equals(sub.getProperty2())) {
				resultMap.put("xuanxiu", sub);
				if("通识课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					xxtongshiList.add(infotosubject);
				}else if("学科基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					xxjichuList.add(infotosubject);
				}else if("专业课程".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					xxzhuanyeList.add(infotosubject);
				}else if("实践环节".equals(sub.getProperty1())) {
					shijianList.add(sub);
					xxshijianList.add(infotosubject);
				}
			}*/
			
		}
		
		for(Subject sub : subjectList) {
			Integer subjectid= sub.getSubjectid();
			Infotosubject infotosubject = infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
			
			property1Set.add(sub.getProperty1());
			property2Set.add(sub.getProperty2());
			
			if("选修".equals(sub.getProperty2())) {
				resultMap.put("xuanxiu", sub);
				if("通识课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					xxtongshiList.add(infotosubject);
				}else if("学科基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					xxjichuList.add(infotosubject);
				}else if("专业课程".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					xxzhuanyeList.add(infotosubject);
				}else if("实践环节".equals(sub.getProperty1())) {
					shijianList.add(sub);
					xxshijianList.add(infotosubject);
				}
			}
			
		}
		
		
		resultMap.put("tongshi", tongshiList);
		resultMap.put("jichu", jichuList);
		resultMap.put("zhuanye", zhuanyeList);
		resultMap.put("shijian", shijianList);
		
		resultMap.put("bxtongshi", bxtongshiList);
		resultMap.put("bxjichu", bxjichuList);
		resultMap.put("bxzhuanye", bxzhuanyeList);
		resultMap.put("bxshijian", bxshijianList);
		
		resultMap.put("xxtongshi", xxtongshiList);
		resultMap.put("xxjichu", xxjichuList);
		resultMap.put("xxzhuanye", xxzhuanyeList);
		resultMap.put("xxshijian", xxshijianList);
		
		if(property1Set.size() > 0) {
			resultMap.put("property1sum", property1Set.size());
		}
		if(property2Set.size() > 0) {
			resultMap.put("property2sum", property2Set.size());
		}	
		
//		while(iter.hasNext()) {
//			System.out.println(iter.next());
//			property1List.add(iter.next().getProperty1());
//		}
		return resultMap;
	}

	@Override
	public Map<Integer,Object> showTableBysemster1(Integer infoid) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Subject> subjectList = subjectService.selectAllByInfoid(infoid);
		Set<String> property1Set = new HashSet<String>();
		Set<String> property2Set = new HashSet<String>();
		List<Subject> tongshiList = new ArrayList<Subject>();
		List<Subject> jichuList = new ArrayList<Subject>();
		List<Subject> zhuanyeList = new ArrayList<Subject>();
		List<Subject> shijianList = new ArrayList<Subject>();
		
		List<Infotosubject> bxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxjichuList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> bxshijianList = new ArrayList<Infotosubject>();
		
		List<Infotosubject> xxtongshiList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxjichuList= new ArrayList<Infotosubject>();
		List<Infotosubject> xxzhuanyeList = new ArrayList<Infotosubject>();
		List<Infotosubject> xxshijianList = new ArrayList<Infotosubject>();
		
		for(Subject sub : subjectList) {
			Integer subjectid= sub.getSubjectid();
			Infotosubject infotosubject = infotosubjectMapper.selectSubjectIdByIAndS(infoid, subjectid);
			
			property1Set.add(sub.getProperty1());
			property2Set.add(sub.getProperty2());
			
			if("必修".equals(sub.getProperty2())) {
				resultMap.put("bixiu", sub);
				if("通识课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					bxtongshiList.add(infotosubject);
				}else if("学科基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					bxjichuList.add(infotosubject);
				}else if("专业课程".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					bxzhuanyeList.add(infotosubject);
				}else if("实践环节".equals(sub.getProperty1())) {
					shijianList.add(sub);
					bxshijianList.add(infotosubject);
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
				if("通识课程".equals(sub.getProperty1())) {
					tongshiList.add(sub);
					xxtongshiList.add(infotosubject);
				}else if("学科基础课程".equals(sub.getProperty1())) {
					jichuList.add(sub);
					xxjichuList.add(infotosubject);
				}else if("专业课程".equals(sub.getProperty1())) {
					zhuanyeList.add(sub);
					xxzhuanyeList.add(infotosubject);
				}else if("实践环节".equals(sub.getProperty1())) {
					shijianList.add(sub);
					xxshijianList.add(infotosubject);
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
		
		listInfotosubject1.add(bxtongshiList);
		listInfotosubject1.add(bxjichuList);
		listInfotosubject1.add(bxzhuanyeList);
		listInfotosubject1.add(bxshijianList);
		
		listInfotosubject2.add(xxtongshiList);
		listInfotosubject2.add(xxjichuList);
		listInfotosubject2.add(xxzhuanyeList);
		listInfotosubject2.add(xxshijianList);
		
		Map<Integer, Object> map= new HashMap<Integer, Object>();
		map.put(1, list1);
		map.put(2, listInfotosubject1);
		map.put(3, listInfotosubject2);
		
		
		return map;
	}







}
