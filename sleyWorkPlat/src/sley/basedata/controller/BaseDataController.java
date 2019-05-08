/**
 * 
 */
package sley.basedata.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sley.basedata.dto.DepartDto;
import sley.basedata.dto.RightQueryDto;
import sley.basedata.dto.UserQueryDto;
import sley.basedata.model.BaseData;
import sley.basedata.model.Depart;
import sley.basedata.model.Param;
import sley.basedata.model.Right;
import sley.basedata.model.User;
import sley.basedata.service.BaseDataService;
import sley.common.GeneratePramValue;
import sley.common.Pager;
import sley.common.SmConstant;

/**
 * @author wangli
 * 
 */
@Controller
public class BaseDataController {

	private static Logger logger = Logger.getLogger(BaseDataController.class);
	@Autowired
	private BaseDataService baseDataService;// 注入业务处理类

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest request) {
		return SmConstant.MAIN;
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/left", method = RequestMethod.GET)
	public String left(Model model, HttpServletRequest request) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		// 根据登陆用户查找对应的菜单权限
		List<Right> rightList = this.baseDataService
				.queryUserFirstRight(loginUser.getMasterId());
		RightQueryDto rqd = new RightQueryDto();
		// rqd.setUserId(loginUser.getUserId());
		rqd.setMasterId(loginUser.getMasterId());
		for (Right rt : rightList) {
			List<Right> subRightList = new ArrayList<Right>();
			rqd.setRightId(rt.getRightId());
			subRightList = this.baseDataService.querySubRight(rqd);
			rt.setSubRightList(subRightList);
		}
		model.addAttribute("rightList", rightList);
		return SmConstant.LEFT;
	}

	/**
	 * 
	 * @param model
	 * @param uqd
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryUserList", method = RequestMethod.GET)
	public String queryUserList(Model model, UserQueryDto uqd,
			HttpServletRequest request) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if (uqd.getPager() == null) {
			uqd.setPager(new Pager());
		}
		// 根据条件查询用户
		List<User> userList = this.baseDataService.queryUsersByCondition(uqd);
		model.addAttribute("userList", userList);
		String valid = "1";
		String levl = "1";
		DepartDto dd = new DepartDto();
		dd.setValid(valid);
		dd.setLevl(levl);
		// 查询科室列表
		List<Depart> departList = this.baseDataService.queryDepartList(dd);
		model.addAttribute("uqd", uqd);
		model.addAttribute("departList", departList);
		// 查询职称列表
		String typeId = "01";// 学历
		List<BaseData> degreeList = this.baseDataService
				.queryBaseDataByTypeId(typeId);
		model.addAttribute("degreeList", degreeList);
		model.addAttribute(SmConstant.REQUEST_ATTRIBUTE_PAGER, uqd.getPager());
		model.addAttribute("num", uqd.getPager().getTotalSize());
		return SmConstant.USERList;
	}

	/**
	 * 跳转到添加用户信息页面
	 * 
	 * @param model
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toAddUserPage", method = RequestMethod.GET)
	public String toAddUserPage(Model model, User user,
			HttpServletRequest request) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		user.setDepartName(loginUser.getDepartName());
		// flag=1表示该页面为新增物品后的页面，則給出保存成功的提示信息
		String flag = request.getParameter("flag");
		if (flag != null && flag.equals("1")) {
			model.addAttribute("tip", "保存成功!");
		}
		model.addAttribute("user", user);
		return SmConstant.USERADD;
	}

	/**
	 * 
	 * @param request
	 * @param nurseInfo
	 * @return
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(HttpServletRequest request, User user) {
		// 获取userID,并更新编号
		String masterId = this.baseDataService.getParamValue("masterId");
		int newMasterId = Integer.parseInt(masterId.trim()) + 1;
		Param param = new Param();
		param.setName("masterId");
		param.setValue(String.valueOf(newMasterId));
		this.baseDataService.updateParamValue(param);
		String masterIds = new GeneratePramValue().generateParamId(masterId
				.trim());
		user.setMasterId(masterIds);
		user.setState("1");//state=1:表示新增用户，账户可以
		// 先將业务数据存储进去
		this.baseDataService.addUser(user);
		return "redirect:toAddUserPage?flag=1";
	}

	/**
	 * 
	 * @param model
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toSetPassword", method = RequestMethod.GET)
	public String toSetPassword(Model model, User user,
			HttpServletRequest request) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		user = this.baseDataService.findUserByUserId(loginUser.getUserId());
		model.addAttribute("oldPassword", user.getPassword());
		loginUser.setPassword("");
		model.addAttribute("user", loginUser);
		return SmConstant.setPassword;
	}

	/**
	 * 
	 * @param model
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/setPassword", method = RequestMethod.POST)
	public String setPassword(Model model, User user, HttpServletRequest request) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		user.setUserId(loginUser.getUserId());
		this.baseDataService.updatePassword(user);
		user = new User();
		model.addAttribute("user", user);
		model.addAttribute("tip", "修改成功！");
		return SmConstant.setPassword;

	}

	/**
	 * 首次登陆初始化信息
	 * 
	 * @param model
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/initInfo", method = RequestMethod.POST)
	@ResponseBody
	public String initInfo(Model model, User user, HttpServletRequest request) {
		String birthDate = request.getParameter("birthDate");
		String sex = request.getParameter("sex");
		user.setBirthDate(birthDate);
		user.setSex(sex);
		this.baseDataService.initInfo(user);
		return "success";
	}

	/**
	 * 
	 * @param model
	 * @param uqd
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryUserByMasterId", method = RequestMethod.GET)
	public String queryUserByMasterId(Model model, UserQueryDto uqd,
			HttpServletRequest request) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		User user = this.baseDataService.queryUserByMasterId(loginUser
				.getMasterId());
		model.addAttribute("user", user);
		return SmConstant.userInfo;
	}

	/**
	 * 
	 * @param groupName
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryDepartByParent", method = RequestMethod.GET)
	@ResponseBody
	public List<Depart> queryDepartByParent(String parentDepartId, Model model,
			HttpServletRequest request) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		String valid = "1";
		String levl = "1";
		DepartDto dd = new DepartDto();
		dd.setValid(valid);
		dd.setParentDepartId(parentDepartId);
		List<Depart> departList = this.baseDataService.queryDepartByParent(dd);
		return departList;
	}

	/**
	 * 
	 * @param model
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/updateUserById", method = RequestMethod.POST)
	public String updateUserById(Model model, User user,
			HttpServletRequest request) {
		this.baseDataService.updateMyInfo(user);
		user = this.baseDataService.findUserByUserId(user.getUserId());
		model.addAttribute("tip", "保存成功!");
		model.addAttribute("user", user);
		return SmConstant.userInfo;
	}

}
