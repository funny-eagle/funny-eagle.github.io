package org.nocoder.service.impl;

import java.util.Date;
import java.util.List;
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

    public List<Archive> queryArchiveList(int state, String tag, Integer pageNum, Integer pageSize) {
		List<Archive> list = this.archiveMapper.selectArchives();
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

	public int saveArchive(Archive Archive) {
		int resCount = 0;
		if (StringUtils.isBlank(Archive.getId())) {
			Archive.setId(UUID.randomUUID().toString().replace("-", ""));
			Archive.setCreateTime(new Date());
			resCount = this.archiveMapper.insertSelective(Archive);
			if (resCount > 0) {
				this.logger.debug("====>新增文章 " + Archive.getTitle() + "成功！");
			}
		} else {
			Archive.setUpdateTime(new Date());
			resCount = this.archiveMapper.updateByPrimaryKeySelective(Archive);
			if (resCount > 0) {
				this.logger.debug("====>修改文章 " + Archive.getTitle() + "成功！");
			}
		}
		return resCount;
	}

	public Archive queryArchiveById(String id) {
//		if (StringUtils.isNotBlank(id)) {
//			ArchiveExample example = new ArchiveExample();
//			example.createCriteria().andIdEqualTo(id);
//			List<Archive> Archives = this.ArchiveMapper.selectByExample(example);
//			return (Archives != null) && (Archives.size() > 0) ? (Archive) Archives.get(0) : null;
//		}
		return null;
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
