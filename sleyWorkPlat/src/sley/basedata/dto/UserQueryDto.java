/**
 * 
 */
package sley.basedata.dto;

import sley.common.Pager;

/**
 * @author wangli
 *
 */
public class UserQueryDto {
    
	private String userId;
	private String idNumber;
	private String userName;
	private String groupName;
	private String parentDepartId;
	private String departId;
	private String departName;
	private String sex;
	private String fromAge;
	private String toAge;
	private String levl;//层级
	private String degree;//学历
	private String title;//职称
	private String govState;//在编状态
	private String workState;//在职状态
	private String keywords;
	private String nowDate;
	private String fromWorkYear;
	private String toWorkYear;
	private String mobile;
	
	private int startNumber;
	private int endNumber;
	private int topNumber;
	private Pager pager;
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
	 * @return the startNumber
	 */
	public int getStartNumber() {
		return startNumber;
	}
	/**
	 * @param startNumber the startNumber to set
	 */
	public void setStartNumber(int startNumber) {
		this.startNumber = startNumber;
	}
	/**
	 * @return the endNumber
	 */
	public int getEndNumber() {
		return endNumber;
	}
	/**
	 * @param endNumber the endNumber to set
	 */
	public void setEndNumber(int endNumber) {
		this.endNumber = endNumber;
	}
	/**
	 * @return the topNumber
	 */
	public int getTopNumber() {
		return topNumber;
	}
	/**
	 * @param topNumber the topNumber to set
	 */
	public void setTopNumber(int topNumber) {
		this.topNumber = topNumber;
	}
	/**
	 * @return the pager
	 */
	public Pager getPager() {
		return pager;
	}
	/**
	 * @param pager the pager to set
	 */
	public void setPager(Pager pager) {
		this.pager = pager;
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
	 * @return the fromAge
	 */
	public String getFromAge() {
		return fromAge;
	}
	/**
	 * @param fromAge the fromAge to set
	 */
	public void setFromAge(String fromAge) {
		this.fromAge = fromAge;
	}
	/**
	 * @return the toAge
	 */
	public String getToAge() {
		return toAge;
	}
	/**
	 * @param toAge the toAge to set
	 */
	public void setToAge(String toAge) {
		this.toAge = toAge;
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
	 * @return the keywords
	 */
	public String getKeywords() {
		return keywords;
	}
	/**
	 * @param keywords the keywords to set
	 */
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	/**
	 * @return the nowDate
	 */
	public String getNowDate() {
		return nowDate;
	}
	/**
	 * @param nowDate the nowDate to set
	 */
	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}
	/**
	 * @return the fromWorkYear
	 */
	public String getFromWorkYear() {
		return fromWorkYear;
	}
	/**
	 * @param fromWorkYear the fromWorkYear to set
	 */
	public void setFromWorkYear(String fromWorkYear) {
		this.fromWorkYear = fromWorkYear;
	}
	/**
	 * @return the toWorkYear
	 */
	public String getToWorkYear() {
		return toWorkYear;
	}
	/**
	 * @param toWorkYear the toWorkYear to set
	 */
	public void setToWorkYear(String toWorkYear) {
		this.toWorkYear = toWorkYear;
	}
	/**
	 * @return the groupName
	 */
	public String getGroupName() {
		return groupName;
	}
	/**
	 * @param groupName the groupName to set
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
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
}
