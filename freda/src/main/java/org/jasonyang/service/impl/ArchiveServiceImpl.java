package org.jasonyang.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.jasonyang.enumeration.ArchiveStatus;
import org.jasonyang.mapper.ArchiveMapper;
import org.jasonyang.model.Archive;
import org.jasonyang.redis.RedisUtils;
import org.jasonyang.service.ArchiveService;
import org.jasonyang.utils.SerializeUtil;
import org.jasonyang.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

@Service
public class ArchiveServiceImpl implements ArchiveService {
    private final Logger logger = Logger.getLogger(ArchiveServiceImpl.class);

    @Autowired
    private ArchiveMapper archiveMapper;

    @Override
    public List<Archive> queryArchiveList(int state, String tag, Integer pageNum, Integer pageSize) {
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
     *
     * @param time
     * @return
     */
    public List<Archive> queryArchiveListByCreateTime(String time) {
        //List<Archive> list = this.ArchiveMapper.queryArchiveListByCreateTime(time);
        return null;
    }

    @Override
    public int countArchives(Map<String, Object> paramsMap) {
        return archiveMapper.selectCountArchives(paramsMap);
    }

    @Override
    public int saveArchive(Archive archive) {
        int resCount = 0;
        if (archive == null) {
            return resCount;
        }

        if (StringUtils.isBlank(archive.getId())) {
            archive.setId(UUIDUtil.getUUID());
            archive.setCreateTime(new Date());
            resCount = this.archiveMapper.insertSelective(archive);
        } else {
            archive.setUpdateTime(new Date());
            resCount = this.archiveMapper.updateByPrimaryKeySelective(archive);
        }
        return resCount;
    }

    /**
     * 根据ID查询文档
     *
     * @param id
     * @param type 1：表示前台用，不查询markdown内容
     * @return
     */
    @Override
    public Archive queryArchiveById(String id, int type) {
        if (StringUtils.isBlank(id)) {
            return null;
        }
        if (type == 1) {
            return this.archiveMapper.selectArchiveById(id);
        }
        return this.archiveMapper.selectByPrimaryKey(id);
    }

    /**
     *
     */
    @Override
    @PostConstruct
    public void setAllPublishedArchivesInfoToRedis() {
        Jedis jedis = RedisUtils.getJedis();
        if (jedis == null) {
            return;
        }
        Map paramsMap = new HashMap();
        paramsMap.put("state", ArchiveStatus.PUBLISHED.getValue());
        paramsMap.put("tag", null);
        paramsMap.put("limit", 0);
        paramsMap.put("offset", 0);
        jedis.set("allArchivesInfo".getBytes(), SerializeUtil.serializeList(this.archiveMapper.selectArchives(paramsMap)));
        jedis.close();
    }


    @Override
    public int deleteArchiveById(String id) {

        return this.archiveMapper.deleteByPrimaryKey(id);
    }

    /**
     * 从缓存中获取所有文档基本信息
     *
     * @return archive list
     */
    @Override
    public List<Archive> getAllPublishedArchivesInfo() {
        Jedis jedis = RedisUtils.getJedis();
        if (jedis == null) {
            return null;
        }
        List<Archive> archiveList = (List<Archive>) SerializeUtil.unserializeList(jedis.get("allArchivesInfo".getBytes()));
        jedis.close();
        return archiveList;
    }

}
