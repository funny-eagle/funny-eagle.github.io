package org.nocoder.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.nocoder.mapper.ArchiveMapper;
import org.nocoder.model.Archive;
import org.nocoder.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArchiveServiceImpl implements ArchiveService {
	private final Logger logger = Logger.getLogger(ArchiveServiceImpl.class);

	@Autowired
	private ArchiveMapper archiveMapper;

    public List<Archive> queryArchiveList(String state, String tag, Integer pageNum, Integer pageSize) {
    	Map<String, Object> paramsMap = new HashMap<String, Object>();
    	paramsMap.put("state", state);
    	paramsMap.put("tag", tag);
    	paramsMap.put("limit", pageSize);
    	paramsMap.put("offset", pageSize * (pageNum - 1));
		List<Archive> list = this.archiveMapper.selectArchives(paramsMap);
		return list;
	}

	/**
	 * 根据日期查找文章列表
	 * @param time
	 * @return
     */
	public List<Archive> queryArchiveListByCreateTime(String time){
		//List<Archive> list = this.ArchiveMapper.queryArchiveListByCreateTime(time);
		return null;
	}

	public int countArchives(String tag) {
		return archiveMapper.selectCountArchives(tag);
	}

	public int saveArchive(Archive archive) {
		int resCount = 0;
		if (archive == null) return resCount;
		if(archive.getPreview() != null){
			//可以替换大部分空白字符， 不限于空格    
			// \s 可以匹配空格、制表符、换页符等空白字符的其中任意一个
			archive.setPreview(archive.getPreview().replaceAll("\\s*", ""));
		}
		if (StringUtils.isBlank(archive.getId())) {
			archive.setId(UUID.randomUUID().toString().replace("-", ""));
			archive.setCreateTime(new Date());
			resCount = this.archiveMapper.insertSelective(archive);
			if (resCount > 0) {
				this.logger.debug("====>新增文章 " + archive.getTitle() + "成功！");
			}
		} else {
			archive.setUpdateTime(new Date());
			resCount = this.archiveMapper.updateByPrimaryKeySelective(archive);
			if (resCount > 0) {
				this.logger.debug("====>修改文章 " + archive.getTitle() + "成功！");
			}
		}
		return resCount;
	}

	/**
	 * 根据ID查询文档
	 * @param id
	 * @param type 1：表示前台用，不查询markdown内容
     * @return
     */
	public Archive queryArchiveById(String id, int type) {
		if (StringUtils.isBlank(id)) {
			return null;
		}
		if(type == 1){
			return this.archiveMapper.selectArchiveById(id);
		}
		return this.archiveMapper.selectByPrimaryKey(id);
	}

	@Override
    @PostConstruct
	public void setArchiveTimeListToRedis() {
//		Jedis jedis = RedisUtils.getJedis();
//		jedis.set("timeList".getBytes(), SerializeUtil.serializeList(this.ArchiveMapper.getArchiveTimeList()));
//		jedis.close();
	}

	@Override
    @PostConstruct
	public void setArchiveTagListToRedis() {
//        Jedis jedis = RedisUtils.getJedis();
//        jedis.set("tagList".getBytes(), SerializeUtil.serializeList(this.ArchiveMapper.getArchiveTagList()));
//        jedis.close();
	}

	@Override
	@PostConstruct
	public void setRecently10ArchivesListToRedis(){
//        Jedis jedis = RedisUtils.getJedis();
//        jedis.set("recently10ArchivesList".getBytes(), SerializeUtil.serializeList(this.ArchiveMapper.queryRecently10ArchivesList()));
//        jedis.close();
	}

	/**
	 * 根据标签查找文章列表
	 * @param tag
	 * @return
     */
	@Override
	public List<Archive> queryArchiveListByTag(String tag) {
		//List<Archive> list = this.ArchiveMapper.queryArchiveListByTag(tag);
		//return list;
		return null;
	}

	@Override
	public int deleteArchiveById(String id) {

		return this.archiveMapper.deleteByPrimaryKey(id);
	}


    @Override
    public List<String> getTagList() {
        //Jedis jedis = RedisUtils.getJedis();
        //return (List<String>) SerializeUtil.unserializeList(jedis.get("tagList".getBytes()));
    	return null;
    }

    @Override
    public List<String> getTimeList(){
		//Jedis jedis = RedisUtils.getJedis();
		//return (List<String>) SerializeUtil.unserializeList(jedis.get("timeList".getBytes()));
    	return null;
    }

	@Override
	public List<Archive> getRecently10ArchivesList(){
        //Jedis jedis = RedisUtils.getJedis();
        //return (List<Archive>) SerializeUtil.unserializeList(jedis.get("recently10ArchivesList".getBytes()));
		return null;
	}


}
