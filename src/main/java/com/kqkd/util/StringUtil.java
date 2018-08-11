package com.kqkd.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 字符串工具类
 * @author 
 *
 */
public class StringUtil {

	/**
	 * 判断是否是空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		return str == null || "".equals(str.trim());
	}
	
	/**
	 * 判断是否不是空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		return !isEmpty(str);
	}
	
	/**
	 * 格式化模糊查询
	 * @param str
	 * @return
	 */
	public static String formatLike(String str){
		if(isNotEmpty(str)){
			return "%"+str+"%";
		}else{
			return null;
		}
	}
	
	/**
	 * 过滤掉集合里的空格
	 * @param list
	 * @return
	 */
	public static List<String> filterWhite(List<String> list){
		List<String> resultList=new ArrayList<>();
		for(String l:list){
			if(isNotEmpty(l)){
				resultList.add(l);
			}
		}
		return resultList;
	}
	
	/**
	 * 数组判非空
	 * @param o
	 * @return
	 */
	public static boolean arrayIsNotEmpty(Object []o){
		return o != null || (o.length != 0 && o != null);
	}

	/**
	 * 数组判空
	 * @param o
	 * @return
	 */
	public static boolean arrayIsEmpty(Object []o){
		return !arrayIsNotEmpty(o);
	}
}
