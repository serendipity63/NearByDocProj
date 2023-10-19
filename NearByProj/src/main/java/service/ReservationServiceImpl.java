package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ReservationDao;
import dao.ReservationDaoImpl;
import dto.Hospital;
import dto.Patient;
import dto.Reservation;
import util.PageInfo;

public class ReservationServiceImpl implements ReservationService{
	
	private ReservationDao resDao;

	public ReservationServiceImpl() {
		resDao = new ReservationDaoImpl();
	}

	@Override
	public List<Map<String, Object>> showReservation(String pidnum) throws Exception {
		
		return resDao.selectMyReservation(pidnum);
	}
	@Override
	public Map<String,Object> selectAllResBycomnum(String comnum,Integer page) throws Exception {
		PageInfo pageInfo = new PageInfo();
		Integer resCount = resDao.selectResCount(comnum);
		int maxPage = (int) Math.ceil((double) resCount / 10);
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
		
		List<Reservation> selectallres = new ArrayList<>();
		selectallres= resDao.selectAllResBycomnum(comnum);
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("selectallres", selectallres);
		return map;
	}
	@Override
	public Map<String, Object> detailRes(Integer id) throws Exception {
		
		
		// 리뷰 번호와 주민등록 번호로 예약 상세 조회
		
		
		//리뷰 번호로 주민등록 번호 조회
		String pidnum = resDao.findById(id);
		System.out.println("Service---------------");
		System.out.println(id);
		System.out.println(pidnum);
		
		return resDao.selectMyDetailReservation(id, pidnum);
	}
	

	@Override
	public Map<String, Object> todayResListByPage(Integer page) throws Exception {
	
	PageInfo pageInfo = new PageInfo();
	Integer reservationCount = resDao.selectReservationCount();
	int maxPage = (int) Math.ceil((double) reservationCount / 10); 
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
	List<Map<String, Object>> reservationList = resDao.selectTodayReservation(row - 1);

	Map<String, Object> map = new HashMap<>();
	map.put("pageInfo", pageInfo);
	map.put("reservationList", reservationList);
	return map;
}

	@Override
	public Map<String, Object> hrecordSearch(String type, String keyword, Integer page) throws Exception {
		Map<String, Object> param = new HashMap<>();

		param.put("type", type);
		param.put("keyword", keyword);
		PageInfo pageInfo = new PageInfo();
		int reservationCount = resDao.searchHRecordCount(param);
		int maxPage = (int) Math.ceil((double) reservationCount / 10); 
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
		List<Reservation> reservationList = resDao.searchHRecordList(param);

		map.put("type", type);
		map.put("keyword", keyword);
		map.put("hrecordList", reservationList);
		return map;
	}
	
	@Override
	public List<String> timelist(Hospital hospital, String date) throws Exception {
		List<String> timelist = new ArrayList<>();
		String clinic = hospital.getClinic();
		String lunch = hospital.getLunch();
		int scH = Integer.parseInt(clinic.substring(0, 2));
		int scM = Integer.parseInt(clinic.substring(3, 5));
		int ecH = Integer.parseInt(clinic.substring(8, 10));
		int ecM = Integer.parseInt(clinic.substring(11, 13));
		int slH = Integer.parseInt(lunch.substring(0, 2));
		int slM = Integer.parseInt(lunch.substring(3, 5));
		int elH = Integer.parseInt(lunch.substring(8, 10));
		int elM = Integer.parseInt(lunch.substring(11, 13));
		while (true) {
			String hour = Integer.toString(scH);
			if (hour.length() == 1) {
				hour = "0" + hour;
			}
			String min = Integer.toString(scM);
			if (min.length() == 1) {
				min = "0" + min;
			}
			timelist.add(hour + ":" + min);

			scM += 30;
			if (scM >= 60) {
				scH += 1;
				scM -= 60;
			}

			if (scH >= slH && scM >= slM) {
				break;
			}

		}
		while (true) {
			String hour = Integer.toString(elH);
			if (hour.length() == 1) {
				hour = "0" + hour;
			}
			String min = Integer.toString(elM);
			if (min.length() == 1) {
				min = "0" + min;
			}
			timelist.add(hour + ":" + min);

			elM += 30;
			if (elM >= 60) {
				elH += 1;
				elM -= 60;
			}

			if (elH >= ecH && elM >= ecM) {
				break;
			}
		}
		if(date !=null) {
			List<String> restimelist = new ArrayList<>();
			Map<String, String> param = new HashMap<>();
			param.put("date", date);
			param.put("comnum", hospital.getComnum());
			restimelist = resDao.resTimeList(param);
			for(String t : restimelist) {
				timelist.remove(t);
			}
		}
		return timelist;
	}
	@Override
	public void insertReservation(Reservation reservation) throws Exception {
		resDao.insertReservation(reservation);
	}

	@Override
	public Map<String, Object> resAllSearch(String type, String keyword, Integer page, String sdate, String edate, String comnum)
			throws Exception {
		Map<String, Object> param = new HashMap<>();
		String type2;
		if(type.equals("환자명")) {
			type2="pname";
		} else {
			type2="pidnum";
		}
		
		
		param.put("type", type2);
		param.put("keyword", keyword);
		param.put("sdate", sdate);
		param.put("edate", edate);
		param.put("comnum", comnum);
		
		PageInfo pageInfo = new PageInfo();
		int resCount = resDao.searchAllResCount(param);
		int maxPage = (int)Math.ceil((double)resCount/10);
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage=maxPage;
		if(page>maxPage) page=maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1;	//현재 페이지의 시작 row
		param.put("row", row-1);
		List<Reservation> resList = resDao.searchAllResList(param);
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("resList", resList);
		map.put("type", type);
		map.put("keyword", keyword);
		
		return map;
	}

	@Override
	public void resUpdate(Reservation res) throws Exception {
		resDao.statusUpdate(res);
		
	}
	
	@Override
	public void updateComment(Reservation res) throws Exception {
		resDao.commentUpdate(res);
		
	}
	
	/*예약 환자 정보*/

	@Override
	public Map<String, Object> patientResListSearch(String type, String keyword, Integer page) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);

		PageInfo pageInfo = new PageInfo();

		Map<String, Object> map = new HashMap<>();
		
		Integer resCount;
		if(type.equals("all") || keyword==null || keyword.trim().equals("")) { //전체 예약 환자 조회
			resCount = resDao.selectAllReservationCount();
		} else { //조건별 예약환자 조회
			resCount = resDao.searchReservationCount(param);
		}
		
		int maxPage = (int) Math.ceil((double) resCount / 10); // ceil 반올림 floor 반내림
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

		map.put("pageInfo", pageInfo);
		if (page == 0) {
			return map;
		}

		int row = (page - 1) * 10 + 1; // 현재 페이지의 시작 row

		List<Map<String, Object>> resList;
		if(type.equals("all") || keyword==null || keyword.trim().equals("")) { //전체 예약 환자 조회
			resList = resDao.selectAllReservationList(row-1);
		} else { //조건별 예약환자 조회
			param.put("row", row - 1);
			resList = resDao.searchReservationList(param);
		}

		map.put("type", type);
		map.put("keyword", keyword);
		map.put("patientresList", resList);
		return map;
	}
	
	
	

	

	
}
