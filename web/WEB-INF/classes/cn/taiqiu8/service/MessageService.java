package cn.taiqiu8.service;

import cn.taiqiu8.model.Message;
import cn.taiqiu8.model.User;
import org.springframework.stereotype.Service;

/**
 * Created by worgen on 2015/8/3.
 */
@Service("messageService")
public interface MessageService {

    //系统管理员发送消息
    int sendSystemMessage(String title, String content);

    //用户阅读消息
    int readMessage(User u, Message m);


}
