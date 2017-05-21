package base.tool.fileupload;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * 多文件上传辅助类
 * @author liuwentao
 *
 */
public class MutiFileUpload extends FileUploadBase {

	private Map<String, FileItem> files;// 保存上传的文件
	private long filesSize = 0; // 所有文件的总大小

	public void parseRequest(HttpServletRequest request)
			throws UnsupportedEncodingException {

		files = new HashMap<String, FileItem>();

		// Create a factory for disk-based file items

		DiskFileItemFactory factory = new DiskFileItemFactory();

		factory.setSizeThreshold(sizeThreshold);

		if (repository != null)
			factory.setRepository(repository);

		ServletFileUpload upload = new ServletFileUpload(factory);

		upload.setHeaderEncoding(encoding);

		try {
			List<FileItem> items = upload.parseRequest(request);

			for (FileItem item : items) {
				if (item.isFormField()) {
					String fieldName = item.getFieldName();
					String value = item.getString(encoding);
					parameters.put(fieldName, value);
				} else {

					if (super.isValidFile(item)) {
						continue;
					}

					String fieldName = item.getFieldName();
					
					files.put(fieldName, item);
					filesSize += item.getSize();
				}
			}

		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 上传文件, 调用该方法之前必须先调用 parseRequest(HttpServletRequest request)
	 * @param parent 文件存储的目录
	 * @throws Exception
	 */
	public List<HashMap<String,String>> mainUpload(File parent,String uploadPath) throws Exception {
		if (files.isEmpty())
			return new ArrayList<HashMap<String,String>>();

		if (sizeMax > -1 && filesSize > super.sizeMax) {
			String message = String	.format("the request was rejected because its size (%1$s) exceeds the configured maximum (%2$s)",
							filesSize, super.sizeMax);

			return null;
		}
		FileUpLoadUtil.createDir(uploadPath);
		List<HashMap<String,String>> list=new ArrayList<HashMap<String,String>>();
		short i=0;//以防文件重名
		for (String key : files.keySet()) {
			FileItem item = files.get(key);
			  String name = item.getName();//如果要对文件名称做处理  在此处         
			  System.out.println("输入框name： "+key+"!!!!!!!!!!!!!!!!!!!!!");
		      System.out.println("完整的文件名：" + name);  
		      int index = name.lastIndexOf("\\");  
		      name = name.substring(index + 1, name.length());  
		      System.out.println("文件名：" + name); 
		      
		      //执行文件改名
		      Date date = new Date();
		      name = date.getTime()+(i++)+FileUpLoadUtil.getExtention(name);
		      System.out.println("改名后的名字:"+name);
		      File file = new File(parent, name);
			item.write(file);
			
			//map里存放上传框的name属性和改名后的名字
			HashMap<String,String> map=new HashMap<String,String>();
			map.put("name",key);
			map.put("value",name);
			list.add(map);
			System.out.println("文件上传路径为："+uploadPath+name);
			System.out.println();
		}
		return list;
	}
	
	public List<HashMap<String,String>> upload(String path,HttpServletRequest request) throws Exception {
		File parent = new File(path);
		
		//执行上传
		this.parseRequest(request);
		List<HashMap<String,String>> list=this.mainUpload(parent,path);
		return list;
	}

	public Map<String, FileItem> getFiles() {
		return files;
	}

}
