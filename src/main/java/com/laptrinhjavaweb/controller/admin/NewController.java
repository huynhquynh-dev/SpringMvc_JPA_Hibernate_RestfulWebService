package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.dto.NewDto;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller(value = "newControllerOfAdmin")
@RequestMapping(value = "/quan-tri")
public class NewController {

    @Autowired
    private INewService newService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private MessageUtils messageUtils;

    @RequestMapping(value = "/bai-viet/danh-sach", method = RequestMethod.GET)
    public String showList(Model model, @RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
        NewDto newDto = new NewDto();
        newDto.setPage(page);
        newDto.setLimit(limit);
        Pageable pageable = new PageRequest(page - 1, limit);
        newDto.setListResult(newService.findAll(pageable));
        newDto.setTotalItem((int) newService.getTotalItem());
        newDto.setTotalPage((int) Math.ceil((double) newDto.getTotalItem()/newDto.getLimit()));
        getMessage(model, request);
        model.addAttribute("model", newDto);
        return "admin/new/list" ;
    }

    @RequestMapping(value = "/bai-viet/chinh-sua", method = RequestMethod.GET)
    public String editNew(Model model, @RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
        NewDto newDto = new NewDto();
        if(id != null) {
            newDto = newService.findById(id);
        }
        getMessage(model, request);
        model.addAttribute("model", newDto);
        model.addAttribute("categories", categoryService.findAll());
        return "admin/new/edit";
    }

    private void getMessage(Model model, HttpServletRequest request) {
        if(request.getParameter("message") != null) {
            Map<String, String> message = messageUtils.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }
    }
}
