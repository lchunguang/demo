/**
 * 
 */
package sley.finance.model;

import java.math.BigDecimal;

/**
 * @author wangli
 *
 */
public class Salary {
    //在编人员工资条信息
	private String year;
	private String month;
	private String masterId;
	private String userId;
	private String userName;
	private String departId;
	private String departName;
	private BigDecimal positionSalary;
	private BigDecimal gradeSalary;
	private BigDecimal aboveSalary;
	private BigDecimal baseSalary;
	private BigDecimal encourageSalary;
	private BigDecimal floatSalary;
	private BigDecimal tenSalary;
	private BigDecimal nurseSalary;
	private BigDecimal healthSalary;
	private BigDecimal nightSalary;
	private BigDecimal houseSalary;
	private BigDecimal propertySalary;
	private BigDecimal grossSalary;
	private BigDecimal hydropowerSalary;
	private BigDecimal memberSalary;
	private BigDecimal oldPension;
	private BigDecimal occupAnnuity;
	private BigDecimal unemploymentPay;
	private BigDecimal medicalSalary;
	private BigDecimal houseFund;
	private BigDecimal performancePay;
	private BigDecimal otherPay;
	private BigDecimal tax;
	private BigDecimal netPay;
	private String userType;
	private BigDecimal totalDeduct;
	
	//合同人员新增字段
	private BigDecimal titleSalary;
	private BigDecimal overtimePay;
	private BigDecimal allowance;
	private BigDecimal performancePay1;
	private BigDecimal otherPay1;
	//同工同酬新增字段
	private BigDecimal rentPay;
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
	 * @return the positionSalary
	 */
	public BigDecimal getPositionSalary() {
		return positionSalary;
	}
	/**
	 * @param positionSalary the positionSalary to set
	 */
	public void setPositionSalary(BigDecimal positionSalary) {
		this.positionSalary = positionSalary;
	}
	/**
	 * @return the gradeSalary
	 */
	public BigDecimal getGradeSalary() {
		return gradeSalary;
	}
	/**
	 * @param gradeSalary the gradeSalary to set
	 */
	public void setGradeSalary(BigDecimal gradeSalary) {
		this.gradeSalary = gradeSalary;
	}
	/**
	 * @return the aboveSalary
	 */
	public BigDecimal getAboveSalary() {
		return aboveSalary;
	}
	/**
	 * @param aboveSalary the aboveSalary to set
	 */
	public void setAboveSalary(BigDecimal aboveSalary) {
		this.aboveSalary = aboveSalary;
	}
	/**
	 * @return the baseSalary
	 */
	public BigDecimal getBaseSalary() {
		return baseSalary;
	}
	/**
	 * @param baseSalary the baseSalary to set
	 */
	public void setBaseSalary(BigDecimal baseSalary) {
		this.baseSalary = baseSalary;
	}
	/**
	 * @return the encourageSalary
	 */
	public BigDecimal getEncourageSalary() {
		return encourageSalary;
	}
	/**
	 * @param encourageSalary the encourageSalary to set
	 */
	public void setEncourageSalary(BigDecimal encourageSalary) {
		this.encourageSalary = encourageSalary;
	}
	/**
	 * @return the floatSalary
	 */
	public BigDecimal getFloatSalary() {
		return floatSalary;
	}
	/**
	 * @param floatSalary the floatSalary to set
	 */
	public void setFloatSalary(BigDecimal floatSalary) {
		this.floatSalary = floatSalary;
	}
	/**
	 * @return the tenSalary
	 */
	public BigDecimal getTenSalary() {
		return tenSalary;
	}
	/**
	 * @param tenSalary the tenSalary to set
	 */
	public void setTenSalary(BigDecimal tenSalary) {
		this.tenSalary = tenSalary;
	}
	/**
	 * @return the nurseSalary
	 */
	public BigDecimal getNurseSalary() {
		return nurseSalary;
	}
	/**
	 * @param nurseSalary the nurseSalary to set
	 */
	public void setNurseSalary(BigDecimal nurseSalary) {
		this.nurseSalary = nurseSalary;
	}
	/**
	 * @return the healthSalary
	 */
	public BigDecimal getHealthSalary() {
		return healthSalary;
	}
	/**
	 * @param healthSalary the healthSalary to set
	 */
	public void setHealthSalary(BigDecimal healthSalary) {
		this.healthSalary = healthSalary;
	}
	/**
	 * @return the nightSalary
	 */
	public BigDecimal getNightSalary() {
		return nightSalary;
	}
	/**
	 * @param nightSalary the nightSalary to set
	 */
	public void setNightSalary(BigDecimal nightSalary) {
		this.nightSalary = nightSalary;
	}
	/**
	 * @return the houseSalary
	 */
	public BigDecimal getHouseSalary() {
		return houseSalary;
	}
	/**
	 * @param houseSalary the houseSalary to set
	 */
	public void setHouseSalary(BigDecimal houseSalary) {
		this.houseSalary = houseSalary;
	}
	/**
	 * @return the propertySalary
	 */
	public BigDecimal getPropertySalary() {
		return propertySalary;
	}
	/**
	 * @param propertySalary the propertySalary to set
	 */
	public void setPropertySalary(BigDecimal propertySalary) {
		this.propertySalary = propertySalary;
	}
	/**
	 * @return the grossSalary
	 */
	public BigDecimal getGrossSalary() {
		return grossSalary;
	}
	/**
	 * @param grossSalary the grossSalary to set
	 */
	public void setGrossSalary(BigDecimal grossSalary) {
		this.grossSalary = grossSalary;
	}
	/**
	 * @return the hydropowerSalary
	 */
	public BigDecimal getHydropowerSalary() {
		return hydropowerSalary;
	}
	/**
	 * @param hydropowerSalary the hydropowerSalary to set
	 */
	public void setHydropowerSalary(BigDecimal hydropowerSalary) {
		this.hydropowerSalary = hydropowerSalary;
	}
	/**
	 * @return the memberSalary
	 */
	public BigDecimal getMemberSalary() {
		return memberSalary;
	}
	/**
	 * @param memberSalary the memberSalary to set
	 */
	public void setMemberSalary(BigDecimal memberSalary) {
		this.memberSalary = memberSalary;
	}
	/**
	 * @return the oldPension
	 */
	public BigDecimal getOldPension() {
		return oldPension;
	}
	/**
	 * @param oldPension the oldPension to set
	 */
	public void setOldPension(BigDecimal oldPension) {
		this.oldPension = oldPension;
	}
	/**
	 * @return the medicalSalary
	 */
	public BigDecimal getMedicalSalary() {
		return medicalSalary;
	}
	/**
	 * @param medicalSalary the medicalSalary to set
	 */
	public void setMedicalSalary(BigDecimal medicalSalary) {
		this.medicalSalary = medicalSalary;
	}
	/**
	 * @return the houseFund
	 */
	public BigDecimal getHouseFund() {
		return houseFund;
	}
	/**
	 * @param houseFund the houseFund to set
	 */
	public void setHouseFund(BigDecimal houseFund) {
		this.houseFund = houseFund;
	}
	/**
	 * @return the performancePay
	 */
	public BigDecimal getPerformancePay() {
		return performancePay;
	}
	/**
	 * @param performancePay the performancePay to set
	 */
	public void setPerformancePay(BigDecimal performancePay) {
		this.performancePay = performancePay;
	}
	/**
	 * @return the otherPay
	 */
	public BigDecimal getOtherPay() {
		return otherPay;
	}
	/**
	 * @param otherPay the otherPay to set
	 */
	public void setOtherPay(BigDecimal otherPay) {
		this.otherPay = otherPay;
	}
	/**
	 * @return the tax
	 */
	public BigDecimal getTax() {
		return tax;
	}
	/**
	 * @param tax the tax to set
	 */
	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}
	/**
	
	/**
	 * @return the occupAnnuity
	 */
	public BigDecimal getOccupAnnuity() {
		return occupAnnuity;
	}
	/**
	 * @param occupAnnuity the occupAnnuity to set
	 */
	public void setOccupAnnuity(BigDecimal occupAnnuity) {
		this.occupAnnuity = occupAnnuity;
	}
	/**
	 * @return the netPay
	 */
	public BigDecimal getNetPay() {
		return netPay;
	}
	/**
	 * @param netPay the netPay to set
	 */
	public void setNetPay(BigDecimal netPay) {
		this.netPay = netPay;
	}
	/**
	 * @return the year
	 */
	public String getYear() {
		return year;
	}
	/**
	 * @param year the year to set
	 */
	public void setYear(String year) {
		this.year = year;
	}
	/**
	 * @return the month
	 */
	public String getMonth() {
		return month;
	}
	/**
	 * @param month the month to set
	 */
	public void setMonth(String month) {
		this.month = month;
	}
	/**
	 * @return the unemploymentPay
	 */
	public BigDecimal getUnemploymentPay() {
		return unemploymentPay;
	}
	/**
	 * @param unemploymentPay the unemploymentPay to set
	 */
	public void setUnemploymentPay(BigDecimal unemploymentPay) {
		this.unemploymentPay = unemploymentPay;
	}
	/**
	 * @return the userType
	 */
	public String getUserType() {
		return userType;
	}
	/**
	 * @param userType the userType to set
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
	/**
	 * @return the titleSalary
	 */
	public BigDecimal getTitleSalary() {
		return titleSalary;
	}
	/**
	 * @param titleSalary the titleSalary to set
	 */
	public void setTitleSalary(BigDecimal titleSalary) {
		this.titleSalary = titleSalary;
	}
	/**
	 * @return the overtimePay
	 */
	public BigDecimal getOvertimePay() {
		return overtimePay;
	}
	/**
	 * @param overtimePay the overtimePay to set
	 */
	public void setOvertimePay(BigDecimal overtimePay) {
		this.overtimePay = overtimePay;
	}
	/**
	 * @return the allowance
	 */
	public BigDecimal getAllowance() {
		return allowance;
	}
	/**
	 * @param allowance the allowance to set
	 */
	public void setAllowance(BigDecimal allowance) {
		this.allowance = allowance;
	}
	/**
	 * @return the performancePay1
	 */
	public BigDecimal getPerformancePay1() {
		return performancePay1;
	}
	/**
	 * @param performancePay1 the performancePay1 to set
	 */
	public void setPerformancePay1(BigDecimal performancePay1) {
		this.performancePay1 = performancePay1;
	}
	/**
	 * @return the otherPay1
	 */
	public BigDecimal getOtherPay1() {
		return otherPay1;
	}
	/**
	 * @param otherPay1 the otherPay1 to set
	 */
	public void setOtherPay1(BigDecimal otherPay1) {
		this.otherPay1 = otherPay1;
	}
	/**
	 * @return the rentPay
	 */
	public BigDecimal getRentPay() {
		return rentPay;
	}
	/**
	 * @param rentPay the rentPay to set
	 */
	public void setRentPay(BigDecimal rentPay) {
		this.rentPay = rentPay;
	}
	/**
	 * @return the totalDeduct
	 */
	public BigDecimal getTotalDeduct() {
		return totalDeduct;
	}
	/**
	 * @param totalDeduct the totalDeduct to set
	 */
	public void setTotalDeduct(BigDecimal totalDeduct) {
		this.totalDeduct = totalDeduct;
	}
	
	
	
}
