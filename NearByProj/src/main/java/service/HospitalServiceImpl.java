package service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import dao.HospitalDao;
import dao.HospitalDaoImpl;
import dto.Hospital;
import dto.Review;

public class HospitalServiceImpl implements HospitalService {

	static final double EARTH_RADIUS = 6371;

	private HospitalDao hospitalDao;

	@Override
	public Hospital login(String comnum, String hpassword) throws Exception {
		Hospital hospital = hospitalDao.selectHospital(comnum);
		if (hospital == null)
			throw new Exception("사업자등록번호를 잘못 입력하셨습니다 다시 로그인해주세요");
		if (hospital.getHpassword().equals(hpassword) == false)
			throw new Exception("비밀번호를 잘못 입력하셨습니다 다시 로그인해주세요");
		return hospital;
	}

	public HospitalServiceImpl() {
		hospitalDao = new HospitalDaoImpl();
	}

	@Override
	public void hospitaljoin(Hospital hospital) throws Exception {
		Hospital shospital = hospitalDao.selectHospital(hospital.getComnum());
		if (shospital != null)
			throw new Exception("이미 가입된 사업자등록번호가 있습니다 로그인해주세요");
		hospitalDao.insertHospital(hospital);

	}

	@Override
	public String comnumcheck(String comnum) throws Exception {
		Hospital hospital = hospitalDao.selectHospital(comnum);
		if (hospital == null)
			return "notexist";
		return "exist";
	}

	@Override
	public List<Hospital> hospitalList(String department, String lat, String lon) throws Exception {
		List<Hospital> hospitalList = hospitalDao.selectHospitalList(department);
		for (Iterator<Hospital> iterator = hospitalList.iterator(); iterator.hasNext();) {
			Hospital h = iterator.next();
			double dlat = Double.parseDouble(lat);
			double dlon = Double.parseDouble(lon);
			double hlat = h.getLat().doubleValue();
			double hlon = h.getLon().doubleValue();
			double dis = getDistance(hlat, hlon, dlat, dlon);
			if (dis > 5000.0) {
				iterator.remove();
			}
		}
		return hospitalList;
	}

	@Override
	public Hospital selectHospitalBycomnum(String comnum) throws Exception {
		return hospitalDao.selectHospital(comnum);
	}

	public static double getDistance(double lat1, double lon1, double lat2, double lon2) {
		double dLat = Math.toRadians(lat2 - lat1);
		double dLon = Math.toRadians(lon2 - lon1);

		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(lat1))
				* Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double d = EARTH_RADIUS * c * 1000; // Distance in m
		return d;
	}



	@Override
	public void hospitalModify(Hospital hospital) throws Exception {
		hospitalDao.updateHospital(hospital);

	}

	@Override
	public Hospital hospitalInfo(String comnum) throws Exception {
		return hospitalDao.selectHospital(comnum);
	}
	
	@Override
	public void updateGrade(String comnum) throws Exception {
		String grade="";
		HospitalService hospitalservice = new HospitalServiceImpl();
		Hospital hospital = hospitalservice.selectHospitalBycomnum(comnum);
		Integer cnt = hospital.getHreviewcnt();
		ReviewService reviewservice = new ReviewServiceImpl();
		List<Map<String,Object>> reviewlist = reviewservice.reviewListByHos(comnum);
		Integer sumStar = 0;
		for(Map<String,Object> r : reviewlist ) {
			sumStar += Integer.parseInt((String)r.get("star"));
		}
		double gra = Math.round((double)sumStar/cnt*10.0)/10.0;
		grade=Double.toString(gra);
		Map<String,String> param = new HashMap<>();
		param.put("grade", grade);
		param.put("comnum", comnum);
		hospitalDao.updateGrade(param);
	}
}

