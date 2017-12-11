package Junit;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.stk.dao.BackUserDao;
import com.stk.entity.Playrecord;
import com.stk.entity.Users;
import com.stk.service.BackUserService;

public class Record extends TestJunit {

	@Autowired
    private BackUserDao dao;
	@Test
    public void test0(){  
        System.out.println("第一个测试方法*******");  
        
        //BackUserService bs=new BackUserService();
       
        //Playrecord pl=dao.getvideodetaa(1121);
        
       // System.out.println(pl.toString());
        
        
        Users u=(Users) dao.seluserlik(".");
        System.out.println(u);
    }  
}
