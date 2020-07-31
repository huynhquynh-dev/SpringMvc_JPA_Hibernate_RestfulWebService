package com.laptrinhjavaweb.util;

import com.laptrinhjavaweb.dto.MyUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.ArrayList;
import java.util.List;

public class SecurityUtils {

//    Hàm lấy thông tin User từ hệ thống sau khi lưu vào hệ thống ở bước xác thực tài khoản
    public static MyUser getPrincipal() {
        return (MyUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

//    Hàm lấy ra danh sách các Role có quyền truy cập vào các trang web thuộc User đăng nhập
//    thông qua trang login sau khi xác thực tài khoản thành công
    @SuppressWarnings("unchecked")
    public static List<String> getAuthorities() {
        List<String> results = new ArrayList<>();
        List<GrantedAuthority> authorities = (List<GrantedAuthority>) (SecurityContextHolder.getContext()
                                                                                            .getAuthentication()
                                                                                            .getAuthorities());
        for (GrantedAuthority authority: authorities) {
            results.add(authority.getAuthority());
        }
        return results;
    }
}
