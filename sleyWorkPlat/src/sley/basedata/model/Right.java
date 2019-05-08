/**
 * 
 */
package sley.basedata.model;

import java.util.List;

/**
 * @author wangli
 *
 */
public class Right {
	
	private String rightId;
	private String rightName;
	private String url;
	private String parentRightId;
	private String flag;
	private List<Right> subRightList;
	/**
	 * @return the rightId
	 */
	public String getRightId() {
		return rightId;
	}
	/**
	 * @param rightId the rightId to set
	 */
	public void setRightId(String rightId) {
		this.rightId = rightId;
	}
	/**
	 * @return the rightName
	 */
	public String getRightName() {
		return rightName;
	}
	/**
	 * @param rightName the rightName to set
	 */
	public void setRightName(String rightName) {
		this.rightName = rightName;
	}
	
	/**
	 * @return the parentRightId
	 */
	public String getParentRightId() {
		return parentRightId;
	}
	/**
	 * @param parentRightId the parentRightId to set
	 */
	public void setParentRightId(String parentRightId) {
		this.parentRightId = parentRightId;
	}
	/**
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}
	/**
	 * @param flag the flag to set
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}
	/**
	 * @return the subRightList
	 */
	public List<Right> getSubRightList() {
		return subRightList;
	}
	/**
	 * @param subRightList the subRightList to set
	 */
	public void setSubRightList(List<Right> subRightList) {
		this.subRightList = subRightList;
	}
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	

}
