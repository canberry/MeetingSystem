package com.lxm.util;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	private static Logger logger = Logger.getLogger(FileUtil.class);
	
	public static String saveFile(MultipartFile filedata, String saveFilePath, HttpServletRequest request) {
		String pathval = request.getSession().getServletContext().getRealPath("/");
		logger.info("pathval: " + pathval);
		String newFileName = String.valueOf(System.currentTimeMillis());
		
		File fileDir = new File(pathval + saveFilePath);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		
		String filename = filedata.getOriginalFilename();
		String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
		try {
			String imgPath = saveFilePath + newFileName + "." + extensionName;
			logger.info("Path: " + pathval + imgPath);
			FileOutputStream out = new FileOutputStream(pathval + imgPath);
			out.write(filedata.getBytes());
			out.flush();
			out.close();
			
			return imgPath;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void deleteFile(String oldPic, HttpServletRequest request) {
		String pathval = request.getSession().getServletContext().getRealPath("/");
		File fileDir = new File(pathval + oldPic);
		if (fileDir.exists()) {
			fileDir.delete();
		}
	}
}
