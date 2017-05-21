package base.util;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class BaseImageUtil {



    public static void main(String[] args){
        String pressImag = "C:\\mywork\\project\\tianbao2012\\xrs2013\\logo2.jpg";
        String targetFolder = "C:\\mywork\\1";
        BaseImageUtil.pressImageFolder(pressImag, targetFolder);
    }

    /**
     *
     * @param imagePath
     * @return
     * @throws IOException
     */
    public static BufferedImage getBufferedImageByUrl(String imagePath) throws IOException {
        URL url = new URL(imagePath);
        URLConnection conn = url.openConnection();
        InputStream inputStream = conn.getInputStream();

        BufferedImage sourceImg = ImageIO.read(inputStream);
        return sourceImg;
    }

    /**
     *
     * @param imagePath
     * @return
     * @throws IOException
     */
    public static BufferedImage getBufferedImageByLocal(String imagePath) throws IOException {
        File picture = new File(imagePath);
        if(!picture.exists()){
            return null;
        }
        BufferedImage sourceImg =ImageIO.read(new FileInputStream(picture));
        return sourceImg;
    }



    public final static void pressImageFolder(String pressImg, String targetFolder) {
        int x = 2;
        int y = 2;
        File fileFolder = new File(targetFolder);
        File[] files = fileFolder.listFiles();
        for (File file : files) {
            if (file.isDirectory()) {
                pressImageFolder(pressImg,file.getAbsolutePath());
            }
            pressImage(pressImg,file.getAbsolutePath(),x,y);
        }
    }


    /**
     * @param pressImg  --用作水印的图片
     * @param targetImg --把水印图片附加到的目标图片
     * @param x         距离图片右下角的左方向偏移量
     * @param y         距离图片右下角的上方向偏移量
     */
    public final static void pressImage(String pressImg, String targetImg, int x, int y) {
        try {
            File _file = new File(targetImg);
            Image src = ImageIO.read(_file);

            int width = src.getWidth(null);
            int height = src.getHeight(null);

            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            Graphics g = image.createGraphics();
            g.drawImage(src, 0, 0, width, height, null);

            // 水印文件
            File _filebiao = new File(pressImg);
            Image src_biao = ImageIO.read(_filebiao);

            int wideth_biao = src_biao.getWidth(null);
            int height_biao = src_biao.getHeight(null);

           // g.drawImage(src_biao,  x, height - height_biao - y, wideth_biao, height_biao, null);
           // g.drawImage(src_biao, wideth - wideth_biao - x, height - height_biao - y, wideth_biao, height_biao, null);
            g.drawImage(src_biao, x, y, wideth_biao, height_biao, null);
            g.dispose();

            FileOutputStream out = new FileOutputStream(targetImg);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(image);

            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 打印文字水印图片
     *
     * @param pressText --文字
     * @param targetImg --
     *                  图片保存在哪里
     * @param urlHref   --
     *                  来源是网上一个图片
     * @param fontName  --
     *                  字体名
     * @param fontStyle --
     *                  字体样式
     * @param color     --
     *                  字体颜色
     * @param fontSize  --
     *                  字体大小
     * @param x         --
     *                  偏移量
     * @param y
     */
    public static void pressText(String pressText, String targetImg, String urlHref,
                                 String fontName, int fontStyle, int color, int fontSize, int x,
                                 int y) {
        Image src = null;
        try {
            //源是一个网络上的图片，生成后的图片放在 targetImg 这个路径下
            if (urlHref != null) {
                URL url = new URL(urlHref);
                src = ImageIO.read(url);
            } else {
                //源是 本地一张图片（targetImg这个路径下），生成水印后仍然保存在  targetImg这个路径下
                File _file = new File(targetImg);
                src = ImageIO.read(_file);
            }


            int wideth = src.getWidth(null);
            int height = src.getHeight(null);
            BufferedImage image = new BufferedImage(wideth, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics g = image.createGraphics();
            g.drawImage(src, 0, 0, wideth, height, null);

            g.setColor(Color.white);
            g.setFont(new Font(fontName, fontStyle, fontSize));

            g.drawString(pressText, wideth - fontSize - x, height - fontSize
                    / 2 - y);
            g.dispose();
            FileOutputStream out = new FileOutputStream(targetImg);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(image);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
    }


    /**
     * 把 图片 f1 按 宽不能大于 max_width,高不能大于 max_heigth 压 成 文件 f2
     * @param max_width
     * @param max_height
     * @param f1  原图地址
     * @param f2  新图地址
     * @return
     */
	public static String copyImage(int max_width, int max_height, String f1, String f2) {
		BufferedImage bufferedImage = null;
		File file2 = new File(f2); // 新图
        if(file2.exists()){
            return f2;
        }
		try {
            if(f1.startsWith("http://")){
                InputStream is = new URL(f1).openStream();
                bufferedImage = ImageIO.read(is);
            }else{
                File file1 = new File(f1); // 原图
                bufferedImage = ImageIO.read(file1);
            }
		} catch (IOException e) {
            System.out.println("f1= " + f1);
			e.printStackTrace();
		}
		int width = bufferedImage.getWidth();
		int height = bufferedImage.getHeight();

       
		int new_width;
		int new_height;
		double sacle;

		if (max_width == -1) {
			sacle = 0.25;
			new_width = (int) (sacle * width);
			new_height = (int) (sacle * height);
		} else {
			if ((max_height == 0 || (width * 1000 / height) > (max_width * 1000 / max_height))) {
				// 宽更宽一些，按最大宽度压
				sacle = (double) max_width / (double) width;
				new_height = (int) (sacle * height);
				new_width = max_width;
			} else {
				// 高更高一些 ，按 最高 压
				sacle = (double) max_height / (double) height;
				new_width = (int) (sacle * width);
				new_height = max_height;
			}
		}
		// 原图尺寸太小，则 不压缩
		if ((width <= max_width && height <= max_height)
				|| (max_width == 0 && max_height == 0)) {
			new_width = width;
			new_height = height;
		}

		AffineTransform affinetransform = new AffineTransform();
		affinetransform.setToScale(sacle, sacle);
		AffineTransformOp affinetransformop = new AffineTransformOp(affinetransform, null);
		BufferedImage bufferedimage2 = new BufferedImage(new_width, new_height, 5);
		affinetransformop.filter(bufferedImage, bufferedimage2);
		try {
			ImageIO.write(bufferedimage2, "jpeg", file2);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return f2;
	}

    /**
     *
     * @param bigPath
     * @return
     */
	public static String getSmallPath(String bigPath) {
        if(BaseStringUtil.isBlank(bigPath)){
            return "";
        }
        int i = bigPath.lastIndexOf('.');
		String pathPre = bigPath.substring(0,i);
		String pathNext = bigPath.substring(i);
		return pathPre + "_small" + pathNext;
	}

}
