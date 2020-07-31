package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.NewDto;
import com.laptrinhjavaweb.service.INewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "newAPIOfAdmin")
@RequestMapping("/api/new")
public class NewAPI {

    @Autowired
    private INewService newService;

    @PostMapping("")
    public NewDto createNew(@RequestBody NewDto newDto) {
        return newService.save(newDto);
    }

    @PutMapping("")
    public NewDto updateNew(@RequestBody NewDto updateDto) {
        return newService.save(updateDto);
    }

    @DeleteMapping("")
    public void deleteNew(@RequestBody long[] ids) {
        newService.delete(ids);
    }
}
