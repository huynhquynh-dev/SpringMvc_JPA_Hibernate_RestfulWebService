package com.laptrinhjavaweb.dao;

import com.laptrinhjavaweb.model.NewModel;

import java.util.List;

public interface INewDAO extends GenericDAO<NewModel> {

	List<NewModel> findAll();
}
