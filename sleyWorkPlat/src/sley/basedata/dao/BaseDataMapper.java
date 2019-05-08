/**     
 * @discription hisdb數據庫人員定義表操作DAO接口
 * @author wangli       
 * @created 2014年9月12日 下午2:46:51    
 * tags     
 * see_to_target     
 */
package sley.basedata.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

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
 * Title: UserMapper.java Description: hisdb數據庫人員定義表操作DAO接口
 * 
 * @author wangli
 * @created 2014年9月12日 下午2:58:35
 */
@Repository
public interface BaseDataMapper {
	/**
	 * 
	 * @discription 根據用戶編號獲取用戶信息
	 * @author wangli
	 * @created 2014年9月12日 下午2:59:47
	 * @param loginDto
	 * @return 返回查詢的用戶列表
	 */
	public List<User> checkUser(LoginDto loginDto);

	public User findUserByUserId(String userid);
	
	public void updatePassword(User user);
	
	public List<Right> queryUserFirstRight(String userId);
	
	public List<Right> querySubRight(RightQueryDto rqd);
	
	public int countUsersByCondition(UserQueryDto uqd);
	
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
	
	public void updateUserById(User user);
	
	public void updateMyInfo(User user);

}