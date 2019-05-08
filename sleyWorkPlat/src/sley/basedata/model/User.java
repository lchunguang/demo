/**     
 * @discription 與hisdb數據庫表sys_rydy表對應的類
 * @author wangli       
 * @created 2014年9月12日 下午2:46:51    
 * tags     
 * see_to_target     
 */
package sley.basedata.model;

import java.util.List;

/**
 * 
 * Title: User.java Description: 與hisdb數據庫表sys_rydy表對應的類
 * 
 * @author wangli
 * @created 2014年9月12日 下午3:03:43
 */
public class User {

	private String masterId;
	// 用戶id
	private String userId;
	// 人員編號
	private String userName;
	// 人員姓名
	private String password;

	private String departId;

	private String departName;
	
	private String birthDate;
	
	private String age;
	 
	private String hireDate;
	private String workYear;
	private String levl;//层级
	private String degree;//学历
	private String title;//职称
	private String govState;//在编状态
	private String workState;//在职状态
	private String initFlag;
	
	private String idNumber;
	private String shortPhone;
	private String nativePlace;
	
	private String mobile;
	
	private String addr;
	
	private String email;
	
	private String sex;
	
	private String creatTime;
	
	private String loginTime;
	
	private String newPassword;
	
	private String newPassword1;
	
	private List<Right> rightList;//用户权限列表
	
	private String flag;//add by wangli for first login set password
	private String state;
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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
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
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * @return the addr
	 */
	public String getAddr() {
		return addr;
	}
	/**
	 * @param addr the addr to set
	 */
	public void setAddr(String addr) {
		this.addr = addr;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return the creatTime
	 */
	public String getCreatTime() {
		return creatTime;
	}
	/**
	 * @param creatTime the creatTime to set
	 */
	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
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
	 * @return the newPassword
	 */
	public String getNewPassword() {
		return newPassword;
	}
	/**
	 * @param newPassword the newPassword to set
	 */
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	/**
	 * @return the newPassword1
	 */
	public String getNewPassword1() {
		return newPassword1;
	}
	/**
	 * @param newPassword1 the newPassword1 to set
	 */
	public void setNewPassword1(String newPassword1) {
		this.newPassword1 = newPassword1;
	}
	/**
	 * @return the rightList
	 */
	public List<Right> getRightList() {
		return rightList;
	}
	/**
	 * @param rightList the rightList to set
	 */
	public void setRightList(List<Right> rightList) {
		this.rightList = rightList;
	}
	/**
	 * @return the birthDate
	 */
	public String getBirthDate() {
		return birthDate;
	}
	/**
	 * @param birthDate the birthDate to set
	 */
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	/**
	 * @return the hireDate
	 */
	public String getHireDate() {
		return hireDate;
	}
	/**
	 * @param hireDate the hireDate to set
	 */
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
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
	 * @return the degree
	 */
	public String getDegree() {
		return degree;
	}
	/**
	 * @param degree the degree to set
	 */
	public void setDegree(String degree) {
		this.degree = degree;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the govState
	 */
	public String getGovState() {
		return govState;
	}
	/**
	 * @param govState the govState to set
	 */
	public void setGovState(String govState) {
		this.govState = govState;
	}
	/**
	 * @return the workState
	 */
	public String getWorkState() {
		return workState;
	}
	/**
	 * @param workState the workState to set
	 */
	public void setWorkState(String workState) {
		this.workState = workState;
	}
	/**
	 * @return the age
	 */
	public String getAge() {
		return age;
	}
	/**
	 * @param age the age to set
	 */
	public void setAge(String age) {
		this.age = age;
	}
	/**
	 * @return the workYear
	 */
	public String getWorkYear() {
		return workYear;
	}
	/**
	 * @param workYear the workYear to set
	 */
	public void setWorkYear(String workYear) {
		this.workYear = workYear;
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
	 * @return the idNumber
	 */
	public String getIdNumber() {
		return idNumber;
	}
	/**
	 * @param idNumber the idNumber to set
	 */
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	/**
	 * @return the shortPhone
	 */
	public String getShortPhone() {
		return shortPhone;
	}
	/**
	 * @param shortPhone the shortPhone to set
	 */
	public void setShortPhone(String shortPhone) {
		this.shortPhone = shortPhone;
	}
	/**
	 * @return the nativePlace
	 */
	public String getNativePlace() {
		return nativePlace;
	}
	/**
	 * @param nativePlace the nativePlace to set
	 */
	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}
	/**
	 * @return the initFlag
	 */
	public String getInitFlag() {
		return initFlag;
	}
	/**
	 * @param initFlag the initFlag to set
	 */
	public void setInitFlag(String initFlag) {
		this.initFlag = initFlag;
	}
	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

}