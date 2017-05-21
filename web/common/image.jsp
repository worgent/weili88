<%@ page contentType="image/jpeg"
	import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>
	<%@ page import="com.sun.image.codec.jpeg.*"%>
<%@ page import="com.sun.image.codec.jpeg.*"%>
<%@ page import="base.constant.SystemGlobalConstant" %>


<%

	int width = 60, height = 20;
	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics g = image.getGraphics();
	g.setColor(Color.white);
	g.fillRect(0, 0, width, height);
	g.setColor(Color.black);
	g.drawRect(0, 0, width - 1, height - 1);
	String rand = String.valueOf(new Double(Math.random() * 8000 + 1000).intValue());
	session.setAttribute(SystemGlobalConstant.KEY_RAND_SESSION, rand);
	g.setColor(Color.black);
	g.setFont(new Font("Times New Roman", Font.PLAIN, 20));
	g.drawString(rand, 10, 17);
	Random random = new Random();
	for (int i = 0; i < 99; i++) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		g.drawLine(x, y, x, y);
	}
	g.dispose();
	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
	encoder.encode(image);
	//ImageIO.write(image, "JPEG", response.getOutputStream());
    out.clear(); 
	out=pageContext.pushBody(); 
%>
