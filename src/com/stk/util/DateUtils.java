package com.stk.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**日期转换*/
public class DateUtils {
public static String getFormatDateYMDHMS(){
		
		//创建SimpleDateFormat对象
		SimpleDateFormat simpleDateFormat=
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleDateFormat.format(new Date());
		
	}
}
