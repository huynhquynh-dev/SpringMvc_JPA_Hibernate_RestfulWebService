package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.NewDto;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.INewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewService implements INewService {

	@Autowired
	private NewRepository newRepository;

	@Autowired
	private NewConverter newConverter;

	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<NewDto> findAll(Pageable pageable) {
		List<NewDto> newDtos = new ArrayList<>();
		List<NewEntity> entities = newRepository.findAll(pageable).getContent();
		for (NewEntity entity : entities) {
			NewDto newDto = newConverter.toDto(entity);
			newDtos.add(newDto);
		}
		return newDtos;
	}

	@Override
	public long getTotalItem() {
		return newRepository.count();
	}

	@Override
	public NewDto findById(long id) {
		NewEntity entity = newRepository.findOne(id);
		return newConverter.toDto(entity);
	}

	@Override
	@Transactional
	public NewDto save(NewDto newDto) {
		CategoryEntity categoryEntity = categoryRepository.findOneByCode(newDto.getCategoryCode());
		NewEntity newEntity = new NewEntity();
		if (newDto.getId() != null){
			NewEntity oldEntity = newRepository.findOne(newDto.getId());
			oldEntity.setCategory(categoryEntity);
			newEntity = newConverter.toEntity(oldEntity,newDto);
		}
		else {
			newEntity = newConverter.toEntity(newDto);
			newEntity.setCategory(categoryEntity);
		}
		return newConverter.toDto(newRepository.save(newEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (Long item: ids) {
			newRepository.delete(item);
		}
	}

//	@Override
//	@Transactional
//	public NewDto insert(NewDto newDto) {
//		CategoryEntity categoryEntity = categoryRepository.findOneByCode(newDto.getCategoryCode());
//		NewEntity entity = newConverter.toEntity(newDto);
//		entity.setCategory(categoryEntity);
//		return newConverter.toDto(newRepository.save(entity));
//	}
//
//	@Override
//	@Transactional
//	public NewDto update(NewDto updateNew) {
//		NewEntity oldEntity = newRepository.findOne(updateNew.getId());
//		CategoryEntity categoryEntity = categoryRepository.findOneByCode(updateNew.getCategoryCode());
//		oldEntity.setCategory(categoryEntity);
//		NewEntity updateEntity = newConverter.toEntity(oldEntity,updateNew);
//		return newConverter.toDto(newRepository.save(updateEntity));
//	}
}
