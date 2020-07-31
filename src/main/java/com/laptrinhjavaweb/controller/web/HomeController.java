package com.laptrinhjavaweb.controller.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public String homePage() {
        return "web/home";
    }

    @RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

//    Nếu thoát thì truyền các thông tin session vào và gọi hàm logout của Security để thao tác xóa các Session
    @RequestMapping(value = "/thoat", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication !=  null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/trang-chu";
    }

//    Hàm xử lí nếu không có quyền truy cập vào web
    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String accessDenied() {
        return "redirect:/dang-nhap?accessDenied";
    }
}
