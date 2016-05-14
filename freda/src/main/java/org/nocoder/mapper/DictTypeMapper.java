package org.nocoder.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.nocoder.model.DictType;
import org.nocoder.model.DictTypeExample;

public interface DictTypeMapper {
    int countByExample(DictTypeExample example);

    int deleteByExample(DictTypeExample example);

    int deleteByPrimaryKey(String dicPid);

    int insert(DictType record);

    int insertSelective(DictType record);

    List<DictType> selectByExample(DictTypeExample example);

    DictType selectByPrimaryKey(String dicPid);

    int updateByExampleSelective(@Param("record") DictType record, @Param("example") DictTypeExample example);

    int updateByExample(@Param("record") DictType record, @Param("example") DictTypeExample example);

    int updateByPrimaryKeySelective(DictType record);

    int updateByPrimaryKey(DictType record);
}