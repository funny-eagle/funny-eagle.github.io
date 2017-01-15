package org.nocoder.freda.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.nocoder.mapper.ArchiveMapper;
import org.nocoder.model.Archive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"}) 
public class MapperTest {
	@Autowired
	private ArchiveMapper mapper;
	
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
}
