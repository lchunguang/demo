/**
 * 
 */
package sley.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import sley.common.ReadExcel;
import sley.finance.dao.FinanceMgtMapper;
import sley.finance.dto.SalaryDto;
import sley.finance.model.Salary;

/**
 * @author wangli
 * 
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class FinanceMgtServiceImpl implements FinanceMgtService {
	@Autowired
	private FinanceMgtMapper financeMgtMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see sley.finance.service.FinanceMgtService#batchImport(java.lang.String,
	 * org.springframework.web.multipart.MultipartFile)
	 */
	@Override
	public boolean batchImport(SalaryDto salaryDto,String name, MultipartFile file) {
		boolean b = false;
		// 创建处理EXCEL
		ReadExcel readExcel = new ReadExcel();
		// 解析excel，获取客户信息集合。
		List<Salary> salaryList = readExcel.getExcelInfo(salaryDto.getUserType(),name, file);
		if (salaryList != null) {
			b = true;
		}
		//先删除工资条
		this.financeMgtMapper.deleteSalary(salaryDto);
		// 迭代添加工资（注：实际上这里也可以直接将salaryList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
		for (Salary salary : salaryList) {
			salary.setYear(salaryDto.getYear());
			salary.setMonth(salaryDto.getMonth());
			String userType=salaryDto.getUserType();
			salary.setUserType(userType);
			if(userType!=null&&userType.equals("1")){
				this.financeMgtMapper.addGovSalary(salary);
			}else if(userType!=null&&userType.equals("2")){
				this.financeMgtMapper.addConSalary(salary);
			}else{
				this.financeMgtMapper.addConSalary1(salary);
			}
			
		}
		return b;
	}

	/*
	 * (non-Javadoc)
	 * @see sley.finance.service.FinanceMgtService#querySalaryList()
	 */
	@Override
	public List<Salary> querySalaryList(SalaryDto salaryDto) {
		return this.financeMgtMapper.querySalaryList(salaryDto);
	}

	/*
	 * (non-Javadoc)
	 * @see sley.finance.service.FinanceMgtService#queryMySalary(sley.finance.dto.SalaryDto)
	 */
	@Override
	public Salary queryMySalary(SalaryDto salaryDto) {
		return this.financeMgtMapper.queryMySalary(salaryDto);
	}

	/*
	 * (non-Javadoc)
	 * @see sley.finance.service.FinanceMgtService#deleteSalary(sley.finance.dto.SalaryDto)
	 */
	@Override
	public void deleteSalary(SalaryDto salaryDto) {
		this.financeMgtMapper.deleteSalary(salaryDto);
	}

}
