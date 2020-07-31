package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.NewModel;

public class NewMapper implements RowMapper<NewModel> {

	@Override
	public NewModel mapRow(ResultSet resultSet) {

		NewModel newModel = new NewModel();
		try {
			newModel.setId(resultSet.getLong("id"));
			newModel.setTitle(resultSet.getString("title"));
			newModel.setCategoryId(resultSet.getLong("categoryid"));
			newModel.setContent((resultSet.getString("content")));
			newModel.setThumbnail(resultSet.getString("thumbnail"));
			newModel.setShortDescription(resultSet.getString("shortdescription"));
			newModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			newModel.setCreatedBy(resultSet.getString("createdby"));
			
			if(resultSet.getTimestamp("modifieddate") != null) {
				
				newModel.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			if(resultSet.getString("modifiedby") != null) {
				
				newModel.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return newModel;
		} catch (SQLException e) {			
			return null;
		}
	}
}
