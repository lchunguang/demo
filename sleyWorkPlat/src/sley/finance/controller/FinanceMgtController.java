/**
 * 
 */
package sley.finance.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sley.basedata.model.User;
import sley.common.DateUtil;
import sley.common.SmConstant;
import sley.finance.dto.SalaryDto;
import sley.finance.model.Salary;
import sley.finance.service.FinanceMgtService;

/**
 * @author wangli
 * 
 */
@Controller
public class FinanceMgtController {

	private static Logger logger = Logger.getLogger(FinanceMgtController.class);
	@Autowired
	private FinanceMgtService financeMgtService;// 注入业务处理类

	/**
	 * 跳转到导入工资条页面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "toImportSalary", method = RequestMethod.GET)
	public String toImportSalary(Model model, SalaryDto salaryDto,
			HttpServletRequest request) {
		String userType = request.getParameter("userType");
		String msg = request.getParameter("msg");
		String year = "";
		String month = "";
		if (msg != null && !msg.equals("")) {
			year = request.getParameter("year");
			month = request.getParameter("month");
		} else {
			String ym="";
			if(userType!=null && userType.equals("1")){
				 ym = DateUtil.getCurrentMonth();
			}else{
				ym = DateUtil.getLastMonth();
			}
			
			year = ym.split("-")[0];
			month = ym.split("-")[1];
		}
		salaryDto.setYear(year);
		salaryDto.setMonth(month);
		salaryDto.setUserType(userType);
		List<Salary> salaryList = this.financeMgtService
				.querySalaryList(salaryDto);
		model.addAttribute("salaryDto", salaryDto);
		model.addAttribute("salaryList", salaryList);
		if (userType != null && userType.equals("1")) {// 表示导入在编人员
			return SmConstant.importGovExcel;
		} else if (userType != null && userType.equals("2")) {// 合同制
			return SmConstant.importConExcel;
		} else { // 同工同酬 3
			return SmConstant.importConExcel1;
		}
	}

	/**
	 * 批量导入工资条
	 * 
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "batchImport", method = RequestMethod.POST)
	public String batchimport(
			@RequestParam(value = "filename") MultipartFile file, Model model,
			SalaryDto salaryDto, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("FinanceMgtController ..batchExcelimport() start");
		// 判断文件是否为空
		if (file == null)
			return null;
		// 获取文件名
		String name = file.getOriginalFilename();
		// 进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
		long size = file.getSize();
		if (name == null || ("").equals(name) && size == 0)
			return null;

		// 批量导入。参数：文件名，文件。
		boolean b = financeMgtService.batchImport(salaryDto, name, file);
		String Msg = "";
		if (b) {
			Msg = "批量导入EXCEL成功！";
			request.getSession().setAttribute("msg", Msg);
		} else {
			Msg = "批量导入EXCEL失败！";
			request.getSession().setAttribute("msg", Msg);
		}
		model.addAttribute("salaryDto", salaryDto);
		return "redirect:toImportSalary?msg=" + Msg + "&year="
				+ salaryDto.getYear() + "&month=" + salaryDto.getMonth()
				+ "&userType=" + salaryDto.getUserType();
	}

	/**
	 * 
	 * @param model
	 * @param salaryDto
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryMySalary", method = RequestMethod.GET)
	public String queryMySalary(Model model, SalaryDto salaryDto,
			HttpServletRequest request) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		String flag = request.getParameter("flag");
		String year = "";
		String month = "";
		if (flag != null && flag.equals("1")) {
			String ym = DateUtil.getCurrentMonth();
			year = ym.split("-")[0];
			month = ym.split("-")[1];
		} else {
			year =  request.getParameter("year");
			month = request.getParameter("month");
		}
		salaryDto.setYear(year);
		salaryDto.setMonth(month);
		salaryDto.setUserId(loginUser.getUserId());
		Salary salary=this.financeMgtService.queryMySalary(salaryDto);
		model.addAttribute("salary", salary);
		model.addAttribute("month", month);
		return SmConstant.mySalary;
	}
	
	
	/**
	 * 
	 * @param model
	 * @param salaryDto
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/querySalary", method = RequestMethod.GET)
	public String querySalary(Model model, SalaryDto salaryDto,
			HttpServletRequest request) {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String userType = request.getParameter("userType");
		salaryDto.setYear(year);
		salaryDto.setMonth(month);
		salaryDto.setUserType(userType);
		List<Salary> salaryList = this.financeMgtService
				.querySalaryList(salaryDto);
		model.addAttribute("salaryDto", salaryDto);
		model.addAttribute("salaryList", salaryList);
		if (userType != null && userType.equals("1")) {// 表示在编人员
			return SmConstant.importGovExcel;
		} else if (userType != null && userType.equals("2")) {//合同制
			return SmConstant.importConExcel;
		} else { // 同工同酬 3
			return SmConstant.importConExcel1;
		}
	}
	
	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String download(Model model,
			HttpServletRequest request) {
		String userType = request.getParameter("userType");
		if(userType!=null&&userType.equals("1")){
			request.setAttribute("docLoction","D:/fileupload/正式人员工资模板.xlsx");
			request.setAttribute("fileName", "正式人员工资模板.xlsx"
					+ "");
		}else{
			request.setAttribute("docLoction","D:/fileupload/合同人员工资模版.xlsx");
			request.setAttribute("fileName", "合同人员工资模板.xlsx"
					+ "");
		}
		return SmConstant.download;
	}
	
	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/deleteSalary", method = RequestMethod.GET)
	public String deleteSalary(Model model,SalaryDto salaryDto,
			HttpServletRequest request) {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String userType = request.getParameter("userType");
		salaryDto.setYear(year);
		salaryDto.setMonth(month);
		salaryDto.setUserType(userType);
		this.financeMgtService.deleteSalary(salaryDto);
		return "redirect:querySalary?year="+year+"&month="+month+"&userType="+userType;
	}

}
