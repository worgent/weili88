package base.util;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;


/**
 * User: liunana@applebaby.com
 * Date: 2010-8-2  Time: 21:08:45
 * <p/>
 * 功能：
 * 说明：
 */
public class BaseFileUtil {
    protected static final Log log = LogFactory.getLog(BaseFileUtil.class);


    //===================================================天宝====================================================

    /**
     * 拷贝文件夹
     *
     * @param sourceFile ：源 ：例：D:\tomcat-81
     * @param targetFile ：目标：例：D:\tomcat-81_copy
     */
    public static void copyDir(String sourceFile, String targetFile) {
        File file = new File(targetFile);
        if (file.exists()) {
            log.warn(targetFile + " already exists so i do not copy " + sourceFile);
            return;
        }
        File readF = new File(sourceFile);
        if (readF.isFile()) {
            try {
                copyFile(readF, targetFile, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (readF.isDirectory()) {
            mkdirs(targetFile);
            File[] fList = readF.listFiles();
            for (int i = 0; i < fList.length; i++) {
                if (fList[i].isFile()) {
                    try {
                        copyFile(fList[i], targetFile, null);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else if (fList[i].isDirectory()) {
                    copyDir(sourceFile + "/" + fList[i].getName(), targetFile + "/" + fList[i].getName());
                }
            }
        }
    }

    /**
     * 拷贝文件
     *
     * @param sourceFile
     * @param targetPath
     * @param targetName
     * @throws Exception
     */
    public static void copyFile(String sourceFile, String targetPath, String targetName) throws Exception {
        copyFile(new File(sourceFile), targetPath, targetName);
    }

    /**
     * 拷贝文件
     *
     * @param sourceFile
     * @param targetPath
     * @param targetName
     * @throws Exception
     */
    public static void copyFile(File sourceFile, String targetPath, String targetName) throws Exception {
        FileInputStream fileInputStream = new FileInputStream(sourceFile);
        if (targetName == null || "".equals(targetName)) {
            targetName = sourceFile.getName();
        }
        File targetFile = new File(targetPath + File.separator + targetName);
        FileOutputStream fileOutputStream = new FileOutputStream(targetFile);
        byte[] buf = new byte[1024];
        int i = 0;
        while ((i = fileInputStream.read(buf)) != -1) {
            fileOutputStream.write(buf, 0, i);
        }
        fileInputStream.close();
        fileOutputStream.close();
    }

    /**
     * 创建文件夹
     *
     * @param dirPath
     */
    public static void mkdirs(String dirPath) {
        File file = new File(dirPath);
        if (file.exists()) {
            return;
        }
        file.mkdirs();
    }

    /**
     * 创建新文件
     *
     * @param filePath
     * @return
     * @throws java.io.IOException
     */
    public static File createNewFile(String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.exists()) {
            file.createNewFile();
        }
        return file;
    }

    /**
     * 删除文件
     *
     * @param filePath
     * @return
     */
    public static boolean deleteFile(String filePath) {
        File file = new File(filePath);
        return deleteFile(file);
    }

    /**
     * 删除文件
     *
     * @param file
     * @return
     */
    public static boolean deleteFile(File file) {
        //不存在
        if (!file.exists()) {
            return false;
        }

        //是文件
        if (file.isFile()) {
            return file.delete();
        }

        //是文件夹
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (int i = 0; i < files.length; i++) {
                if (!deleteFile(files[i])) {
                    return false;
                }
            }
            return file.delete();
        }
        return false;
    }

    /**
     * 文件列表
     *
     * @param file
     * @param fileList :文件集合
     * @param nameList :名字集合
     */
    static void listFile(File file, List<File> fileList, List<String> nameList) {
        //初始化
        if (fileList == null) {
            fileList = new ArrayList<File>();
        }

        if (nameList == null) {
            nameList = new ArrayList<String>();
        }

        //文件
        if (file.isFile()) {
            fileList.add(file);
            nameList.add(file.getName());
            return;
        }

        //文件夹
        File[] files = file.listFiles();

        for (File file2 : files) {
            listFile(file2, fileList, nameList);
        }
    }

    //========================================未整理========================================

    /**
     * <p>方法名称：createZipFile</p>
     * <p>方法描述：将文件打包为zip</p>
     *
     * @param forTempPath 要打包的文件目录
     * @param forZipPath  打包后存放zip文件的目录
     * @param forFileName zip文件名
     * @return
     * @author 李修彬
     * @since 2008-8-12
     */
    public static String createZipFile(String forTempPath, String forZipPath, String forFileName) throws Exception {
        ArrayList fileNames = new ArrayList(); // 存放文件名,并非含有路径的名字
        ArrayList files = new ArrayList(); // 存放文件对象
        File zipPathFile = new File(forZipPath);
        if (!zipPathFile.exists()) {
            zipPathFile.mkdirs();
        }

        String zipFile = forZipPath + forFileName;
        try {
            FileOutputStream fileOut = new FileOutputStream(zipFile);
            ZipOutputStream outputStream = new ZipOutputStream(fileOut);
            File rootFile = new File(forTempPath);
            listFile(rootFile, fileNames, files);
            for (int i = 0; i < files.size(); i++) {
                FileInputStream fileIn = new FileInputStream((File) files.get(i));
                outputStream.putNextEntry(new ZipEntry((String) fileNames.get(i)));
                int b;
                while ((b = fileIn.read()) != -1) {
                    outputStream.write(b);
                }
                outputStream.closeEntry();
                fileIn.close();
            }
            outputStream.close();
            fileOut.close();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return zipFile;
    }

    /**
     * <p>方法名称：extZipFile</p>
     * <p>方法描述：解压ZIP文件</p>
     *
     * @param zipFileName 文件名称
     * @param extPlace    解压后存放文件的临时目录
     * @author lxb0923
     * @since 2008-7-30
     */
    public static File extZipFile(String zipFileName, String extPlace) throws Exception {
        File file = null;
        String entryName = null;
        ZipInputStream in = new ZipInputStream(new FileInputStream(zipFileName));
        ZipEntry entry = null;
        while ((entry = in.getNextEntry()) != null) {
            entryName = entry.getName();
            File tempDir = new File(extPlace);
            if (!tempDir.exists()) {
                tempDir.mkdirs();
            }
            extPlace = tempDir.getAbsolutePath();
            if (entry.isDirectory()) {
                file = new File(extPlace + entryName);
                file.mkdirs();
            } else {
                FileOutputStream os = new FileOutputStream(extPlace + "\\"
                        + entryName);
                //Transfer bytes from the ZIP file to the output file
                byte[] buf = new byte[1024];
                int len;
                while ((len = in.read(buf)) > 0) {
                    os.write(buf, 0, len);
                }
                os.close();
                in.closeEntry();
            }
        }
        in.close();
        return new File(extPlace);
    }

    public static void main(String[] args) throws IOException {
        String folderPath = "E:\\小五义03蒋平闯水寨";
        String extName = "jpg";

        int i = BaseFileUtil.getFileCount(folderPath, extName);
        System.out.println("i=" + i);

        File file = new File(folderPath+"\\readme.txt");
        List<String> lines = FileUtils.readLines(file);
        
        for(String line : lines){
            System.out.println("line = " + line);
        }
    }

    /**
     * 得到一个文件夹下 某扩展名文件的 个数
     *
     * @param folderPath
     * @param extName
     * @return
     */
    public static int getFileCount(String folderPath, String extName) {
        File fileFolder = new File(folderPath);
        File[] files = fileFolder.listFiles();
        int i = 0;
        for (File file : files) {
            if (file.isDirectory()) {
                //文件夹
                i += getFileCount(file.getAbsolutePath(), extName);
            } else {
                //文件
                String fileName = file.getName();
                String extension = FilenameUtils.getExtension(fileName);
                if (extName.equals(extension)) {
                    i++;
                }
            }
        }
        return i;
    }

//    public static String[] readFileByLine(String file){
//
//    }



    /**
     * 读取文件
     * @param pathname 文件路径
     * @return 文件内容
     */
    public static String readFile(String pathname) {
        return readFile(new File(pathname));
    }

    /**
     * 读取文件
     * @param file 文件对象
     * @return 文件内容
     */
    public static String readFile(File file) {
        StringBuilder sr = new StringBuilder();
        FileReader fr = null;
        BufferedReader br = null;
        try {
            fr = new FileReader(file);
            br = new BufferedReader(fr);
            while (br.ready())
                sr.append(br.readLine());
        } catch (FileNotFoundException ie) {
            ie.printStackTrace();
        } catch (IOException ie) {
            ie.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                    br = null;
                }
                if (fr != null) {
                    fr.close();
                    fr = null;
                }
            } catch (IOException ie) {
                ie.printStackTrace();
            }
        }
        return sr.toString();
    }
    /**
     * 复制文件
     * @param oldpath	原文件
     * @param newpath	新文件
     * @return 文件内容
     */
    public static String writeFile(String oldpath, String newpath) {
        return writeFile(new File(oldpath), new File(newpath));
    }

    /**
     *
     * @param oldFile
     * @param newFile
     * @return
     */
    public static String writeFile(File oldFile, File newFile) {
        StringBuilder sr = new StringBuilder();
        FileReader fr = null;
        FileWriter fw = null;
        BufferedReader br = null;
        BufferedWriter bw = null;
        try {
            fr = new FileReader(oldFile);
            fw = new FileWriter(newFile);
            br = new BufferedReader(fr);
            bw = new BufferedWriter(fw);
            while (br.ready()) {
                sr.append(br.readLine());
                bw.write(sr.toString());
                bw.newLine();
            }
            bw.flush();
        } catch (FileNotFoundException re) {
            re.printStackTrace();
        } catch (IOException ie) {
            ie.printStackTrace();
        } finally {
            try {
                if (bw != null) {
                    bw.close();
                    bw = null;
                }
                if (br != null) {
                    br.close();
                    br = null;
                }
                if (fw != null) {
                    fw.close();
                    fw = null;
                }
                if (fr != null) {
                    fr.close();
                    fr = null;
                }
            } catch (IOException ie) {
                ie.printStackTrace();
            }
        }
        return sr.toString();
    }
    /**
     * 获取文件后缀
     * @param filename 文件名
     * @return 文件后缀名
     */
    public static String getExtension(String filename) {
        if ((filename == null) || ("".equals(filename)))
            return "";
        int i = filename.lastIndexOf('.');
        if (i >= 0) {
            return filename.substring(i + 1).toLowerCase();
        }
        return "";
    }

    /**
     * 判断是否为文件夹
     * @param pathname 文件路径
     * @return 是否为文件夹
     */
    public static boolean isDir(String pathname) {
        if ((pathname == null) || ("".equals(pathname)))
            return false;
        return new File(pathname).isDirectory();
    }
    /**
     * 判断是否存在该文件路径
     * @param pathname  文件路径
     * @return 是否存在该文件路径
     */
    public static boolean isExists(String pathname) {
        if ((pathname == null) || ("".equals(pathname)))
            return false;
        return new File(pathname).exists();
    }
    /**
     *  判断是否存在该文件
     * @param pathname 文件路径
     * @return 是否存在该文件
     */
    public static boolean isFile(String pathname) {
        if ((pathname == null) || ("".equals(pathname)))
            return false;
        return new File(pathname).isFile();
    }
    /**
     * 判断是否为隐藏文件
     * @param pathname 文件路径
     * @return 是否为隐藏文件
     */
    public static boolean isHidden(String pathname) {
        if ((pathname == null) || ("".equals(pathname)))
            return false;
        return new File(pathname).isHidden();
    }
    /**
     * 判断是否为只读文件
     * @param pathname 文件路径
     * @return 是否为只读文件
     */
    public static boolean canRead(String pathname) {
        if ((pathname == null) || ("".equals(pathname)))
            return false;
        return new File(pathname).canRead();
    }
    /**
     * 判断是否为只写文件
     * @param pathname 文件路径
     * @return 是否为只写文件
     */
    public static boolean canWrite(String pathname) {
        if ((pathname == null) || ("".equals(pathname)))
            return false;
        return new File(pathname).canWrite();
    }
    /**
     * 通过文件路径获取文件名
     * @param pathname 文件路径
     * @return 文件名
     */
    public static String getFileName(String pathname) {
        try {
            char separatorChar = '/';
            int index = pathname.lastIndexOf(separatorChar);
            if (index < 0) {
                separatorChar = '\\';
                index = pathname.lastIndexOf(separatorChar);
            }
            return pathname.substring(index + 1);
        } catch (Exception e) {
        }
        return "Unknown";
    }

    /**
     * 删除文件
     * @param file 文件名
     */
    public static void delete(File file) {
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            if (files != null) {
                for (int i = 0; i < files.length; i++) {
                    delete(files[i]);
                }
            }
            file.delete();
        } else {
            file.delete();
        }
    }

    public static void deleteFile(List<String> filePathList){
        String filePath="";
        File file=null;
        for (Iterator iterator = filePathList.iterator(); iterator.hasNext();) {
            filePath =  iterator.next().toString();
            file=new File(filePath);
            if(file.isFile()){
                file.delete();
            }
        }
    }


    /**
     *
     * @param fileupload
     * @param path
     * @param folder
     * @return
     * @throws IOException
     */
    public static String upload(MultipartFile fileupload,String path,String folder) throws IOException {
        folder = folder + Calendar.getInstance().get(Calendar.YEAR) + BaseDateUtil.getWeek();
        File foderFile = new File(path + folder);
        if(!foderFile.exists()){
           foderFile.mkdirs();
        }

        String extName = BaseStringUtil.getExtName(fileupload.getOriginalFilename());
        String fileName = "/" + new Date().getTime() + extName;
        FileCopyUtils.copy(fileupload.getBytes(), new File(foderFile.getAbsolutePath() + fileName));

        return folder + fileName;
    }

    /**
     * 得到文件的创建时间
     * @param file
     * @return
     */
    public static Date getCreateTime(File file){
        Long time =file.lastModified();
//     Calendar cd = Calendar.getInstance();
//     cd.setTimeInMillis(time);
        return new Date(time);
    }



}
