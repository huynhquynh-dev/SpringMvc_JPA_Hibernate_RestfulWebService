package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.NewEntity;
import org.springframework.data.jpa.repository.JpaRepository;

// Khai báo class Entity và Kiểu dữ liệu của khóa chính trong class Entity
public interface NewRepository extends JpaRepository<NewEntity, Long> {

}
