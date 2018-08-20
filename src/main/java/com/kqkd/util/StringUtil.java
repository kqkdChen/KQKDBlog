package com.kqkd.util;

import com.kqkd.pojo.Blog;
import org.apache.commons.lang.time.DateUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 字符串工具类
 * @author 
 *
 */
public class StringUtil {


	public static boolean isEmpty(String str){
		return str == null || "".equals(str.trim());
	}
	

	public static boolean isNotEmpty(String str){
		return !isEmpty(str);
	}
	

	public static String formatLike(String str){
		if(isNotEmpty(str)){
			return "%"+str+"%";
		}else{
			return null;
		}
	}
	

	public static List<String> filterWhite(List<String> list){
		List<String> resultList = new ArrayList<>();
		for(String str : list){
			if(isNotEmpty(str)){
				resultList.add(str);
			}
		}
		return resultList;
	}

}
