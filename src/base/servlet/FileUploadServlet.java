package base.servlet;


import base.SystemGlobal;
import base.tool.fileupload.MutiFileUpload;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * 文件上传 单文件 多文件  
 * @author liuwentao
 *
 */
@Controller("UploadServlet")
public class FileUploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	//@Action(value = "addProdUnitPicture")
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		
		/*
		SingleFileUpload fileupload = new SingleFileUpload();
        fileupload.parseRequest(httpServletRequest);
        String temps=fileupload.getFileItem().getName();
        String temps1=fileupload.getFileItem().getFieldName();
        System.out.println("temps="+temps);
    	System.out.println(temps.replaceAll("\\\\", "##"));
        System.out.println("temps1="+temps1);
        File parent = new File("D:\\fileupload\\");
        //new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
        try {
            fileupload.fileupload(parent);
        }
        catch(org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException e){            
            // 文件大小超出最大值
            e.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        }
		*/
		/*
		MutiFileUpload fileupload=new MutiFileUpload();
		fileupload.parseRequest(httpServletRequest);
		//文件路径可以通过配置文件获取  此处为了测试 
		String path="D:\\fileupload\\";
		File parent = new File(path);
		PrintWriter pw=null;
		try {
            fileupload.fileupload(parent,path);
           // pw=httpServletResponse.getWriter();
           // pw.print("<script>alert('上传成功')</script>");
           // pw.close();
        }
        catch(org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException e){            
            // 文件大小超出最大值
            e.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        }
        */
		
		try {
			MutiFileUpload upload=new MutiFileUpload();
			//文件路径可以通过配置文件system.properties获取

			String path= SystemGlobal.getPreference("UPLOAD_IMAGE_DIR");
			File parent = new File(path);
			
			//执行上传
			upload.parseRequest(httpServletRequest);
			List<HashMap<String,String>> list=upload.mainUpload(parent,path);

        }catch (Exception e) {
            e.printStackTrace();
        }
        
	}
}
