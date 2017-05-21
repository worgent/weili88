package base.jsptag;

import java.io.Serializable;
import java.util.Map;

public class ConfigBean implements Serializable {
	private String configId;
	private Map<String,Object> properties;

    public String getConfigId() {
        return configId;
    }

    public void setConfigId(String configId) {
        this.configId = configId;
    }

    public Map<String, Object> getProperties() {
        return properties;
    }

    public void setProperties(Map<String, Object> properties) {
        this.properties = properties;
    }
}