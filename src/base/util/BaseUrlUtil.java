package base.util;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * User: liuwentao
 * Time: 13-9-24 下午4:19
 */
public class BaseUrlUtil {
    private static final Log log = LogFactory.getLog(BaseUrlUtil.class);

    /**
     * 根据URL下载文件，前提是这个文件当中的内容是文本，函数的返回值就是文件当中的内容
     * 1.创建一个URL对象
     * 2.通过URL对象，创建一个HttpURLConnection对象
     * 3.得到InputStram
     * 4.从InputStream当中读取数据
     *
     * @param urlStr
     * @return
     */
    public static String downloadGb2312(String urlStr) {
        return download(urlStr, "gb2312");
    }

    public static String download(String urlStr, String charsetName) {
        HttpURLConnection httpURLConnection = null;
        BufferedReader bufferedReader = null;
        String line = null;
        StringBuffer stringBuffer = new StringBuffer();
        try {
            // 创建一个URL对象
            URL url = new URL(urlStr);
            // 创建一个Http连接
            httpURLConnection = (HttpURLConnection) url.openConnection();

            httpURLConnection.setDoOutput(true);
            httpURLConnection.setRequestProperty("User-Agent", "");

            InputStream inputStream = httpURLConnection.getInputStream();
            Reader reader = new InputStreamReader(inputStream, charsetName);
            // 使用IO流读取数据
            bufferedReader = new BufferedReader(reader);
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }
        } catch (FileNotFoundException en) {
            log.error("FileNotFoundException: " + urlStr);
        } catch (Exception e) {
            log.error("urlStr=" + urlStr);
            e.printStackTrace();
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return stringBuffer.toString();
    }

    /**
     *
     * @param urlStr
     * @param charsetName
     * @return
     */
    public static List<String> downloadList(String urlStr, String charsetName) {
        HttpURLConnection httpURLConnection = null;
        BufferedReader bufferedReader = null;
        String line = null;
        List<String> list = new ArrayList<String>();
        try {
            // 创建一个URL对象
            URL url = new URL(urlStr);
            // 创建一个Http连接
            httpURLConnection = (HttpURLConnection) url.openConnection();

            httpURLConnection.setDoOutput(true);
            httpURLConnection.setRequestProperty("User-Agent", "");

            InputStream inputStream = httpURLConnection.getInputStream();
            Reader reader = new InputStreamReader(inputStream, charsetName);
            // 使用IO流读取数据
            bufferedReader = new BufferedReader(reader);
            while ((line = bufferedReader.readLine()) != null) {
                list.add(line);
            }
        } catch (FileNotFoundException en) {
            log.error("FileNotFoundException: " + urlStr);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    /**
     * 根据URL得到输入流
     *
     * @param urlStr
     * @return
     * @throws java.net.MalformedURLException
     * @throws java.io.IOException
     */
    public static InputStream getInputStreamFromUrl(String urlStr)
            throws MalformedURLException, IOException {
        URL url = new URL(urlStr);
        HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
        InputStream inputStream = urlConn.getInputStream();
        return inputStream;
    }

    public static void writeOverride(String url, String filePath) {
        write(url, filePath, null,true);
    }

    public static void write(String url, String filePath, Date updateDate) {
        write(url, filePath, updateDate,true);
    }

    public static void writeNoOverride(String url, String filePath) {
        write(url, filePath, null,false);
    }


    public static void write(String url, String filePath, Date updateDate, boolean override) {
        File file = new File(filePath);
        if (file.exists()) {
            if (updateDate != null) {
                Date createTime = BaseFileUtil.getCreateTime(file);
                //文件是最新的，它的时间晚于updateDate
                if (BaseDateUtil.validateDateBefore( new Date(),updateDate)) {
                    return;
                }
                if (BaseDateUtil.validateDateBefore(updateDate, createTime)) {
                    return;
                }
                log.warn("db2 updateTime:" + BaseDateUtil.getFormatString(updateDate,"yyyy-MM-dd hh:mm:ss") + ",file createTime:" + BaseDateUtil.getFormatString(createTime,"yyyy-MM-dd hh:mm:ss"));
            } else{
                if (!override) {
                return;
                }
            }
        }else{
            log.warn(filePath + " not exist ..");
        }

        log.warn(url + " --> " + filePath);
        String html = BaseUrlUtil.download(url, "UTF-8");
        try {
            FileUtils.writeStringToFile(file, html, "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
        //String s = "http://www.baidu.com";
        String s = "awwww.baidu.cc yy";
        String domain = BaseUrlUtil.getDomain(s);
    }

    public static String getDomain(String s) {
        //String s = "http://www.baidu.com";
        //String s = "www.baidu.com";
        Pattern p = Pattern.compile("(?<=//|)((\\w)+\\.)+\\w+");
        Matcher m = p.matcher(s);
        String domain = "";
        if (m.find()) {
            domain = m.group();
            System.out.println("domain=" + domain);
        }

        return domain;
    }
}
