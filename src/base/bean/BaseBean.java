package base.bean;

import org.apache.commons.lang.builder.ToStringBuilder;

import java.io.Serializable;
import java.lang.reflect.Field;

/**
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 上午10:04
 */
public class BaseBean implements Serializable {

	private static final long serialVersionUID = -5116468685582201715L;

	/**
	 * toString
	 */
	@Override
	public String toString() {
		ToStringBuilder builder = new ToStringBuilder(this);
		Field[] fields = this.getClass().getDeclaredFields();
		try {
			for (Field f : fields) {
				f.setAccessible(true);
				builder.append(f.getName(), f.get(this)).append("\n");
			}
		}
		catch (Exception e) { // Suppress
			builder.append("toString builder encounter an error");
		}
		return builder.toString();
	}
}