package com.booksystem.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by longnguyen on 2/8/15.
 */
public class DateUtil {

    /**
     * Convert Date to String
     * @param d
     * @return
     */
    public static String convertDateToString(Date d){
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        return sdf.format(d);
    }

    /**
     * Convert Date SQL to String
     * @param d
     * @return
     */
    public static String convertDateSQLToString(java.sql.Date d){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        return sdf.format(d);
    }

    /**
     * Convert String to Date
     * @param s
     * @return
     */
    public static Date convertStringToDate(String s){
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date date;
        try {
            date = sdf.parse(s);
            return date;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Convert String to Date to compare with data
     * @param s
     * @return
     */
    public static Date convertStringToDateToCompare(String s){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        Date date;
        try {
            date = sdf.parse(s);
            return date;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Convert String to Date in sql
     * @param s
     * @return
     */
    public static java.sql.Date convertStringToDateSql(String s){
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        java.sql.Date date;
        try {
            date = new java.sql.Date(sdf.parse(s).getTime());
            return date;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get current date time of system
     * @return
     */
    public static String getCurrentDatetime(){
        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        Calendar cal = Calendar.getInstance();
        return dateFormat.format(cal.getTime());
    }

    /**
     * Format date
     * @param date
     * @return
     */
    public static String formatSqlDate(java.sql.Date date){
        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        return dateFormat.format(date);
    }

    /**
     * Check if the booking date is in the past
     * @param date
     * @param days
     * @return
     */
    public static boolean calculateAvailableBooking(java.sql.Date date, int days){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days);

        Calendar today = Calendar.getInstance();
        today.setTime(today.getTime());

        if(cal.before(today)){
            return true;
        }
        return false;
    }

    public static String calculateBookingDate(java.sql.Date date, int days){
        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days);
        return dateFormat.format(cal.getTime());
    }
}
