package cn.taiqiu8.factory;

import cn.taiqiu8.model.User;

import cn.taiqiu8.model.UserAssist;
import cn.taiqiu8.model.UserCustomer;
import cn.taiqiu8.repository.UserRepository;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * User: liuwentao
 * Time: 15-1-16 上午11:40
 */
public class UserFactory {
    public static final Log log = LogFactory.getLog(UserFactory.class);
    private final static UserRepository repository = UserRepository.getInstance();

    //------------------------------------------read------------------------------

    /**
     * @param id 栏目Id
     * @return
     */
    public static User selectById(Integer id) {
        User user = null;
        try {
            user = repository.selectById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (user == null) {
            log.error("UserFactory not find user for id=" + id);
            user = new User();
        }
        return user;
    }

    public static UserCustomer getUserCustomer(int userId){
        UserCustomer userCustomer = null;
        try {
            userCustomer = repository.getUserCustomer(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userCustomer == null) {
            log.error("UserFactory not find userCustomer for userId=" + userId);
            userCustomer = new UserCustomer();
        }
        return userCustomer;
    }
    public static UserAssist getUserAssist(int userId){
        UserAssist userAssist = null;
        try {
            userAssist = repository.getUserAssist(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userAssist == null) {
            log.error("UserFactory not find userAssist for userId=" + userId);
            userAssist = new UserAssist();
        }
        return userAssist;
    }


//    public static UserAdmin getUserAdmin(int userId){
//        UserAdmin userAdmin = null;
//        try {
//            userAdmin = repository.getUserAdmin(userId);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        if (userAdmin == null) {
//            log.error("UserFactory not find userAdmin for userId=" + userId);
//            userAdmin = new UserAdmin();
//        }
//        return userAdmin;
//    }

    //------------------------------------------remove------------------------------

    /**
     * @param id
     */
    public static void removeById(Integer id) {
        if (id == null) {
            return;
        }
        repository.removeById(id);
    }

    /**
     * @param userId
     */
    public static void removeUserCustomer(int userId){
        repository.removeUserCustomer(userId);
    }

    /**
     * @param userId
     */
    public static void removeUserAssist(int userId){
        repository.removeUserAssist(userId);
    }

    /**
     * @param userId
     */
    public static void removeUserAdmin(int userId){
        repository.removeUserAdmin(userId);
    }


    //------------------------------------------private------------------------------

    /**
     * @param userIdList
     * @return
     */
    public static List<User> getList(List<Integer> userIdList) {
        List<User> list = new ArrayList<User>();
        if (userIdList == null) {
            return list;
        }

        for (Integer userId : userIdList) {
            if(userId==0){
                log.error(" getList(List<Integer> userIdList) userId=" + userId);
            }

            User user = selectById(userId);
            list.add(user);
        }
        return list;
    }

}
