package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "homeControllerOfAdmin")
@RequestMapping(value = "/quan-tri")
public class HomeController {

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public String homePage() {
        return "admin/home";
    }
}
