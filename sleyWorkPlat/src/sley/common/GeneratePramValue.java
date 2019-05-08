/**
 * 
 */
package sley.common;

/**
 * @author WangLi
 * 
 */
public class GeneratePramValue {
	/**
	 * 生成编号
	 * 
	 * @param value
	 * @return
	 */
	public String generateParamId(String value) {
		if (value.length() == 1) {
			value = "0000000" + value;
		} else if (value.length() == 2) {
			value = "000000" + value;
		} else if (value.length() == 3) {
			value = "00000" + value;
		} else if (value.length() == 4) {
			value = "0000" + value;
		} else if (value.length() == 5) {
			value = "000" + value;
		} else if (value.length() == 6) {
			value = "00" + value;
		} else if (value.length() == 7) {
			value = "0" + value;
		}
		return value;
	}

}
