package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.PatientDao;
import dto.Patient;
import util.PageInfo;

public class PatientServiceImpl implements PatientService {

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
		List<Patient> boardList = patientDao.searchPatientList(param);

		map.put("type", type);
		map.put("keyword", keyword);
		map.put("boardList", boardList);
		return map;

	}

}
