package com.stk.util;

import javax.servlet.http.HttpSession;

import org.junit.Test;

import com.bcloud.msg.http.HttpSender;

public class HttpSenderUtils {
	//6位随机数
	
	 public static String createRandomVcode(){
	        //验证码
	        String vcode ="";
	        for (int i = 0; i < 6; i++) {
	            vcode = vcode + (int)(Math.random() * 9);
	        }
	        System.out.println(vcode);
	       // session.setAttribute("vcode", vcode);
	        return vcode;
	    }
}

