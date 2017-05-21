package cn.taiqiu8.action;

import base.bean.PageBean;
import base.result.ResultBean;
import base.util.BaseIntUtil;
import base.util.BasePageBeanUtil;
import base.util.BaseResponseUtil;
import base.util.BaseStringUtil;

import cn.taiqiu8.model.Message;
import cn.taiqiu8.model.User;
import cn.taiqiu8.service.MessageService;
import cn.taiqiu8.weixin.WxManager;
import cn.taiqiu8.weixin.WxUtil;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 * User: liuwentao
 * Time: 15-1-16 上午11:56
 */
@Controller
public class MessageController extends BaseController{
    private static final Log log = LogFactory.getLog(MessageController.class);
    private WxManager wxManager = WxManager.getInstance();
    private WxUtil wxUtil = wxManager.getEcoWx();
    @Autowired
    private MessageService messageService;

    //------------------------------------------read------------------------------

    /**
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/user/message/detail")
    public void detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = BaseIntUtil.getInt(request, "id");
        User user = super.getLoginUser(request);
        int userId = user.getId();



       // request.setAttribute("message", );

       // return "/user/message/detail";

        PrintWriter out = response.getWriter();
        response.setHeader("Access-Control-Allow-Origin", "*");

        String url = request.getParameter("url");
        String currentPath;
        if( request.getServerPort() != 80 )
            currentPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getServletPath();
        else
            currentPath = request.getScheme()+"://"+request.getServerName()+request.getServletPath();


        log.debug("getSign,url,"+url);
        String at = wxUtil.getAccessToken();
        String jsApiTicket = wxUtil.getJsApiTicket();
        JSONObject jo = wxUtil.sign(jsApiTicket, url);
        jo.put("appId", wxUtil.getAppID());
        log.debug("getAccessToken,"+at);
        log.debug("jsApiTicket,"+jsApiTicket);
        log.debug("sign JSONObject,"+jo);

        log.debug("currentPath,"+currentPath);

        out.print(jo);
    }


}
