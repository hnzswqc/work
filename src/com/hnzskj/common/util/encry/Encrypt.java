package com.hnzskj.common.util.encry;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
/**
 * 
 * 项目名称：spms   <br/>
 * 类名称：Encrypt.java   <br/>
 * 类描述： 密码加密 <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-6 下午06:01:35   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-6 下午06:01:35   <br/>
 * 修改备注：    <br/>
 * @version  1.0
 */
public class Encrypt {
	/**
	 * md5加密算法
	 * 
	 * @param source
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public static String md5(String source) {
		MessageDigest messageDigest;
		try {
			messageDigest = MessageDigest.getInstance("MD5");
			// 开始使用算法
			messageDigest.update(source.getBytes("UTF-8"));
			// 输出算法运算结果
			byte[] retValue = messageDigest.digest();
			return new String(retValue,"UTF-8");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * base64加密
	 * 
	 * @param source
	 * @return
	 */
	public static String base64(String source) {
		BASE64Encoder encoder = new BASE64Encoder();
		try {
			return encoder.encode(source.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 默认加密算法，先用md5加密，然后转换成64进制编码
	 * 
	 * @param source
	 * @return
	 */
	public static String digest(String source) {
		return base64(md5(source));
	}

	/**
	 * 方法描述：Base64解密<br/>
	 * 创建人：苏国庆   <br/>
	 * 创建时间：2012-2-15 上午10:15:35<br/>         
	 * @param strMi
	 * @return
	 * @version   1.0  
	 */
	public static String getDecoderBase64(String strMi) {
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] decodedBytes = null;
        String str = "";
		try {
			decodedBytes = decoder.decodeBuffer(strMi);
			str = new String(decodedBytes, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/*String source = "654321";
		System.out.println("md5(" + source + ")=" + md5(source));
		System.out.println("base64(" + source + ")=" + base64(source));
		System.out.println("digest(" + source + ")=" + digest(source));
		System.out.println(digest("admin"));*/
//		System.out.println(digest("hnzskj"));
		String string = base64("2017-06-10");
		//string=string.replace("\r\n", "");
		System.out.println(string);
		
//		
		//System.out.println(digest("dGVzdCo0N2VjNDdlYy0xM2MxZWIxOTMyYS03MjEwNWIxNmMwYzYzYTI3NWI0NmFkYTUwMzk4NTZjMCo4KlN0cmluZypiYWY1YjUzLTExNzZiYzk5ZTU5LWIzNDExYzUzYTRlYjE1YTJhMThhOTE5MjcyMDA3MDRi"));
		System.out.println(getDecoderBase64("MjAxNy0wNi0xMA=="));
		//System.out.println(getDecoderBase64("dGVzdCo0N2VjNDdlYy0xM2MxZWIxOTMyYS03MjEwNWIxNmMwYzYzYTI3NWI0NmFkYTUwMzk4NTZjMCo4KlN0cmluZypiYWY1YjUzLTExNzZiYzk5ZTU5LWIzNDExYzUzYTRlYjE1YTJhMThhOTE5MjcyMDA3MDRi"));
		
	}
}
