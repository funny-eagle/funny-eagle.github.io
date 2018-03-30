package org.jasonyang.mapper;

import org.jasonyang.model.User;
import org.springframework.stereotype.Repository;

/**
 * 用户mapper接口
 *
 * @author jason
 */
@Repository
public interface UserMapper {
    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    int deleteByPrimaryKey(String id);

    /**
     * 插入用户
     *
     * @param record
     * @return
     */
    int insert(User record);

    /**
     * 插入用户
     *
     * @param record
     * @return
     */
    int insertSelective(User record);

    /**
     * 根据主键查询用户
     *
     * @param id
     * @return
     */
    User selectByPrimaryKey(String id);

    /**
     * 更新用户
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * 更新用户
     *
     * @param record
     * @return
     */
    int updateByPrimaryKey(User record);

    /**
     * 根据名称查询用户
     *
     * @param username
     * @return
     */
    User selectUserByName(String username);
}