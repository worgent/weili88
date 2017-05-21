package base.listener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 实现org.springframework.context.ApplicationContextAware接口
 * 来让Spring在启动的时候为我们注入ApplicationContext对象.
 * User: liuwentao@kongzhong.com
 * Time: 12-6-27 下午1:42
 */
public class MyApplicationContextAware implements ApplicationContextAware {
    private static ApplicationContext context;//声明一个静态变量保存

    public void setApplicationContext(ApplicationContext contex) throws BeansException {
        this.context = contex;

        System.out.println("MyApplicationContextAware 系统启动....");
    }

    public static ApplicationContext getContext() {
        return context;
    }

    public static Object getBean(String s){
        ApplicationContext applicationContext = getContext();
        return applicationContext.getBean(s);
    }
}