package service;

import java.util.List;
import java.util.Map;

import dao.ReservationDao;
import dao.ReservationDaoImpl;

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

}
