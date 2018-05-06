package com.lxm.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String format(String time, String format) {
		if (time == null) {
			return time;
		}

		Date ts = Timestamp.valueOf(time);
		return formatDate(ts, format);
	}

	public static String formatDate(Date date, String dateformatHms) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateformatHms);
		return sdf.format(date);
	}
}
