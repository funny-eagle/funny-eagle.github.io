package org.nocoder.freda.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.nocoder.mapper.ArchiveMapper;
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
		System.out.println("文档："+mapper.selectArchives().size());
	}
}
