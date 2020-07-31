package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

//    Hàm này chạy sau khi submit vào trang login. Dữ liệu được load vào để xác thực tài khoản
    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
//        Kiểm tra tồn tại tài khoản trong CSDL hay không
        UserEntity userEntity = userRepository.findOneByUsernameAndStatus(name, SystemConstant.ACTIVE_STATIC);
//        Nếu không có thì xuất lỗi
        if (userEntity == null) {
            throw new UsernameNotFoundException("User not found");
        }
//        Nếu xác thực thành công thì đến bước này
//        Tiếp tục đưa dữ liệu thông tin vào security để duy trì thông tin trong hệ thống sau khi login
        List<GrantedAuthority> authorities = new ArrayList<>();
//        Lấy ra và Chuyển danh sách quyền từ User đã được xác thực vào hệ thống
        for (RoleEntity roleEntity: userEntity.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(roleEntity.getCode()));
        }
//       Khởi tạo đối tượng để đưa dữ liệu vào, đối tượng có thể là User của Secutity hoặc kế thừa từ Class đó.
        MyUser myUser = new MyUser(userEntity.getUsername(), userEntity.getPassword(),
                true, true, true, true, authorities);
        myUser.setFullName(userEntity.getFullName());
        return myUser;
    }
}
