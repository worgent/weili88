package base.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;

/**
 * User: liuwentao
 * Time: 14-7-11 上午11:55
 */
public class BaseJsonUtil {

   public static void writeJson(Object obj, String jsonPath, boolean array) {
        String json = "";
        if (array) {
            json = JSONArray.fromObject(obj).toString();
        } else {
            json = JSONObject.fromObject(obj).toString();
        }

        File jsonFile = new File(jsonPath);
        try {
            FileUtils.write(jsonFile, json, "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
