package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.PatientDao;
import dao.PatientDaoImpl;
import dto.Patient;
import util.PageInfo;

public class PatientServiceImpl implements PatientService {
   private PatientDao patientDao;

   public PatientServiceImpl() {
      patientDao = new PatientDaoImpl();
   }
   

   @Override
   public Map<String, Object> patientListByPage(Integer page) throws Exception {
	   PageInfo pageInfo = new PageInfo();
		Integer patientCount = patientDao.selectPatientCount();
		int maxPage = (int) Math.ceil((double) patientCount / 10); // ceil 반올림 floor 반내림
		int startPage = (page - 1) / 10 * 10 + 1; // 1,11,21,31...
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		if (page > maxPage)
			page = maxPage; // 2페이지 1개 일때 삭제하면 현재페이지랑 max페이지를 같게 1페이지로

		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		int row = (page - 1) * 10 + 1; // 현재 페이지의 시작 row
		List<Patient> patientList = patientDao.selectPatientList(row - 1);

		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("patientList", patientList);
		return map;
   }
   
   
   @Override
   public Map<String, Object> patientSearch(String type, String keyword, Integer page) throws Exception {
      Map<String, Object> param = new HashMap<>();

      param.put("type", type);
      param.put("keyword", keyword);
      PageInfo pageInfo = new PageInfo();
      int patientCount = patientDao.searchPatientCount(param);
      int maxPage = (int) Math.ceil((double) patientCount / 10); // ceil 반올림 floor 반내림
      int startPage = (page - 1) / 10 * 10 + 1; // 1,11,21,31...
      int endPage = startPage + 10 - 1;
      if (endPage > maxPage)
         endPage = maxPage;
      if (page > maxPage)
         page = maxPage; // 2페이지 1개 일때 삭제하면 현재페이지랑 max페이지를 같게 1페이지로

      pageInfo.setAllPage(maxPage);
      pageInfo.setCurPage(page);
      pageInfo.setStartPage(startPage);
      pageInfo.setEndPage(endPage);

      Map<String, Object> map = new HashMap<>();
      map.put("pageInfo", pageInfo);

      if (page == 0) {
         return map;
      }

      int row = (page - 1) * 10 + 1; // 현재 페이지의 시작 row
      param.put("row", row - 1);
      List<Patient> patientList = patientDao.searchPatientList(param);

      map.put("type", type);
      map.put("keyword", keyword);
      map.put("patientList", patientList);
      return map;

   }

   @Override
   public Patient login(String pemail, String ppassword) throws Exception {
      Patient patient = patientDao.selectPatient(pemail);
      if (patient == null)
         throw new Exception("이메일틀림");
      if (patient.getPpassword().equals(ppassword) == false)
         throw new Exception("비밀번호 오류");

      return patient;
   }

   @Override
   public void patientjoin(Patient patient) throws Exception {
      Patient spatient = patientDao.selectPatient(patient.getPemail());
      if (spatient != null)
         throw new Exception("이메일 중복오류");
      patientDao.insertPatient(patient);
   }

   @Override
   public String pemailcheck(String pemail) throws Exception {
      Patient patient = patientDao.selectPatient(pemail);
      if (patient == null)
         return "notexist";

      return "exist";
   }



}