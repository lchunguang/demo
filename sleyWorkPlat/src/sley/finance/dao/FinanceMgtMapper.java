/**
 * 
 */
package sley.finance.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import sley.finance.dto.SalaryDto;
import sley.finance.model.Salary;

/**
 * @author wangli
 *
 */
@Repository
public interface FinanceMgtMapper {
	
	public void addGovSalary(Salary salary);//在编
	
	public void deleteSalary(SalaryDto salaryDto);
	
	public List<Salary> querySalaryList(SalaryDto salaryDto);
	
	public void addConSalary(Salary salary);//合同制
	
	public void addConSalary1(Salary salary);//同工同酬
	
	public Salary queryMySalary(SalaryDto salaryDto);
	

}
