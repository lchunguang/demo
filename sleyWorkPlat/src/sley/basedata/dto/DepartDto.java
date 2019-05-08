/**
 * 
 */
package sley.basedata.dto;

/**
 * @author wangli
 *
 */
public class DepartDto {
	private String departId;
	private String departName;
	private String levl;
	private String valid;
	private String parentDepartId;
	/**
	 * @return the departId
	 */
	public String getDepartId() {
		return departId;
	}
	/**
	 * @param departId the departId to set
	 */
	public void setDepartId(String departId) {
		this.departId = departId;
	}
	/**
	 * @return the departName
	 */
	public String getDepartName() {
		return departName;
	}
	/**
	 * @param departName the departName to set
	 */
	public void setDepartName(String departName) {
		this.departName = departName;
	}
	/**
	 * @return the levl
	 */
	public String getLevl() {
		return levl;
	}
	/**
	 * @param levl the levl to set
	 */
	public void setLevl(String levl) {
		this.levl = levl;
	}
	/**
	 * @return the valid
	 */
	public String getValid() {
		return valid;
	}
	/**
	 * @param valid the valid to set
	 */
	public void setValid(String valid) {
		this.valid = valid;
	}
	/**
	 * @return the parentDepartId
	 */
	public String getParentDepartId() {
		return parentDepartId;
	}
	/**
	 * @param parentDepartId the parentDepartId to set
	 */
	public void setParentDepartId(String parentDepartId) {
		this.parentDepartId = parentDepartId;
	}

}
