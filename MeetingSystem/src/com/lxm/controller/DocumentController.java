package com.lxm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lxm.bean.Document;
import com.lxm.bean.Meeting;
import com.lxm.service.DocumentService;
import com.lxm.util.Const;
import com.lxm.util.FileUtil;

@Controller
@RequestMapping("/document")
public class DocumentController {

	private static Logger logger = Logger.getLogger(DocumentController.class);

	@Autowired
	DocumentService documentService;

	@RequestMapping(value = "/addDocument", method = { RequestMethod.POST })
	@ResponseBody
	public String addDocument(
			@RequestParam(value = "file0", required = false) MultipartFile file0,
			@RequestParam(value = "file1", required = false) MultipartFile file1,
			@RequestParam(value = "file2", required = false) MultipartFile file2,
			@RequestParam(value = "meetingId", required = false) Integer meetingId,
			HttpServletRequest request) {
		logger.info("mid: " + meetingId);
		MultipartFile[] files = { file0, file1, file2 };

		String saveFilePath = Const.Path_TOSAVE_DOCUMENT;
		int fileLength = files.length;
		logger.info("file len: " + fileLength);

		try {
			for (int i = 0; i < fileLength; i++) {
				MultipartFile file = files[i];
				if (file != null) {
					String oldName = file.getOriginalFilename();
					logger.info("start to upload file: " + oldName);
					String filePath = FileUtil.saveFile(file, saveFilePath,
							request);
					logger.info("imgPath: " + filePath);

					// insert document
					logger.info("start insert document...");
					Meeting meeting = new Meeting();
					meeting.setmId(meetingId);
					Document document = new Document(oldName, filePath, meeting);
					documentService.addDocument(document);
					logger.info("insert document success");
				} else {
					logger.info("file null:" + i);
				}
			}

			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@RequestMapping(value = "/downloadDocument", method = RequestMethod.POST)
	public void downloadDocument(@RequestParam("path") String path,
			HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		String uploadPath = request.getSession().getServletContext()
				.getRealPath("/");
		String filePath = uploadPath + path;
		logger.info("file path: " + filePath);

		File file = new File(filePath);
		if (!file.exists()) {
			logger.info("file is not exist");

		} else {
			try {
				logger.info("start to download...");
				String filename = path;
				String[] filenames = path.split("/");
				if (filenames != null && filenames.length > 1) {
					filename = filenames[filenames.length - 1];
				}
				logger.info("filename: " + filename);
				response.setHeader("content-disposition",
						"attachment;filename="
								+ URLEncoder.encode(filename, "utf-8"));
				FileInputStream in = new FileInputStream(filePath);
				OutputStream out = response.getOutputStream();
				byte buffer[] = new byte[1024];
				int len = 0;
				while ((len = in.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}

				in.close();
				out.close();

				logger.info("download success");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("/removeDocument")
	@ResponseBody
	public String removeDocument(int docId, String path,
			HttpServletRequest request) {
		logger.info("doc id: " + docId + " path: " + path);
		try {
			documentService.removeDocument(docId);
			logger.info("start delete file");
			FileUtil.deleteFile(path, request);

			logger.info("remove success");
			return "ok";
		} catch (Exception e) {
			logger.info("remove fail");
			return "fail";
		}
	}
}
