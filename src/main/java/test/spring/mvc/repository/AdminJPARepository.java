package test.spring.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.entity.Member_basicEntity;

public interface AdminJPARepository extends JpaRepository<Member_basicEntity, String>{
	@Transactional
	@Modifying
	@Query(value="update member_basic set "
			+ "name=:#{#mb.name},"
			+ "email=:#{#mb.email},"
			+ "status=:#{#mb.status}, "
			+ "nic=:#{#mb.nic} "
			+ " where id=:#{#mb.id} ",nativeQuery=true)
	public int up_mem_basic(@Param("mb") Member_basicDTO mb);
	
	@Query(value="SELECT COUNT(*) FROM member_basic WHERE nic = :nic", nativeQuery=true)
	public int NicCheck(@Param("nic")String nic);
}