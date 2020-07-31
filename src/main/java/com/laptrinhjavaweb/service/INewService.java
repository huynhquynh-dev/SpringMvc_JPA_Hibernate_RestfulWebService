package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.NewDto;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface INewService {

	List<NewDto> findAll(Pageable pageable);

	long getTotalItem();

	NewDto findById(long id);

	NewDto save(NewDto newDto);

	void delete(long[] ids);

//	NewDto insert(NewDto newDto);
//
//	NewDto update(NewDto updateNew);
}
