package org.nocoder.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.nocoder.mapper.DictMapper;
import org.nocoder.mapper.DictTypeMapper;
import org.nocoder.model.Dict;
import org.nocoder.model.DictExample;
import org.nocoder.model.DictType;
import org.nocoder.model.DictTypeExample;
import org.nocoder.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DictServiceImpl implements DictService {
	@Autowired
	private DictMapper dictMapper;
	@Autowired
	private DictTypeMapper dictTypeMapper;

	private List<DictType> dictTypeList;
	private List<Dict> dictList;

	@PostConstruct
	public void initDict() {
		dictTypeList = dictTypeMapper.selectByExample(new DictTypeExample());
		dictList = dictMapper.selectByExample(new DictExample());
	}

	/**
	 * 通过DictPid获取dict集合
	 */
	@Override
	public List<Dict> getDictsByPid(String dictPid) {
		List<Dict> resDicts = new ArrayList<Dict>();
		List<Dict> dictList = this.getDictList();
		if (dictList != null && dictList.size() > 0) {
			for (Dict dict : dictList) {
				if (dict != null && dict.getDictPid().equals(dictPid)) {
					resDicts.add(dict);
				}
			}
		}
		return resDicts;
	}

	@Override
	public List<DictType> getDictTypeList() {
		return dictTypeList;
	}

	@Override
	public void setDictTypeList(List<DictType> dictTypeList) {
		this.dictTypeList = dictTypeList;
	}

	@Override
	public List<Dict> getDictList() {
		return dictList;
	}

	@Override
	public void setDictList(List<Dict> dictList) {
		this.dictList = dictList;
	}

}
