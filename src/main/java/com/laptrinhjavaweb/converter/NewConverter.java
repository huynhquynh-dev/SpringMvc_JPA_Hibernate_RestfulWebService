package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.NewDto;
import com.laptrinhjavaweb.entity.NewEntity;
import org.springframework.stereotype.Component;

@Component
public class NewConverter {

    public NewDto toDto(NewEntity entity) {
        NewDto dto = new NewDto();
        dto.setId(entity.getId());
        dto.setTitle(entity.getTitle());
        dto.setShortDescription(entity.getShortDescription());
        dto.setContent(entity.getContent());
        dto.setThumbnail(entity.getThumbnail());
        dto.setCategoryCode(entity.getCategory().getCode());
        return dto;
    }

    public NewEntity toEntity(NewDto dto) {
        NewEntity entity = new NewEntity();
        entity.setTitle(dto.getTitle());
        entity.setShortDescription(dto.getShortDescription());
        entity.setContent(dto.getContent());
        entity.setThumbnail(dto.getThumbnail());
        return entity;
    }

    public NewEntity toEntity(NewEntity entity, NewDto dto) {
        entity.setTitle(dto.getTitle());
        entity.setShortDescription(dto.getShortDescription());
        entity.setContent(dto.getContent());
        entity.setThumbnail(dto.getThumbnail());
        return entity;
    }
}
