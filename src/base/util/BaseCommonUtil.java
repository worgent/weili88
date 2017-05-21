package base.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/**
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 上午10:24
 */
public class BaseCommonUtil {
    private static Log logger=LogFactory.getLog(BaseCommonUtil.class);

    /**
    * @Title:  CommonUtil.java
    * @Description: TODO( 这种反射方式可以将与model中处了get方法以外的所有方法排除，
    * 					静态变量也排除在外 )
    * @param :  @param obj
    * @param :  @return :
    * @return : Map<String,Object>
    * @throws :
    * @author: wangshaoxin
    * @date: 2012-3-26 下午07:15:44
    */
    public static Map<String, Object> beanToMap(Object obj)  {

        Map<String, Object> map = new HashMap<String, Object>();
        if(obj==null)
            return map;

        if(obj instanceof java.util.Map && obj !=null){
            map.putAll((Map)obj);
            return map;
        }

        Class clazz = null;
        Method method;
        clazz = obj.getClass();

        Method[] methods=clazz.getDeclaredMethods();
        try {
            for (int i = 0; i < methods.length; i++) {
                method = methods[i];
                String methodName=method.getName();
                if(methodName.contains("get")){
                    String fieldName=String.valueOf(methodName.charAt(3)).toLowerCase()+methodName.substring(4);

                    if (method.invoke(obj, null) != null && !"".equals(method.invoke(obj, null))) {

                        map.put(fieldName, method.invoke(obj, null));
                    }

                }else{
                    continue;
                }

            }
        } catch (Exception e) {
            logger.error(obj.getClass(),e);
        }


        Iterator it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            Object key = entry.getKey();
            Object value = entry.getValue();
        }
        return map;
    }



    /**
     * 解析bean 对象 封装成map
     * @param obj 对象
     * @return  Map对象
     * @throws NoSuchMethodException
     * @throws SecurityException
     * @throws Exception
     */
//	public static Map<String, Object> beanToMap(Object obj)  {
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		if(obj==null)
//			return map;
//
//		if(obj instanceof java.util.Map && obj !=null){
//			map.putAll((Map)obj);
//			return map;
//		}
//
//		Class clazz = null;
//		Method method;
//		String fieldNames[];
//		clazz = obj.getClass();
//		Field[] fields = clazz.getDeclaredFields();
//		fieldNames = new String[fields.length];
//		for (int i = 0; i < fields.length; i++) {
//			fieldNames[i] = fields[i].getName();
//		}
//		try {
//			for (int i = 0; i < fields.length; i++) {
//				if(fieldNames[i].equals("serialVersionUID")){
//					continue;
//				}
//				String methodName = "get"+ Character.toUpperCase(fieldNames[i].charAt(0))+ fieldNames[i].substring(1);
//				method = clazz.getMethod(methodName, new Class[] {});
//				if (method.invoke(obj, null) != null
//						&& !"".equals(method.invoke(obj, null))) {
//					map.put(fieldNames[i], method.invoke(obj, null));
//				}
//			}
//		} catch (Exception e) {
//			logger.error(obj.getClass(),e);
//		}
//		Iterator it = map.entrySet().iterator();
//		while (it.hasNext()) {
//			Map.Entry entry = (Map.Entry) it.next();
//			Object key = entry.getKey();
//			Object value = entry.getValue();
//		}
//		return map;
//	}

    /**
     * 去掉两边的","号
     * @param str
     * @return String
     */
    public   static String removeComma (String str ){
        if(str.length()>1){
            if(str.lastIndexOf("," , 0)>-1){
                str=str.substring(1,str.length());
            }
            if(str.lastIndexOf("," , str.length())>-1){
                str=str.substring(0,str.length()-1);
            }
        }
        return str;
    }


    /**
     * 创建N位随机号
     * @param n 位数
     * @return 随机号码
     */
    public static String  createFourRandom(int n){
        Random r = new Random();
        String rnum="";
        for (int i = 0; i < n; i++) {
            rnum+=r.nextInt(10);
        }
        return rnum;
    }

    //过滤特殊字符
    public static String StringFilter(String str) throws PatternSyntaxException {
        // 只允许字母和数字
        // String regEx = "[^a-zA-Z0-9]";
        // 清除掉所有特殊字符
        String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？\"]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.replaceAll("").trim();
    }

    /**
     * 判断字符串是否为空
     * @param str
     * @return
     */
    public static Boolean  valStringNull(String str){
        return (str == null || str.length() <= 0);
    }


    /**
     * @param args
     */
    public static void main(String[] args) {

    }
}
