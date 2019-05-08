/**     
 * @discription 用户登陆伙食计费系统，在hisdb库中进行校验
 * @author wangli       
 * @created 2014年9月12日 下午2:46:51    
 * tags     
 * see_to_target     
 */
package sley.basedata.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import sley.basedata.dto.LoginDto;
import sley.basedata.model.BaseData;
import sley.basedata.model.Depart;
import sley.basedata.model.User;
import sley.basedata.service.BaseDataService;
import sley.common.SmConstant;

/**
 * 
 * Title: LoginController.java Description: 登陆验证控制器
 * 
 * @author wangli
 * @created 2014年9月12日 下午2:47:42
 */
@Controller
public class LoginController {

	private static Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	private BaseDataService baseDataService;// 注入业务处理类

	public void setLoginUser(HttpServletRequest request, Model model) {
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			model.addAttribute("isLogin", 0);
		} else {
			model.addAttribute("isLogin", 1);
		}
		model.addAttribute("loginUser", loginUser);
	}

	/**
	 * 
	 * @discription 请求用户登录页面
	 * @author wangli
	 * @created 2014年9月12日 下午2:54:22
	 * @param model
	 * @param request
	 * @return 登陸頁面視圖
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {
		LoginDto loginDto = new LoginDto();
		model.addAttribute("loginDto", loginDto);
		return SmConstant.LOGIN;
	}

	/**
	 * 登陆异常处理控制器
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(Model model, HttpServletRequest request) {
		model.addAttribute("errorTip", "登陆超时，请重新登陆!");
		return "loginError";
	}

	/**
	 * 
	 * @discription 点击登陆，进入用户操作页面
	 * @author wangli
	 * @created 2014年9月12日 下午2:53:39
	 * @param loginDto
	 *            用戶登錄信息dto
	 * @param model
	 * @return 用戶操作頁面視圖
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String tologin(LoginDto loginDto, Model model,
			HttpServletRequest request) {
		model.addAttribute("loginDto", loginDto);
		User loginUser = new User();
		User user = baseDataService.findUserByUserId(loginDto.getUserId());
		// User user =userMgntService.checkUser(loginDto);
		if (loginDto != null && user != null) {
			loginUser.setMasterId(user.getMasterId());
			loginUser.setUserId(loginDto.getUserId());
			loginUser.setPassword(loginDto.getPassword());
			loginUser.setUserName(user.getUserName());
			loginUser.setDepartName(user.getDepartName());
			model.addAttribute("loginUser", loginUser);
			request.getSession().setAttribute("loginUser", loginUser);
			this.setLoginUser(request, model);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String nowDate = sdf.format(date);
			//更新登陆时间
			loginDto.setLoginTime(nowDate);
			this.baseDataService.updateLoginTime(loginDto);
			String flag="";
			if(user.getInitFlag()==null||user.getInitFlag().equals("")){ //如果InitFlag为空，则说明未填写初始化信息
				flag="1";
			}
			if(flag.equals("1")){
				user.setFlag(flag);
				model.addAttribute("user", user);
				String valid="1";
				String levl="1";
				DepartDto dd=new DepartDto();
				dd.setValid(valid);
				dd.setLevl(levl);
				//查询科室列表
				List<Depart> departList=this.baseDataService.queryDepartList(dd);
				//查询职称列表
				String typeId="01";//学历
				List<BaseData> degreeList=this.baseDataService.queryBaseDataByTypeId(typeId);
			    typeId="02";
				List<BaseData> titleList=this.baseDataService.queryBaseDataByTypeId(typeId);
				model.addAttribute("degreeList", degreeList);
				model.addAttribute("titleList", titleList);
				model.addAttribute("departList", departList);
				return SmConstant.InitInfo;
				//return "redirect:toSetPassword?flag=1";
			}else{
				return SmConstant.INDEX;
			}
		
			
		} else {
			model.addAttribute("errorTip", "用户名或密码错误,或您无权登陆该系统，登陆失败！");
			return "error";
		}

	}

	/**
	 * 
	 * @discription 根据用户编号获取用户信息
	 * @author wangli
	 * @created 2014年9月12日 下午2:52:52
	 * @param rybh
	 *            用戶編號
	 * @return User 用戶對象
	 * @throws Exception
	 */
	@RequestMapping(value = "/getUserByRybh", method = RequestMethod.POST)
	@ResponseBody
	public User getUserByRybh(String userId, String password) throws Exception {
		LoginDto loginDto = new LoginDto();
		loginDto.setUserId(userId);
		//loginDto.setPassword(password);
		User user = baseDataService.checkUser(loginDto);
		return user;
	}

	/**
	 * 退出系统
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/loginOut", method = RequestMethod.GET)
	public String loginOut(Model model, LoginDto loginDto,
			HttpServletRequest request) {
		request.getSession().removeAttribute("loginUser");
		this.setLoginUser(request, model);
		model.addAttribute("loginDto", new LoginDto());
		return SmConstant.LOGIN;
	}
	



}
