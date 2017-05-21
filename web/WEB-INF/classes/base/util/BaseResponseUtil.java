package base.util;

import base.result.ResultConstant;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * User: liuwentao@kongzhong.com
 * Time: 12-10-11 下午3:30
 */
public class BaseResponseUtil {
    private static final Log log = LogFactory.getLog(BaseResponseUtil.class);
    /**
     * @param @param response
     * @param @param res    响应字符串
     * @return void    返回类型
     * @throws
     * @Title: responseJson
     * @Description: JSON 格式 响应
     */
    public static void responseJson(HttpServletResponse response, String res) {
        try {
            response.setContentType("application/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.write(res);
            out.flush();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

    public static void responseHtml(HttpServletResponse response, String res) {
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.write(res);
            out.flush();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }



//
//
//    /**
//     *
//     * @param response
//     * @param code
//     */
//    public static void responseAjaxJson2(HttpServletResponse response, int code) {
//        String msg = "出错了";
//        responseAjaxJsonOk(response, code, msg);
//    }

    /**
     * @param response
     * @param id
     */
    public static void responseAjaxJsonOKId(HttpServletResponse response, Object id) {
        JSONObject res = new JSONObject();
        try {
            res.put("code", ResultConstant.SUCCESS_CODE);
            res.put("msg", ResultConstant.SUCCESS_MSG);
            res.put("id", id);
            responseJson(response, res.toString());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }


    /**
     * @param response
     */
    public static void responseAjaxJsonOk(HttpServletResponse response) {
        responseAjaxJson(response, ResultConstant.SUCCESS_CODE, ResultConstant.SUCCESS_MSG);
    }

    /**
     * @param response
     * @param msg
     */
    public static void responseAjaxJsonOK(HttpServletResponse response, String msg) {
        responseAjaxJson(response, ResultConstant.SUCCESS_CODE, msg);
    }

    /**
     *
     * @param response
     * @param code
     * @param msg
     */
    public static void responseAjaxJson(HttpServletResponse response, String code, String msg) {
        JSONObject res = new JSONObject();
        try {
            res.put("code", code);
            res.put("msg", msg);
            responseJson(response, res.toString());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

        /**
     *
     * @param response
     * @param msg
     */
    public static void responseAjaxJson(HttpServletResponse response, String msg) {
        JSONObject res = new JSONObject();
        try {
            res.put("msg", msg);
            responseJson(response, res.toString());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

}
