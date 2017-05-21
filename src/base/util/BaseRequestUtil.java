package base.util;

import base.constant.SystemGlobalConstant;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * User: liuwentao
 * Time: 12-12-25 下午3:43
 */
public class BaseRequestUtil {
    private static final Log log = LogFactory.getLog(BaseRequestUtil.class);
    /**
     *
     * @param request
     * @param response
     * @return
     */
    public static boolean validateRequestRandImg(HttpServletRequest request, HttpServletResponse response){
        if(1==1){
            return true;
        }
        String randSession = (String) request.getSession().getAttribute(SystemGlobalConstant.KEY_RAND_SESSION);
        String randRequest = request.getParameter(SystemGlobalConstant.KEY_RAND_REQUEST);

        if(randRequest==null || !randRequest.toLowerCase().equals(randSession)){
            BaseResponseUtil.responseAjaxJson(response, SystemGlobalConstant.ERROR_RANDIMG,"验证码错误");
            return false;
        }

        return true;
    }


    public static boolean isMobile(String userAgent,String ip) {
        if (userAgent == null || "23.92.24.165".equals(ip)) {
            return false;
        }

        userAgent = userAgent.toUpperCase();
        if (userAgent.indexOf("NOKI") > -1 || // Nokia phones and emulators
                userAgent.indexOf("ERIC") > -1 || // Ericsson WAP phones and emulators
                userAgent.indexOf("WAPI") > -1 || // Ericsson WapIDE 2.0
                userAgent.indexOf("MC21") > -1 || // Ericsson MC218
                userAgent.indexOf("AUR") > -1 || // Ericsson R320
                userAgent.indexOf("R380") > -1 || // Ericsson R380
                userAgent.indexOf("UP.B") > -1 || // UP.Browser
                userAgent.indexOf("WINW") > -1 || // WinWAP browser
                userAgent.indexOf("UPG1") > -1 || // UP.SDK 4.0
                userAgent.indexOf("UPSI") > -1 || //another kind of UP.Browser
                userAgent.indexOf("QWAP") > -1 || // unknown QWAPPER browser
                userAgent.indexOf("JIGS") > -1 || // unknown JigSaw browser
                userAgent.indexOf("JAVA") > -1 || // unknown Java based browser
                userAgent.indexOf("ALCA") > -1 || // unknown Alcatel-BE3 browser (UP based)
                userAgent.indexOf("MITS") > -1 || // unknown Mitsubishi browser
                userAgent.indexOf("MOT-") > -1 || // unknown browser (UP based)
                userAgent.indexOf("MY S") > -1 || //  unknown Ericsson devkit browser
                userAgent.indexOf("WAPJ") > -1 || //Virtual WAPJAG www.wapjag.de
                userAgent.indexOf("FETC") > -1 || //fetchpage.cgi Perl script from www.wapcab.de
                userAgent.indexOf("ALAV") > -1 || //yet another unknown UP based browser
                userAgent.indexOf("WAPA") > -1 || //another unknown browser (Web based "Wapalyzer")
                userAgent.indexOf("OPER") > -1 || //Opera
                userAgent.indexOf("DOPOD") > -1 ||  //多普达
                userAgent.indexOf("ANDROID") > -1 ||  //多普达
                userAgent.indexOf("APPLE") > -1 ||  //多普达
                userAgent.indexOf("SYMBIAN") > -1   //symbian系统
                ) {
            return true;
        }
        return false;
    }
}
