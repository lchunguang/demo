/**     
 * @discription hisdb系統用戶操作業務實現類
 * @author wangli       
 * @created 2014年9月12日 下午2:46:51    
 * tags     
 * see_to_target     
 */
package sley.basedata.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sley.basedata.dao.BaseDataMapper;
import sley.basedata.dto.DepartDto;
import sley.basedata.dto.LoginDto;
import sley.basedata.dto.RightQueryDto;
import sley.basedata.dto.UserQueryDto;
import sley.basedata.model.BaseData;
import sley.basedata.model.Depart;
import sley.basedata.model.Param;
import sley.basedata.model.Right;
import sley.basedata.model.User;
import sley.common.Pager;

/**
 * 
 * Title: UserMgntService.java Description: 系統用戶操作業務實現類
 * 
 * @author wangli
 * @created 2014年9月12日 下午3:07:01
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class BaseDataServiceImpl implements BaseDataService {
	@Autowired
	private BaseDataMapper baseDataMapper;

	/**
	 * 
	 * @discription 根據人員編號獲取用戶信息
	 * @author wangli
	 * @created 2014年9月12日 下午3:07:15
	 * @param loginDto
	 *            用戶登錄dto
	 * @return
	 */
	@Override
	public User checkUser(LoginDto loginDto) {
		List<User> userList = baseDataMapper.checkUser(loginDto);
		User user = null;
		if (userList.size() == 1) {
			return user = userList.get(0);
		} else {
			return user;
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.sley.fbs.his.service.UserMgntService#findUserByUserId(java.lang.String
	 * )
	 */
	@Override
	public User findUserByUserId(String userid) {
		return this.baseDataMapper.findUserByUserId(userid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * sley.basedata.service.UserMgntService#updatePassword(sley.basedata.model
	 * .User)
	 */
	@Override
	public void updatePassword(User user) {
		this.baseDataMapper.updatePassword(user);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * sley.basedata.service.BaseDataService#queryUserFirstRight(java.lang.String
	 * )
	 */
	@Override
	public List<Right> queryUserFirstRight(String userId) {
		return this.baseDataMapper.queryUserFirstRight(userId);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * sley.basedata.service.BaseDataService#querySubRight(sley.basedata.dto
	 * .RightQueryDto)
	 */
	@Override
	public List<Right> querySubRight(RightQueryDto rqd) {
		return this.baseDataMapper.querySubRight(rqd);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * sley.basedata.service.BaseDataService#queryUsersByCondition(sley.basedata
	 * .dto.UserQueryDto)
	 */
	@Override
	public List<User> queryUsersByCondition(UserQueryDto uqd) {
		int totalSize = this.baseDataMapper.countUsersByCondition(uqd);
		// 获取分页对象（已有参数当前页码数量），并重构
		Pager pager = uqd.getPager();
		pager.rebuild(totalSize);
		// 根据当前页码书获取查询结果记录的开始位置
		int startNumber = (pager.getCurrentPage() - 1) * pager.getPageSize();
		// 根据其实记录起始位置和每页数量，获取记录结束位置
		int endNumber = startNumber + pager.getPageSize();
		// 获取要显示的数量
		int topNumber = pager.getPageSize();
		// 如果记录结束为止比总条数打，那么重置结束位置和显示数量
		if (endNumber > totalSize) {
			endNumber = totalSize;
			topNumber = endNumber - startNumber;
		}
		uqd.setStartNumber(startNumber);
		uqd.setEndNumber(endNumber);
		uqd.setTopNumber(topNumber);
		uqd.setPager(pager);
		return this.baseDataMapper.queryUsersByCondition(uqd);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * sley.basedata.service.BaseDataService#addUser(sley.basedata.model.User)
	 */
	@Override
	public void addUser(User user) {
		this.baseDataMapper.addUser(user);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * sley.basedata.service.BaseDataService#getParamValue(java.lang.String)
	 */
	@Override
	public String getParamValue(String name) {
		return this.baseDataMapper.getParamValue(name);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see sley.basedata.service.BaseDataService#updateParamValue(Param)
	 */
	@Override
	public void updateParamValue(Param param) {
		this.baseDataMapper.updateParamValue(param);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * sley.basedata.service.BaseDataService#updateLoginTime(sley.basedata.dto
	 * .LoginDto)
	 */
	@Override
	public void updateLoginTime(LoginDto loginDto) {
		this.baseDataMapper.updateLoginTime(loginDto);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * sley.basedata.service.BaseDataService#queryBaseDataByTypeId(java.lang
	 * .String)
	 */
	@Override
	public List<BaseData> queryBaseDataByTypeId(String typeId) {
		return this.baseDataMapper.queryBaseDataByTypeId(typeId);
	}

	/*
	 * (non-Javadoc)
	 * @see sley.basedata.service.BaseDataService#initInfo(sley.basedata.model.User)
	 */
	@Override
	public void initInfo(User user) {
		this.baseDataMapper.initInfo(user);
	}

	/*
	 * (non-Javadoc)
	 * @see sley.basedata.service.BaseDataService#queryUserByMasterId(java.lang.String)
	 */
	@Override
	public User queryUserByMasterId(String masterId) {
		return this.baseDataMapper.queryUserByMasterId(masterId);
	}

	/*
	 * (non-Javadoc)
	 * @see sley.basedata.service.BaseDataService#queryDepartList(java.lang.String)
	 */
	@Override
	public List<Depart> queryDepartList(DepartDto dd) {
		return this.baseDataMapper.queryDepartList(dd);
	}

	/*
	 * (non-Javadoc)
	 * @see sley.basedata.service.BaseDataService#queryDepartByParent(sley.basedata.dto.DepartDto)
	 */
	@Override
	public List<Depart> queryDepartByParent(DepartDto dd) {
		return this.baseDataMapper.queryDepartByParent(dd);
	}

	/*
	 * (non-Javadoc)
	 * @see sley.basedata.service.BaseDataService#updateUserById(sley.basedata.model.User)
	 */
	@Override
	public void updateMyInfo(User user) {
		this.baseDataMapper.updateMyInfo(user);
		
	}
}
