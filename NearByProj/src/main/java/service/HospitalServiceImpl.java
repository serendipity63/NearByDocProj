package service;

import java.util.List;

import dao.HospitalDao;
import dao.HospitalDaoImpl;
import dto.Hospital;

public class HospitalServiceImpl implements HospitalService {

   private HospitalDao hospitalDao;
   
   public HospitalServiceImpl() {
      hospitalDao= new HospitalDaoImpl();
   }

   @Override
   public void hospitalModify(Hospital hospital) throws Exception {
      hospitalDao.updateHospital(hospital);
      
   }
   @Override
   public Hospital hospitalHinfo(Integer num) throws Exception {
      return null;
   }
   @Override
   public Hospital login(String comnum, String hpassword) throws Exception {
         Hospital hospital = hospitalDao.selectHospital(comnum);
         if (hospital == null)
            throw new Exception("사업자등록번호틀림");
         if (hospital.getHpassword().equals(hpassword) == false)
            throw new Exception("비밀번호 오류");
         return hospital;
      }


   @Override
   public void hospitaljoin(Hospital hospital) throws Exception {
      Hospital shospital = hospitalDao.selectHospital(hospital.getComnum());
      if (shospital != null)
         throw new Exception("사업자등록번호 중복오류");
      hospitalDao.insertHospital(hospital);

   }
   @Override
   public String comnumcheck(String comnum) throws Exception {
      Hospital hospital = hospitalDao.selectHospital(comnum);
      if(hospital==null)
         return "notexist";
      return "exist";
   }

   @Override
   public List<Hospital> hospitalList() throws Exception {   
	   return hospitalDao.selectHospitalList();
   }
   @Override
	public Hospital selectHospitalBycomnum(String comnum) throws Exception {
	   return hospitalDao.selectHospital(comnum);
	}
}

