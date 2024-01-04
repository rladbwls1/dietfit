package test.spring.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import test.spring.mvc.entity.Member_basicEntity;

public interface AdminJPARepository extends JpaRepository<Member_basicEntity, String>{

}
