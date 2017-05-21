package base.httpclient.client;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.File;
import java.util.*;

//post and upload
//cookie and session
//get
//post

/**
 * User: liuwentao
 * Time: 14-6-10 下午5:40
 */
public class HttpRequest {
    public static void main(String[] args) throws Exception {
        String url = "http://m.baidu.com/ssid=0/from=0/bd_page_type=1/uid=undefined/pu=sz@1320_1001,usm@0/baiduid=DBD90050E49E1D78013192C7C89978B5/w=1_20_%E9%83%BD%E5%B8%82%E6%9E%81%E5%93%81%E8%87%B3%E5%B0%8A/t=iphone/tc?srd=1&appui=alaxs&ajax=1&alalog=1&gid=2014937350&pageType=router&src=http%3A%2F%2Fbaishuku.com%2Fhtml%2F43%2F43582%2F14353146.html&cid=2014937350%7C7906412705856196022";
        HttpRequest httpClient = new HttpRequest(url);
        String str = httpClient.execute();
        System.out.println("str=" + str);
    }

    private String urlString = null;
    private int timeOut = 1000 * 10;
    private HashMap<String, String> headerDatasMap = new HashMap<String, String>();
    private List<String[]> postDatasList = new ArrayList<String[]>();
    private List<String[]> uploadFilesList = new ArrayList<String[]>();
    //
    private CloseableHttpClient httpclient = null;
    private HttpPost httpPost = null;
    private HttpGet httpGet = null;
    public CookieStore cookieStore = null;
    private HttpClientContext localContext = null;
    private HttpEntity httpEntity = null;
    public CloseableHttpResponse httpResponse = null;
    public HttpEntity responseHttpEntity = null;

    public HttpRequest(String urlString) {
        this.urlString = urlString;
        //
        this.setHeader("Accept", "text/html, application/xhtml+xml, */*");
        this.setHeader("Accept-Language", "zh-CN");
        this.setHeader("User-Agent", "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; BOIE9;ZHCN)");

    }

    /**
     * after executing...
     */
    public String getRequestLine() {
        if (this.httpGet != null) {
            return this.httpGet.getRequestLine().toString();
        } else {
            return this.httpPost.getRequestLine().toString();
        }
    }

    public void setHeader(String $name, String $value) {
        this.headerDatasMap.put($name, $value);
    }

    public void setTimeOut(int millionSeconds) {
        this.timeOut = millionSeconds;
    }

    public void addPostData(String name, String value) {
        String pair[] = {name, value};
        this.postDatasList.add(pair);
    }

    /**
     * @param name fieldname
     */
    public void addUploadFile(String name, String pathName, String rename) throws Exception {
        String fileinfo[] = {name, pathName, rename};
        this.uploadFilesList.add(fileinfo);
    }

    private void prepare() throws Exception {
        this.httpclient = HttpClients.createDefault();
        /**
         * 设置上下文:localContext
         */
        //cookie and session
        this.cookieStore = new BasicCookieStore();
        this.localContext = HttpClientContext.create();
        this.localContext.setCookieStore(this.cookieStore);
        //超时、跳转等
        RequestConfig.Builder requestConfigBuilder = RequestConfig.custom();
        requestConfigBuilder.setConnectTimeout(this.timeOut);
        requestConfigBuilder.setConnectionRequestTimeout(this.timeOut);
        requestConfigBuilder.setSocketTimeout(this.timeOut);
        requestConfigBuilder.setRedirectsEnabled(false);
        this.localContext.setRequestConfig(requestConfigBuilder.build());
        /**
         * 创建Method
         */
        if (1 == 1 || this.httpGet != null) {
            this.httpGet = new HttpGet(this.urlString);
            //headerdata
            this.prepareHeaders(this.httpGet);
        } else {
            this.httpPost = new HttpPost(this.urlString);
            //headerdata
            this.prepareHeaders(this.httpPost);
            //
            this.preparePostDatasAndUploadFiles();
            this.httpPost.setEntity(this.httpEntity);
        }
    }

    private void prepareHeaders(HttpRequestBase httpRequest) {
        Set set = this.headerDatasMap.keySet();
        Iterator it = set.iterator();
        String key;
        while (it.hasNext()) {
            key = (String) it.next();
            httpRequest.setHeader(key, this.headerDatasMap.get(key));
        }
    }

    private void preparePostDatasAndUploadFiles() {
        //multipart/form-data
        if (this.uploadFilesList.size() > 0) {//uploadFiles
            MultipartEntityBuilder multipartEntityBuilder = MultipartEntityBuilder.create()
                    .setMode(HttpMultipartMode.STRICT) /**
             * .setCharset(Charset.defaultCharset())
             */;
            for (int i = 0; i < this.uploadFilesList.size(); i++) {
                String[] files = uploadFilesList.get(i);
                multipartEntityBuilder.addBinaryBody(files[0], new File(files[1]), ContentType.DEFAULT_BINARY, files[2]);
            }
            //postData
            for (int i = 0; i < postDatasList.size(); i++) {
                String[] strings = postDatasList.get(i);
                multipartEntityBuilder.addTextBody(strings[0], strings[1], ContentType.DEFAULT_TEXT);
            }
            //
            this.httpEntity = multipartEntityBuilder.build();
            return;
        }
        //application/x-www-form-urlencoded
        if (this.postDatasList.size() > 0) {
            List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
            //
            for (int i = 0; i < postDatasList.size(); i++) {
                String[] strings = postDatasList.get(i);
                nameValuePairs.add(new BasicNameValuePair(strings[0], strings[1]));
            }
            //
            this.httpEntity = new UrlEncodedFormEntity(nameValuePairs, Consts.UTF_8);
        }
    }

    /**
     * execute
     */
    public String execute() throws Exception {
        if (this.httpclient == null) {
            this.prepare();
        }
        //
        if (this.httpGet != null) {
            this.httpResponse = this.httpclient.execute(this.httpGet, this.localContext);
        } else {
            this.httpResponse = this.httpclient.execute(this.httpPost, this.localContext);
        }

        this.responseHttpEntity = this.httpResponse.getEntity();

        String str = EntityUtils.toString(this.responseHttpEntity);
        return str;
    }
}