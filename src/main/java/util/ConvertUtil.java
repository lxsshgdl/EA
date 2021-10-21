package util;

public class ConvertUtil {
	public static String FieldToMethod(String columnName) {
		StringBuffer sb = new StringBuffer(columnName);
		sb.setCharAt(0, Character.toUpperCase(sb.charAt(0)));
		sb.insert(0, "set");
		return sb.toString();
	}
}
