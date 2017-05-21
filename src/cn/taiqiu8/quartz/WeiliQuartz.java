package cn.taiqiu8.quartz;

import base.SystemGlobal;
//import cn.taiqiu8.service.AdOrderService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * User: liuwentao
 * Time: 15-1-30 下午3:20
 */
@Component
public class WeiliQuartz {
    public final Log log = LogFactory.getLog(WeiliQuartz.class);
    @Autowired
//    private AdOrderService adOrderService;

    @Scheduled(cron = "0 01 16 ? * *")
    public synchronized void test() {
        int diffDay = SystemGlobal.getIntPreference("system.close.diffDay",3);

        log.info("doClose 定时任务执行了: diffDay=" +diffDay);
//        adOrderService.doClose(diffDay);
        log.info("doClose 定时任务执行完了: diffDay=" +diffDay);
    }

}
