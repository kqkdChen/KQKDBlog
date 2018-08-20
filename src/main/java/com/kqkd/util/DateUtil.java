package com.kqkd.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;

/**
 * 日期工具类
 * @author Administrator
 *
 */
public class DateUtil {

	/**
	 * 日期对象转字符串
	 * @param date
	 * @param format
	 * @return String
	 */
	public static String formatDate(Date date,String format){
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		if(date!=null){
			result=sdf.format(date);
		}
		return result;
	}

    /**
     * 获得当天日期
     * @param formatEncoding
     * @return
     * @throws ParseException
     */
	public static Date getCurrentDate(String formatEncoding) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(formatEncoding);
        String formatDate = sdf.format(new Date());
        return sdf.parse(formatDate);
    }


    /**
     * 获得本月第一天日期
     * @return Date
     */
    public static Date getMothFirstDay(){
        LocalDate today = LocalDate.now();
        LocalDate firstDay = LocalDate.of(today.getYear(),today.getMonth(),1);
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime first = firstDay.atStartOfDay(zoneId);
        return Date.from(first.toInstant());
    }

    /**
     * 获得本月最后一天日期
     * @return Date
     */
    public static Date getMothLastDay(){
        LocalDate today = LocalDate.now();
        LocalDate lastDay =today.with(TemporalAdjusters.lastDayOfMonth());
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime last = lastDay.atStartOfDay(zoneId);
        return Date.from(last.toInstant());
    }

}
