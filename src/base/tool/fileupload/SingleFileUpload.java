package base.tool.fileupload;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 单文件上传辅助类
 * @author liuwentao
 *
 */
public class SingleFileUpload extends FileUploadBase {
    private FileItem fileItem;

    /**
     * 过滤请求
     * @param request  request 请求
     * @throws java.io.UnsupportedEncodingException
     */
    public void parseRequest(HttpServletRequest request)
            throws UnsupportedEncodingException {

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
                    if (!super.isValidFile(item)) {
                        continue;
                    }
                    if (fileItem == null)
                        fileItem = item;
                }
            }

        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }

    /**
     * 上传文件, 调用该方法之前必须先调用 parseRequest(HttpServletRequest request)
     * @param fileName 完整文件路径
     * @throws Exception
     */
    public void upload(String fileName) throws Exception {
        File file = new File(fileName);
        uploadFile(file);
    }

    /**
     * 上传文件, 调用该方法之前必须先调用 parseRequest(HttpServletRequest request)
     * @param parent 存储的目录
     * @throws Exception
     */
    public void upload(File parent) throws Exception {
        if (fileItem == null)
            return;
        
      // 此时的文件名包含了完整的路径，得注意加工一下  
      String filename = fileItem.getName();   //如果要对文件名称做处理  在此处               
      System.out.println("完整的文件名：" + filename);  
      int index = filename.lastIndexOf("\\");  
      filename = filename.substring(index + 1, filename.length());  
      System.out.println("文件名：" + filename);  
      File file = new File(parent, filename);
      uploadFile(file);
    }
    
    /**
     * 上传文件
     * @param File file 上传文件对象
     * @throws Exception
     */
    private void uploadFile(File file) throws Exception{
        if (fileItem == null)
            return;

        long fileSize = fileItem.getSize();
        if (sizeMax > -1 && fileSize > super.sizeMax){
            String message = String.format("the request was rejected because its size (%1$s) exceeds the configured maximum (%2$s)", fileSize, super.sizeMax);
                    
            throw new org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException(message, fileSize, super.sizeMax);
        }
        
        String name = fileItem.getName();
        fileItem.write(file);
    }
    
    /**
     * 获取文件信息
     * 必须先调用 parseRequest(HttpServletRequest request)
     * @return
     */
    public FileItem getFileItem() {
        return fileItem;
    }
}