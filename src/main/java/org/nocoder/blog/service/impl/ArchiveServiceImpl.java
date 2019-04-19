package org.nocoder.blog.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.nocoder.blog.mapper.ArchiveMapper;
import org.nocoder.blog.model.Archive;
import org.nocoder.blog.service.ArchiveService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ArchiveServiceImpl implements ArchiveService {
    private final Logger logger = LoggerFactory.getLogger(ArchiveServiceImpl.class);

    @Autowired
    private ArchiveMapper archiveMapper;

    @Override
    public List<Archive> queryArchiveList(int state, String tag, Integer pageNum, Integer sizePerPage) {
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("state", state);
        paramsMap.put("tag", tag);
        paramsMap.put("offset", (pageNum-1) * sizePerPage);
        paramsMap.put("size", sizePerPage);
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
            archive.setCreateTime(new Date().toString());
            resCount = this.archiveMapper.insertSelective(archive);
        } else {
            archive.setUpdateTime(new Date().toString());
            resCount = this.archiveMapper.updateByPrimaryKeySelective(archive);
        }
        return resCount;
    }

    /**
     * 根据ID查询文档
     *
     * @param id
     * @return
     */
    @Override
    public Archive queryArchiveById(String id) {
        if (StringUtils.isBlank(id)) {
            return null;
        }
        return this.archiveMapper.selectById(id);
    }

    /**
     * 根据ID查询文档
     * <p>
     * 不查询markdown内容
     *
     * @param id
     * @return
     */
    @Override
    public Archive queryWithoutMdContentArchiveById(String id) {
        if (StringUtils.isBlank(id)) {
            return null;
        }
        return this.archiveMapper.selectWithoutMdContentArchiveById(id);
    }

    @Override
    public int deleteArchiveById(String id) {
        return this.archiveMapper.deleteByPrimaryKey(id);
    }

}
