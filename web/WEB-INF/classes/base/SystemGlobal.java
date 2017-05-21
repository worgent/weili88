package base;

import base.util.BaseBooleanUtil;
import base.util.BaseIntUtil;
import base.util.BaseStringUtil;
import org.apache.commons.lang.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 系统资源管理类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public class SystemGlobal {
	private static Properties preferences = new Properties(); //域 preferences

    /**
     *
     * @param key
     * @return
     */
	public static String getPreference( String key ) {
		String s = preferences.getProperty(key);
		if ( s != null ){
            s = s.trim();
        }
		return s;
	}

    public static int getPreferenceInt( String key ) {
        String value = getPreference(key);
        return BaseIntUtil.getInt(value);
    }

    public static boolean getPreferenceBoolean( String key ) {
        String value = getPreference(key);
        return BaseBooleanUtil.getValue(value);
    }


    public static String getWebRoot(){
        return getPreference("webRoot");
    }

    /**
     *
     * @param key
     * @param defaultValue
     * @return
     */
	public static String getPreference( String key, String defaultValue ) {
		String s = preferences.getProperty(key);
		if ( s==null ) {
            return defaultValue;
        } else {
            return s;
        }
	}

    /**
     *
     * @param key
     * @param params
     * @return
     */
	public static String getPreference( String key, Object...params ) {
		String message = preferences.getProperty(key);
		if ( message!=null ) {
            message = message.trim();
        }
		if ( params==null || params.length==0 ) {
            return message;
        }
		String[] ss = new String[params.length];
		Object o = null;
		for ( int i=0; i<params.length; i++ ) {
			o = params[i];
			if ( o==null ) {
				ss[i] = "";
			} else {
				ss[i] = o.toString();
			}
		}
		return replacePlaceHolder( message, ss );
	}

    /**
     *
     * @param key
     * @param value
     */
	public static void setPreference( String key, String value ) {
		if ( value!=null ) {
			value = value.trim();
			preferences.setProperty( key, value );
		} else {
			preferences.remove( key );
		}
	}

    /**
     *
     * @param key
     * @param defaultValue
     * @return
     */
	public static int getIntPreference( String key, int defaultValue ) {
		String s = getPreference( key );
		if ( StringUtils.isBlank(s) ) {
            return defaultValue;
        } else {
            return Integer.parseInt(s);
        }
	}

    /**
     *
     * @param key
     * @param value
     */
	public static void setIntPreference( String key, int value ) {
		setPreference( key, String.valueOf(value) );
	}

    /**
     *
     * @param key
     * @param defaultValue
     * @return
     */
	public static long getLongPreference( String key, long defaultValue ) {
		String s = getPreference( key );
		if ( StringUtils.isBlank(s) ) {
            return defaultValue;
        } else {
            return Long.parseLong(s);
        }
	}

    /**
     *
     * @param key
     * @param value
     */
	public static void setLongPreference( String key, long value ) {
		setPreference( key, String.valueOf(value) );
	}

    /**
     *
     * @param key
     * @param defaultValue
     * @return
     */
	public static boolean getBooleanPreference( String key, boolean defaultValue ) {
		String s = getPreference( key );
		if ( StringUtils.isBlank(s) ) {
            return defaultValue;
        } else {
            return Boolean.parseBoolean(s);
        }
	}

    /**
     *
     * @param key
     * @param value
     */
	public static void setBooleanPreference( String key, boolean value ) {
		setPreference( key, String.valueOf(value) );
	}

    /**
     *
     * @param file
     */
	public static void loadConfig( String file ) {
		try {
			InputStream is = SystemGlobal.class.getClassLoader().getResourceAsStream(file);
			preferences.load(is);
            System.out.println("preferences.size(): " + preferences.size());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

    public static Properties getPreferences() {
        return preferences;
    }

    /**
     *
     * @param message
     * @param params
     * @return
     */
	private static String replacePlaceHolder( String message, String[] params ) {
		if ( StringUtils.isBlank(message) ) {
            return message;
        }
		if ( params==null || params.length==0 ) {
            return message;
        }
		Map<String, String> map = new HashMap<String, String>();
		int index = -1;
		Pattern p = Pattern.compile("\\{(\\d+)\\}");
		Matcher m = p.matcher( message );
		while ( m.find() ) {
			if ( m.groupCount()<1 ) continue;
			index = Integer.parseInt( m.group(1) );
			if ( index<0 || index>=params.length ) {
                continue;
            }
			map.put( m.group(0), params[index] );
		}
		if ( map.isEmpty() ) {
            return message;
        }
		for ( Entry<String, String> entry : map.entrySet() ) {
			message = message.replace( entry.getKey(), entry.getValue() );
		}
		return message;
	}

    /**
     *
     * @param args
     */
	public static void main( String[] args ) {
		String s = "thia is a {4} or a {1} {0} hahah";
		String[] params = {"AA","BB","CC"};
		Map<String, String> map = new HashMap<String, String>();
		int index = -1;
		Pattern p = Pattern.compile("\\{(\\d+)\\}");
		Matcher m = p.matcher( s );
		while ( m.find() ) {
			if ( m.groupCount()<1 ) continue;
			index = Integer.parseInt( m.group(1) );
			if ( index<0 || index>=params.length ) {
                continue;
            }
			map.put( m.group(0), params[index] );
		}
		for ( Entry<String, String> entry : map.entrySet() ) {
			s = s.replace( entry.getKey(), entry.getValue() );
		}
		System.out.println( s );
	}
}
