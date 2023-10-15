package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ReservationDao;
import dao.ReservationDaoImpl;
import dto.Reservation;
import util.PageInfo;

public class ReservationServiceImpl implements ReservationService{
	
	private ReservationDao resDao;

	public ReservationServiceImpl() {
		resDao = new ReservationDaoImpl();
	}

	@Override
	public List<Map<String, Object>> showReservation(String pidnum) throws Exception {
		System.out.println("service" + pidnum);
		return resDao.selectMyReservation(pidnum);
	}

	@Override
	public Map<String, Object> reservationListByPage(Integer page) throws Exception {
	
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
	List<Reservation> reservationList = resDao.selectTodayReservation(row - 1);

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

}
