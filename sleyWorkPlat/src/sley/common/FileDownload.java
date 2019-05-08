package sley.common;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * @author wangli
 */
public class FileDownload {
	private String errorInfo = "";
	private String tfilename = "";

	/**
	 * @param response
	 * @param filename
	 * @return
	 */
	public boolean download(HttpServletResponse response, String filename) {
		if (!response.isCommitted()) {
			String fsepar = System.getProperties()
					.getProperty("file.separator");
			String filenameWithoutPath;
			String filenameWithPath;
			if ("\\".equals(fsepar)) {
				fsepar = "\\\\";
				filenameWithPath = filename.replaceAll("/", "\\\\");
			} else {
				filenameWithPath = filename.replaceAll("\\\\", "/");
			}

			filenameWithoutPath = filenameWithPath.substring(filenameWithPath
					.lastIndexOf(fsepar) + 1);
			this.tfilename = filenameWithoutPath;
			// ----------------------------
			try {
				filenameWithoutPath = URLEncoder.encode(filenameWithoutPath,
						"UTF-8");
			} catch (UnsupportedEncodingException e2) {
				errorInfo = "URLEncode filename error!!";
				System.out.println("URLEncode filename error!!");
				showError(response);
				return false;
			}
			// -----------------------------
			response.resetBuffer();
			response.setCharacterEncoding("UTF-8");
			if (response.containsHeader("ContentType")) {
				response.setHeader("ContentType", "application/octet-stream");
			} else {
				response.addHeader("ContentType", "application/octet-stream");
			}
			if (response.containsHeader("Content-Disposition")) {
				response.setHeader("Content-Disposition",
						"attachment;FileName=" + filenameWithoutPath);
			} else {
				response.addHeader("Content-Disposition",
						"attachment;FileName=" + filenameWithoutPath);
			}
			// ------------------------------------------------------
			int len;
			File file = new File(filename);
			FileInputStream fis;
			try {
				fis = new FileInputStream(file);
			} catch (FileNotFoundException e1) {
				errorInfo = "File dose not exist!!";
				System.out.println("File dose not exist!!");
				showError(response);
				return false;
			}
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream os;
			try {
				os = response.getOutputStream();
				byte[] b = new byte[len = bis.available()];
				if (len != bis.read(b, 0, len)) {
					errorInfo = "Read file error!!";
					System.out.println("Read file error!!");
					showError(response);
					return false;
				}
				os.write(b);
				os.close();
				response.flushBuffer();
			} catch (IOException e) {
				errorInfo = "IO error!!";
				System.out.println("IO error!!");
				showError(response);
				return false;
			}
			return true;
		} else {
			errorInfo = "Error because of the response has been committed!!";
			System.out
					.println("Error because of the response has been committed!!");
			showError(response);
			return false;
		}
	}

	/**
	 * 
	 * @param response
	 * @param filename
	 * @param newFilenameWithoutPath
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public boolean download(HttpServletResponse response, String filename,
			String newFilenameWithoutPath) throws UnsupportedEncodingException {
		String fsepar = System.getProperties().getProperty("file.separator");
		String filenameWithPath;
		if ("\\".equals(fsepar)) {
			filenameWithPath = filename.replaceAll("/", "\\\\");
		} else {
			filenameWithPath = filename.replaceAll("\\\\", "/");
		}
		// -------------------
		newFilenameWithoutPath = newFilenameWithoutPath.replaceAll("\\\\", "");
		newFilenameWithoutPath = newFilenameWithoutPath.replaceAll("/", "");
		newFilenameWithoutPath = newFilenameWithoutPath.replaceAll(":", "");
		this.tfilename = newFilenameWithoutPath;
		
		// -----------------------------
		if (!response.isCommitted()) {
			response.resetBuffer();
			response.setCharacterEncoding("gb2312");
			response.setHeader("Content-disposition","attachment; filename="+new String(newFilenameWithoutPath.getBytes("gb2312"),"iso8859-1"));
			if (response.containsHeader("ContentType")) {
				response.setHeader("ContentType", "application/octet-stream");
			} else {
				response.addHeader("ContentType", "application/octet-stream");
			}
			if (response.containsHeader("Content-Disposition")) {
				//response.setHeader("Content-Disposition","attachment;FileName=" + newFilenameWithoutPath);
				response.setHeader("Content-disposition","attachment; filename="+new String(newFilenameWithoutPath.getBytes("gb2312"),"iso8859-1"));
			} else {
				response.addHeader("Content-Disposition",
						"attachment;FileName=" + newFilenameWithoutPath);
			}
			// ------------------------------------------------------
			int len;
			File file = new File(filenameWithPath);
			FileInputStream fis;
			try {
				fis = new FileInputStream(file);
			} catch (FileNotFoundException e1) {
				errorInfo = "File dose not exist!!";
				System.out.println("File dose not exist!!");
				showError(response);
				return false;
			}
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream os;
			try {
				os = response.getOutputStream();
				byte[] b = new byte[len = bis.available()];
				if (len != bis.read(b, 0, len)) {
					errorInfo = "Read file error!!";
					System.out.println("Read file error!!");
					showError(response);
					return false;
				}
				os.write(b);
				os.close();
				response.flushBuffer();
			} catch (IOException e) {
				errorInfo = "IO error!!";
				System.out.println("IO error!!");
				showError(response);
				return false;
			}
			return true;
		} else {
			errorInfo = "Error because of the response has been committed!!";
			System.out
					.println("Error because of the response has been committed!!");
			showError(response);
			return false;
		}
	}

	/**
	 * @return 
	 */
	public String getError() {
		return errorInfo;
	}

	/**
	 * @return ʵ���ļ�����·����
	 */
	public String getFilename() {
		return tfilename;
	}

	private void showError(HttpServletResponse response) {
		response.reset();
		ServletOutputStream os;
		try {
			os = response.getOutputStream();
			os.println("<html>");
			os.println("<head>");
			os.println("<title>ErrorPage</title>");
			os.println("</head>");
			os.println("<h1>DownLoad file error!</h1>");
			os.println("</html>");
			os.close();
			response.flushBuffer();
		} catch (IOException e) {
			errorInfo += "\nIO error!!";
			System.out.println(errorInfo);
		}
	}
}
