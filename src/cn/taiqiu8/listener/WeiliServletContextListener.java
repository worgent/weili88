package cn.taiqiu8.listener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletContextEvent;

//import cn.taiqiu8.service.DictionaryService;
//import cn.taiqiu8.service.SettingService;
//import cn.taiqiu8.service.UserService;

/**
 * User: liuwentao
 * Time: 15-1-16 下午5:29
 */
public class WeiliServletContextListener implements javax.servlet.ServletContextListener {
    private Log log = LogFactory.getLog(WeiliServletContextListener.class);
//    private DictionaryService dictionaryService = null;
//    private UserService userService = null;
//    private SettingService settingService = null;

    public void contextInitialized(ServletContextEvent event) {
//        dictionaryService = (DictionaryService) MyApplicationContextAware.getBean("dictionaryService");
//         userService = (UserService) MyApplicationContextAware.getBean("userService");
//        settingService = (SettingService) MyApplicationContextAware.getBean("settingService");

        log.info("初始化数据开始");
        this.initSetting();

        this.initUser();

        this.initDictionary();
        log.info("初始化数据结束");
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

    private void initSetting(){
//        Setting setting = settingService.getSetting();
//       if(setting ==null){
//            setting = new Setting();
//            setting.setMinPriceTiepian(new BigDecimal(10.0));
//            setting.setMinPriceRuanwen(new BigDecimal(100.0));
//            setting.setMinZhifu(new BigDecimal(100.0));
//            setting.setMinPriceWxht(10);
//            setting.setMaxSxf(new BigDecimal(1000));
//            setting.setMinSxf(new BigDecimal(100));
//            setting.setPercentSxf(new BigDecimal(0.1));
//            setting.setJifenZhuceGgz(1000);
//            setting.setJifenZhuceWxz(500);
//            settingService.insert(setting);
//        }
    }

    private void initUser() {
//        List<User> userList = userService.selectSystemUser();
//        if (!userList.isEmpty()) {
//            return;
//        }
//        log.info("需要初始化用户...");
//
//        //初始化系统用户
//        User user1 = new User();
//        user1.setType(UserTypeEnum.SYSTEM.getValue());
//        user1.setChineseName(SystemUserEnum.ALL.getLabel());
//        user1.setEnglishName("all");
//
//        userService.insert(user1);
//
//        User user2 = new User();
//        user2.setType(UserTypeEnum.SYSTEM.getValue());
//        user2.setChineseName(SystemUserEnum.GGZ.getLabel());
//        user2.setEnglishName("all_ggz");
//
//        userService.insert(user2);
//
//        User user3 = new User();
//        user3.setType(UserTypeEnum.SYSTEM.getValue());
//        user3.setChineseName(SystemUserEnum.WXZ.getLabel());
//        user3.setEnglishName("all_wxz");
//        userService.insert(user3);
//
//        User user4 = new User();
//        user4.setType(UserTypeEnum.SYSTEM.getValue());
//        user4.setChineseName(SystemUserEnum.GLY.getLabel());
//        user4.setEnglishName("all_gly");
//        userService.insert(user4);

        //初始化测试用户
//        this.initTestUserGgz();
//        this.initTestUserWxz();
        this.initTestUserAdmin();
    }

    private void initTestUserGgz() {
//        for (int i = 0; i < 10; i++) {
//            User user = new User();
//            user.setType(UserTypeEnum.GGZ.getValue());
//            user.setChineseName("测试广告主_" + i);
//            user.setEnglishName("test_ggz_" + i);
//            user = userService.insert(user);
//            Integer userId = user.getId();
//
//            UserGgz userGgz = new UserGgz();
//            userGgz.setUserId(userId);
//            userGgz.setLinkMan("联系人_" + i);
//
//            userGgz.setJifenInput(9999999);
//            userGgz.setJifenOutput(0);
//            userGgz.setJifenOutputLock(0);
//
//            userGgz.setMoneyInput(new BigDecimal(1000000));
//            userGgz.setMoneyOutput(BigDecimal.ZERO);
//            userGgz.setMoneyOutputLock(BigDecimal.ZERO);
//
//            userService.insert(userGgz);
//        }
    }

    private void initTestUserWxz() {
//        for (int i = 0; i < 10; i++) {
//            User user = new User();
//            user.setType(UserTypeEnum.WXZ.getValue());
//            user.setChineseName("测试微信主_" + i);
//            user.setEnglishName("test_wxz_" + i);
//            user = userService.insert(user);
//            Integer userId = user.getId();
//
//            UserWxz userWxz = new UserWxz();
//            userWxz.setUserId(userId);
//            userWxz.setNumFans(8000);
//
//            userWxz.setJifenInput(9999999);
//            userWxz.setJifenOutput(0);
//            userWxz.setJifenOutputLock(0);
//
//            userWxz.setMoneyInput(new BigDecimal(100));
//            userWxz.setMoneyOutput(BigDecimal.ZERO);
//            userWxz.setMoneyOutputLock(BigDecimal.ZERO);
//
//            userWxz.setIndustryId(0);
//            userWxz.setAreaId(0);
//            userWxz.setZfbAccount("a_" + i + "@qq.com");
//
//            userService.insert(userWxz);
//        }
    }

    private void initTestUserAdmin() {
////        for (int i = 0; i < 10; i++) {
//            User user = new User();
//            user.setType(UserTypeEnum.GLY.getValue());
//            user.setChineseName("超级管理员");
//            user.setEnglishName("weili_admin");
//            user = userService.insert(user);
//            Integer userId = user.getId();
//
//            UserAdmin userAdmin = new UserAdmin();
//            userAdmin.setUserId(userId);
//            userAdmin.setRoleCommon(RoleEnum.YES.getValue());
//            userAdmin.setRoleFinancial(RoleEnum.NO.getValue());
//            userAdmin.setRoleSuper(RoleEnum.NO.getValue());
//            userService.insert(userAdmin);
////        }
    }

    private void initDictionary() {
//        List<Dictionary> list = dictionaryService.selectAll();
//        if (!list.isEmpty()) {
//            return;
//        }
//        log.info("需要初始化字典...");
//
//        //初始化
//        String infoNames = "公告,通知,新闻";
//        initDictionaray(infoNames, DictionaryTypeEnum.CMS_CONTENT.getValue());
//
//        String photoNames = "首页,频道A,频道B";
//        initDictionaray(photoNames, DictionaryTypeEnum.CMS_PHOTO.getValue());
//
//        String areaNames = "辽宁,吉林,黑龙江";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_DONGBEI.getValue());
//        areaNames = "河北,山西,内蒙古,北京,天津";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_HUABEI.getValue());
//        areaNames = "山东,江苏,安徽,浙江,福建,江西,上海";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_HUADONG.getValue());
//        areaNames = "河南,湖北,湖南";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_HUAZHONG.getValue());
//        areaNames = "广东,广西,海南";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_HUANAN.getValue());
//        areaNames = "云南,贵州,四川,西藏";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_XINAN.getValue());
//        areaNames = "新疆,陕西,宁夏,青海,甘肃";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_XIBEI.getValue());
//        areaNames = "香港,澳门,台湾";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_GANGAOTAI.getValue());
//        areaNames = "美国,英国,法国,德国,意大利,加拿大,澳大利亚,新西兰,俄罗斯,日本,韩国";
//        initDictionaray(areaNames, DictionaryTypeEnum.AREA_GUOWAI.getValue());
//
//        String industryNames = "新闻,体育,科技,小说,军事,财经,汽车,国际,房产,女性,综合,文化,网络媒体,电视媒体,杂志报刊,IT";
//        initDictionaray(industryNames, DictionaryTypeEnum.INDUSTRY_ZXYD.getValue());
//
//        industryNames = "医疗,购物,美食,育儿,时尚,旅游,健康,职场,家居,创意,宠物,银行,理财,教育,创业,其它";
//        initDictionaray(industryNames, DictionaryTypeEnum.INDUSTRY_RCSH.getValue());
//
//        industryNames = "社区,八卦,游戏,图片,娱乐,语录,明星,动漫,音乐,搞笑,美女,星座,测试,电影,视频,电视剧";
//        initDictionaray(industryNames, DictionaryTypeEnum.INDUSTRY_YYYL.getValue());
//
//        industryNames = "公共名人,政府机构,公益组织,企业品牌,事业单位,私人交友";
//        initDictionaray(industryNames, DictionaryTypeEnum.INDUSTRY_QT.getValue());
    }

    private void initDictionaray(String names, short type) {
//        String[] nameArray = BaseStringUtil.getArray(names);
//        int i = 1;
//        for (String name : nameArray) {
//            Dictionary dictionary = new Dictionary();
//            dictionary.setType(type);
//            dictionary.setStatus(StatusEnum.ENABLE.getValue());
//            dictionary.setSeq(i++);
//            dictionary.setName(name);
//            dictionaryService.insert(dictionary);
//        }
    }
}
