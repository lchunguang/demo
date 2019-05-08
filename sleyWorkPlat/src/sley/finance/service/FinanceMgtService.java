/**
 * 
 */
package sley.finance.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import sley.finance.dto.SalaryDto;
import sley.finance.model.Salary;

/**
 * @author wangli
 *
 */
public interface FinanceMgtService {

	/**
	 * 批量导入工资条
	 * @param name
	 * @param file
	 * @return
	 */
	 public boolean batchImport(SalaryDto salaryDto,String name,MultipartFile file);
	 
	 public List<Salary>  querySalaryList(SalaryDto salaryDto);
	 
	 public Salary queryMySalary(SalaryDto salaryDto);
	 
	 public void deleteSalary(SalaryDto salaryDto);
}
