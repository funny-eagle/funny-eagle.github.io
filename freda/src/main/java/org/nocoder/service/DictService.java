package org.nocoder.service;

import java.util.List;

import org.nocoder.model.Dict;
import org.nocoder.model.DictType;

public interface DictService {

	/**
	 * 通过DictPid获取dict集合
	 */
	List<Dict> getDictsByPid(String dictPid);

	List<DictType> getDictTypeList();

	void setDictTypeList(List<DictType> dictTypeList);

	List<Dict> getDictList();

	void setDictList(List<Dict> dictList);

}
