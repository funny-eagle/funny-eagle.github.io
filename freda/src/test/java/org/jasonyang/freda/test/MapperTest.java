package org.jasonyang.freda.test;

import org.junit.runner.RunWith;
import org.jasonyang.mapper.ArchiveMapper;
import org.jasonyang.mapper.UserMapper;
import org.jasonyang.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Test;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"}) 
public class MapperTest {
	@Autowired
	private ArchiveMapper mapper;
	
	@Autowired
	private UserMapper userMapper;
	/*
	@Test
	public void testQueryArchives(){
		Map<String, Object> paramsMap = new HashMap<String, Object>();
    	paramsMap.put("state", "2");
    	paramsMap.put("tag", "java");
    	paramsMap.put("limit", 10);
    	paramsMap.put("offset", 10 * (2 - 1));
		List<Archive> archiveList = mapper.selectArchives(paramsMap);
		for (Archive archive : archiveList) {
			System.out.println(archive.getTitle());
		}
	}
	*/
	
	@Test
	public void testQueryUsers(){
		User user = (User)userMapper.selectUserByName("jason");
		System.out.println(user.getUsername());
	}
}
