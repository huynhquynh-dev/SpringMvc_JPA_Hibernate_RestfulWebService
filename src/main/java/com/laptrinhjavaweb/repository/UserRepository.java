package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {

    UserEntity findOneByUsernameAndStatus(String name, int status);
}
