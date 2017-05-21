package base.tool.fileupload;

import java.io.*;
import java.util.Date;

/**
 * 
 * @Title: FileUpLoadUtil.java
 * @Description: (文件上传工具类)
 * @author liuwentao
 * @date Aug 31, 2011 11:17:36 AM
 * @version V1.0  
 *
 */
public class FileUpLoadUtil {
	
	protected static final int BUFFER_SIZE = 16 * 1024;
	
	
	/**
	 * 上传多个文件类
	 * @param file 文件数组
	 * @param fileName 文件数组名
	 * @return 上传个数
	 */
	public static String[] fileUpload(File[] file, String[] fileName,String savePath) throws Exception {
		createDir(savePath);
		String[] imagePath=new String[file.length];
		for (int i = 0; i < file.length; i++) {
			imagePath[i]=singleUpload(file[i],fileName[i],savePath);
		}
		return imagePath;
	}
    
	/**
	 * @function	   :文件上传方法   返回文件的完整路径，  //用于保存到数据库
	 * @param       :
	 * @author      :wangshaoxin
	 * @create_Date :Oct 12, 2011 5:01:49 PM
	 **/
	protected static String singleUpload(File file,String uploadFileName,String savePath) throws Exception {
		
		Date date = new Date();
		uploadFileName = date.getTime() + getExtention(uploadFileName);
		
		System.out.println(savePath+ uploadFileName);
		File dest =new File(savePath+ uploadFileName);
		
		copy(file, dest);
		
		return savePath + uploadFileName;
	}
	
	/**
	 * @function	   :得到文件后缀
	 * @param       :
	 * @author      :wangshaoxin
	 * @create_Date :Oct 12, 2011 6:08:29 PM
	 **/
	protected static String getExtention(String fileName) throws Exception{
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
	
	/**
	 * @function	   :判断服务器是否存在上传文件的目录  不存在则创建
	 * @param       :
	 * @author      :wangshaoxin
	 * @create_Date :Oct 12, 2011 5:02:02 PM
	 **/
	public static boolean createDir(String dirPath) throws Exception{
		File dirFile=new File(dirPath);
		//如果不存在此文件夹创建此文件夹
		boolean  creadok=true;
		 if ( ! (dirFile.exists())  &&   ! (dirFile.isDirectory()))  {
             creadok  =  dirFile.mkdirs();
		 }
		return creadok;
	}
	
	
	/**
	 * 将文件上传致服务器
	 * @param oldFile 原文件
	 * @param newFile 服务器文件
	 * @return 上传个数
	 */
	protected static void copy(File oldFile, File newFile) throws Exception{
		InputStream in = null;
		OutputStream out = null;
		if (oldFile.exists()) {
			try {
				in = new BufferedInputStream(new FileInputStream(oldFile), BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(newFile),BUFFER_SIZE);
				byte[] buffer = new byte[5120];
				int len = 0;
				while ((len = in.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}

				if (null != in) {
					try {
						in.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (null != out)
					try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
			} catch (Exception e) {
				e.printStackTrace();
				if (null != in) {
					try {
						in.close();
					} catch (IOException oe) {
						oe.printStackTrace();
					}
				}
				if (null != out)
					try {
						out.close();
					} catch (IOException oe) {
						oe.printStackTrace();
					}
			} finally {
				if (null != in) {
					try {
						in.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (null != out) {
					try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}