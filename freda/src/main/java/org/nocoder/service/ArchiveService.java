package org.nocoder.service;

import java.util.List;

import org.nocoder.model.Archive;

public abstract interface ArchiveService {

	/**
	 * 
	 * @param state    文档状态
	 * @param tag      文档标签
	 * @param pageNum  页数
	 * @param pageSize 每页行数 
	 * @return
	 */
	public abstract List<Archive> queryArchiveList(int state, String tag, Integer pageNum, Integer pageSize);

	public abstract int countArchives(String paramString);

	public abstract int saveArchive(Archive paramArchive);

	public abstract Archive queryArchiveById(String paramString);

    /**
     * 从数据库查询时间列表保存到redis缓存
     * @return
     */
	public void setArchiveTimeListToRedis();

    /**
     * 从数据库查询标签列表保存到redis缓存
     * @return
     */
	public void setArchiveTagListToRedis();

	/**
	 * 按创建日期查询文章
	 * @param time
	 * @return
     */
	public List<Archive> queryArchiveListByCreateTime(String time);
	
	public List<Archive> queryArchiveListByTag(String tag);
	
	public int deleteArchiveById(String id);

	/**
	 * 最近10篇文章
	 * @return
     */
	public void setRecently10ArchivesListToRedis();

    /**
     * 从缓存读取标签列表
     * @return
     */
    public List<String> getTagList();

    /**
     * 从缓存读取时间列表
     * @return
     */
    public List<String> getTimeList();

	/**
	 * 从缓存读取最近10篇文章
	 * @return
     */
	public List<Archive> getRecently10ArchivesList();
}
