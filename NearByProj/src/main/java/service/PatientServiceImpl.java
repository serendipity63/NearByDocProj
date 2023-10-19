package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.PatientDao;
import dao.PatientDaoImpl;
import dao.ReservationDao;
import dao.ReservationDaoImpl;
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
		int maxPage = (int) Math.ceil((double) patientCount / 10);
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		if (page > maxPage)
			page = maxPage;

		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		int row = (page - 1) * 10 + 1;
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
		int maxPage = (int) Math.ceil((double) patientCount / 10);
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		if (page > maxPage)
			page = maxPage;

		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);

		if (page == 0) {
			return map;
		}

		int row = (page - 1) * 10 + 1;
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
			throw new Exception("이메일을 잘못 입력하셨습니다 다시 로그인해주세요");
		if (patient.getPpassword().equals(ppassword) == false)
			throw new Exception("비밀번호를 잘못 입력하셨습니다 다시 로그인해주세요");
		return patient;
	}

	@Override
	public void patientjoin(Patient patient) throws Exception {
		Patient spatient = patientDao.selectPatient(patient.getPemail());
		if (spatient != null)
			throw new Exception("이미 가입된 이메일이 있습니다 로그인해주세요!");
		patientDao.insertPatient(patient);
	}

	@Override
	public String pemailcheck(String pemail) throws Exception {
		Patient patient = patientDao.selectPatient(pemail);
		if (patient == null)
			return "notexist";

		return "exist";
	}

	@Override
	public String pidnumcheck(String pidnum) throws Exception {
		Patient patient= patientDao.selectPatientByPidnum(pidnum);
		if(patient == null)
			return "notexist";
		
		return "exist";
	}
	
	@Override
	public Patient myInfo(String pidnum) throws Exception {
		return patientDao.selectPatientByPidnum(pidnum);
	}

	@Override

	public void modiProfile(Patient patient) throws Exception {
		
		System.out.println("Service ----------------");
		System.out.println(patient.getPname());
		System.out.println(patient.getPtel());
		System.out.println(patient.getPemail());
		System.out.println(patient.getPpassword());
		System.out.println(patient.getProadaddress());
		System.out.println(patient.getPidnum());
		
		patientDao.updatePatient(patient);

	}

	@Override
	public void leavePatient(String pidnum) throws Exception {

		patientDao.deletePatient(pidnum);
	}

	@Override
	public void patientRemove(String pname) throws Exception {
		patientDao.deletePatient(pname);

	}

	@Override
	public void patientReserve(Patient patient) throws Exception {
		patientDao.insertPatient(patient);
	}
	
	@Override
	public Patient selectPatientByname(String pname) throws Exception {
		return patientDao.selectPatientByname(pname);
	}
	
	@Override
	public List<Patient> patientListBypidnum(String pidnum) throws Exception {
		return patientDao.patientListBypidnum(pidnum);
	}

	@Override
	public List<Map<String, Object>> famList(String pidnum) throws Exception {
		
		return patientDao.selecetMyFamily(pidnum);
	}

	@Override
	public String addFam(Patient patient, String pidnum) throws Exception {
		if(!(patient.getPpidnum().equals(pidnum))) {
			patientDao.addFamily(patient);
			return "can"; 
		}
		return "cant";
		
	}

	@Override
	public void famDelete(String pname) throws Exception {
		
		
		ReservationDao resDao = new ReservationDaoImpl();
		List<Object> resList = resDao.selectResByName(pname);
		if(resList != null) { // 탈퇴하려는 사람의 이름으로 예약 조회했을 때 있을 경우 
			List<Integer> idList = resDao.selectIdByName(pname); //예약 번호들을 찾아내서 list에 담는다 
			for(int i = 0; i<idList.size(); i++) {
				System.out.println("idList : "+idList.get(i));
				resDao.updateStatusCuzQuit((Integer)idList.get(i));  //찾아낸 id들을 이용하여  해당 예약들의 상태를 변경 시킨
			}
			// 상태를 변경 시킨 후 회원 상태 변경 과정 
			patientDao.deleteFamily(pname); // 이후 회원의 상태를 탈퇴로 변경
		}
		
		patientDao.deleteFamily(pname); 
		
	}

	@Override
	public void famUpdate(Patient patient) throws Exception {
		System.out.println("ServiceImpl -----------");
		System.out.println("pname : " + patient.getPname());
		System.out.println("ptel : " + patient.getPtel());
		System.out.println("Proadaddress : " + patient.getProadaddress());
		System.out.println("pidnum : " + patient.getPidnum());
		patientDao.famInfoUpdate(patient);
		
	}

}