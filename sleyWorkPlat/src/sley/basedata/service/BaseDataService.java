/**     
 * @discription hisdb系統用戶操作業務接口
 * @author wangli       
 * @created 2014年9月12日 下午2:46:51    
 * tags     
 * see_to_target     
 */
package sley.basedata.service;

import java.util.List;

import sley.basedata.dto.DepartDto;
import sley.basedata.dto.LoginDto;
import sley.basedata.dto.RightQueryDto;
import sley.basedata.dto.UserQueryDto;
import sley.basedata.model.BaseData;
import sley.basedata.model.Depart;
import sley.basedata.model.Param;
import sley.basedata.model.Right;
import sley.basedata.model.User;


/**
 * 
 * Title: UserMgntService.java Description: 系統用戶操作業務接口
 * 
 * @author wangli
 * @created 2014年9月12日 下午3:07:01
 */
public interface BaseDataService {
	/**
	 * 
	 * @discription 根據人員編號獲取用戶信息
	 * @author wangli
	 * @created 2014年9月12日 下午3:07:15
	 * @param loginDto
	 *            用戶登錄dto
	 * @return
	 */
	public User checkUser(LoginDto loginDto);
	
	public User findUserByUserId(String userid);
	
	public void updatePassword(User user);
	
	public List<Right> queryUserFirstRight(String userId);
	
	public List<Right> querySubRight(RightQueryDto rqd);
	
	public List<User> queryUsersByCondition(UserQueryDto uqd);
	
	public void addUser(User user);

	public String getParamValue(String name);
	
	public void updateParamValue(Param param);
	
	public void updateLoginTime(LoginDto loginDto);
	
	public List<BaseData> queryBaseDataByTypeId(String typeId);
	
	public void initInfo(User user);
	
	public User queryUserByMasterId(String masterId);
	
	public List<Depart> queryDepartList(DepartDto dd);
	
	public List<Depart> queryDepartByParent(DepartDto dd);
	
	public void updateMyInfo(User user);
	
}