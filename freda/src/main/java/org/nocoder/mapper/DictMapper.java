package org.nocoder.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.nocoder.model.Dict;
import org.nocoder.model.DictExample;

public interface DictMapper {
    int countByExample(DictExample example);

    int deleteByExample(DictExample example);

    int deleteByPrimaryKey(String dictId);

    int insert(Dict record);

    int insertSelective(Dict record);

    List<Dict> selectByExample(DictExample example);

    Dict selectByPrimaryKey(String dictId);

    int updateByExampleSelective(@Param("record") Dict record, @Param("example") DictExample example);

    int updateByExample(@Param("record") Dict record, @Param("example") DictExample example);

    int updateByPrimaryKeySelective(Dict record);

    int updateByPrimaryKey(Dict record);
}