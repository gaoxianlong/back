package Junit;

import static org.junit.Assert.*;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

public class TestJunit {

	@RunWith(SpringJUnit4ClassRunner.class)    
	@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})   
	public class test {
	
	}

}
