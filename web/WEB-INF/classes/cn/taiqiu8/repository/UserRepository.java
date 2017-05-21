package cn.taiqiu8.repository;

import base.listener.MyApplicationContextAware;
import base.repository.BaseRepository;
import base.util.BaseIntUtil;
import cn.taiqiu8.model.User;

import cn.taiqiu8.model.UserAssist;
import cn.taiqiu8.model.UserCustomer;
import cn.taiqiu8.service.UserService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * User: liuwentao
 * Time: 15-1-16 上午11:26
 */
public class UserRepository extends BaseRepository {
    private static final Log log = LogFactory.getLog(UserRepository.class);

    private UserRepository() {
    }

    private static UserRepository instance = null;

    public static synchronized UserRepository getInstance() {
        if (instance == null) {
            instance = new UserRepository();
        }
        return instance;
    }

    @Override
    public String getCacheName() {
        return UserRepository.class.getSimpleName();
    }

    private UserService userService = (UserService) MyApplicationContextAware.getBean("userService");

    // 缓存的KEY值
    private final String KEY_BY_ID = "USER_KEY_BY_ID_";
    private final String KEY_CUSTOMER_BY_ID = "USER_KEY_CUSTOMER_BY_ID_";
    private final String KEY_ASSIST_BY_ID = "USER_KEY_ASSIST_BY_ID_";
    private final String KEY_ADMIN_BY_ID = "USER_KEY_ADMIN_BY_ID_";

    //------------------------------------------reuser------------------------------

    /**
     * 根据ID 从缓存中  取entity
     *
     * @param id
     * @return
     */
    public User selectById(Integer id) {
        if (BaseIntUtil.isBlank(id)) {
            return null;
        }
        String key = this.KEY_BY_ID + id;
        User user = (User) super.getCacheValue(key);
        if (user != null && BaseIntUtil.isBlank(user.getId())) {
            log.debug("++ find user from cache for key = " + key);
            return user;
        }
        log.debug("-- not find user from cache for key = " + key);

        user = userService.selectById(id);
        if (user == null) {
            user = new User();
        }else{
            this.setCacheValue(key, user);
        }
        return user;
    }

    public UserCustomer getUserCustomer(int userId){
        if (BaseIntUtil.isBlank(userId)) {
            return null;
        }
        String key = this.KEY_CUSTOMER_BY_ID + userId;
        UserCustomer userCustomer = (UserCustomer) super.getCacheValue(key);
        if (userCustomer != null && BaseIntUtil.isBlank(userCustomer.getId())) {
            log.debug("++ find user from cache for key = " + key);
            return userCustomer;
        }
        log.debug("-- not find user from cache for key = " + key);

        userCustomer = userService.getUserCustomer(userId);
        if (userCustomer == null) {
            userCustomer = new UserCustomer();
        }else{
            this.setCacheValue(key, userCustomer);
        }
        return userCustomer;
    }

    public UserAssist getUserAssist(int userId){
        if (BaseIntUtil.isBlank(userId)) {
            return null;
        }
        String key = this.KEY_ASSIST_BY_ID + userId;
        UserAssist userAssist = (UserAssist) super.getCacheValue(key);
        if (userAssist != null && BaseIntUtil.isBlank(userAssist.getId())) {
            log.debug("++ find user from cache for key = " + key);
            return userAssist;
        }
        log.debug("-- not find user from cache for key = " + key);

        userAssist = userService.getUserAssist(userId);
        if (userAssist == null) {
            userAssist = new UserAssist();
        }else{
            this.setCacheValue(key, userAssist);
        }
        return userAssist;
    }

//    public UserAdmin getUserAdmin(int userId){
//        if (BaseIntUtil.isBlank(userId)) {
//            return null;
//        }
//        String key = this.KEY_ADMIN_BY_ID + userId;
//        UserAdmin userAdmin = (UserAdmin) super.getCacheValue(key);
//        if (userAdmin != null && BaseIntUtil.isBlank(userAdmin.getId())) {
//            log.debug("++ find user from cache for key = " + key);
//            return userAdmin;
//        }
//        log.debug("-- not find user from cache for key = " + key);
//
//        userAdmin = userService.getUserAdmin(userId);
//        if (userAdmin == null) {
//            userAdmin = new UserAdmin();
//        }else{
//            this.setCacheValue(key, userAdmin);
//        }
//        return userAdmin;
//    }

    //------------------------------------------remove------------------------------

    /**
     * 清空栏目缓存
     *
     * @param id 栏目Id
     */
    public synchronized void removeById(Integer id) {
        String key = KEY_BY_ID + id;
        log.debug("** remove user from cache for key = " + key);
        super.removeCachedValue(key);
    }

    public synchronized void removeUserCustomer(int userId){
        String key = this.KEY_CUSTOMER_BY_ID + userId;
        log.debug("** remove user from cache for key = " + key);
        super.removeCachedValue(key);
    }

    public synchronized void removeUserAssist(int userId){
        String key = this.KEY_ASSIST_BY_ID + userId;
        log.debug("** remove user from cache for key = " + key);
        super.removeCachedValue(key);
    }

    public synchronized void removeUserAdmin(int userId){
        String key = this.KEY_ADMIN_BY_ID + userId;
        log.debug("** remove user from cache for key = " + key);
        super.removeCachedValue(key);
    }

    //------------------------------------------private------------------------------

    /**
     * @param userList
     * @return
     */
    private List<Integer> getIds(List<User> userList) {
        List<Integer> list = new ArrayList<Integer>();
        if (userList == null) {
            return list;
        }
        for (User user : userList) {
            list.add(user.getId());
        }
        return list;
    }

}
