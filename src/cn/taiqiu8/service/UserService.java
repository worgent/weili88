package cn.taiqiu8.service;

import cn.taiqiu8.model.User;
import cn.taiqiu8.model.UserAssist;
import cn.taiqiu8.model.UserCustomer;
import org.springframework.stereotype.Service;

/**
 * Created by worgen on 2015/8/3.
 */
@Service("userService")
public interface UserService {
    public User selectById(int id);

    public UserCustomer getUserCustomer(int userId);

    public UserAssist getUserAssist(int userId);


}
