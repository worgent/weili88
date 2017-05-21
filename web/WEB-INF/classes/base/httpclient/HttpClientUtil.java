package base.httpclient;

import base.util.BaseStringUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

/**
 * User: liuwentao
 * Time: 15-3-29 上午8:00
 */
public class HttpClientUtil {
    public static final Log log = LogFactory.getLog(HttpClientUtil.class);

    /**
     *
     * @param url
     * @param encode
     * @return
     */
    public static String getHtml(String url,String encode) {
        if(BaseStringUtil.isBlank(encode)){
            encode = "UTF-8";
        }

        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            HttpGet httpGet = new HttpGet(url);
            httpGet.addHeader("Content-Type", "text/html;charset=" + encode);
            httpGet.setHeader("User-Agent", "Mozilla/4.0 (compatible; GoogleToolbar 2.0.114-big; Windows XP 5.1)");
            httpGet.setHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
            httpGet.setHeader("Accept-Language", "zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3");
            httpGet.setHeader("Accept-Encoding", "gzip, deflate");
            httpGet.setHeader("Connection", "keep-alive");

            //超时设置
            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(35000)
                    .setConnectTimeout(35000)
                    .setConnectionRequestTimeout(35000).build();
            httpGet.setConfig(requestConfig);

            CloseableHttpResponse response = httpclient.execute(httpGet);
            try {
                // Get hold of the response entity
                HttpEntity entity = response.getEntity();

                // If the response does not enclose an entity, there is no need
                // to bother about connection release
                if (entity != null) {
                    //String str = EntityUtils.toString(entity);

                    String str = EntityUtils.toString(entity, encode);

                    return str;
                }
            } catch (Exception e1) {
                log.error("e1 url=" + url);
                e1.printStackTrace();
            } finally {
                response.close();
            }
        } catch (Exception e2) {
            log.error("e2 url=" + url);
            e2.printStackTrace();
        } finally {
            try {
                httpclient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return "";
    }
}