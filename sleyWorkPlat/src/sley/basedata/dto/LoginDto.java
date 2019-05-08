/**     
 * @discription 用户登录信息数据传输Dto
 * @author wangli       
 * @created 2014年9月12日 下午2:46:51    
 * tags     
 * see_to_target     
 */
package sley.basedata.dto;

/**
 * 
 * Title: LoginDto.java Description: 用户登录信息数据传输Dto
 * 
 * @author wangli
 * @created 2014年9月12日 下午3:01:02
 */
public class LoginDto {
	private String masterId;
	private String userId;
	private String userName;
	private String password;
	private String departname;
	private String loginTime;

	
	/**
	 * @author wangli
	 * @created 2014年12月7日 下午4:05:34
	 * @return type
	 */

	public String getPassword() {
		return password;
	}

	/**
	 * @author wangli
	 * @created 2014年12月7日 下午4:05:34
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @author wangli
	 * @created 2014年12月23日 下午2:51:28
	 * @return type
	 */

	public String getDepartname() {
		return departname;
	}

	/**
	 * @author wangli
	 * @created 2014年12月23日 下午2:51:28
	 * @param departname
	 */
	public void setDepartname(String departname) {
		this.departname = departname;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the loginTime
	 */
	public String getLoginTime() {
		return loginTime;
	}

	/**
	 * @param loginTime the loginTime to set
	 */
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	/**
	 * @return the masterId
	 */
	public String getMasterId() {
		return masterId;
	}

	/**
	 * @param masterId the masterId to set
	 */
	public void setMasterId(String masterId) {
		this.masterId = masterId;
	}

}
