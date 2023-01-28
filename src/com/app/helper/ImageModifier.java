package com.app.helper;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

public class ImageModifier {
	
	public static boolean deleteFile(String path) {
		boolean f = true;
		try{
			File file = new File(path);
			f = file.delete();
			
		}catch(Exception e) {
			
		}
			
		return f;
	}
	
	public static boolean saveFile(InputStream is, String path) {
		boolean f = false;
		try {
			
			byte b[] = new byte[is.available()];
			is.read(b);
			FileOutputStream fos  = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f = true;
			
		}catch(Exception e) {
			
		}
		
		
		return f;
	}
	
	public static byte[] resizeImage(byte[] image) throws IOException {

	    ByteArrayInputStream bais = new ByteArrayInputStream(image);
	    Image tmpImage = ImageIO.read(bais);
	    ImageIcon imageIcon = new ImageIcon(tmpImage);
	    Image scaled = imageIcon.getImage().getScaledInstance(100, 100, Image.SCALE_SMOOTH);
	    BufferedImage buffered = ImageIO.read(new ByteArrayInputStream(image));
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    ImageIO.write(buffered, "jpeg", baos);
	    baos.flush();
	    image = baos.toByteArray();
	    baos.close();
	    return image;
	}

}
