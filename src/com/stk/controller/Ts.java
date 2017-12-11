package com.stk.controller;

import com.stk.util.MD5Util;

public class Ts {

	public static void main(String[] args) {
		String pass=MD5Util.getMD5String("terrific1@!shoutike");
		System.out.println(pass);
//		String random = "";  
//	    /*随机数函数*/  
//	    java.util.Random r=new java.util.Random();  
//	    for(int i = 0;i<10;i++){  
//	        /*生成36以内的随机数，不含36，并转化为36位*/  
//	        random += Integer.toString(r.nextInt(36), 36);  
//	    }  
//	   System.out.println(random);  
	}

}
