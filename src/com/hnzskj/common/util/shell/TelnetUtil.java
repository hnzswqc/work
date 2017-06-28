/*
 * @项目名称: ShellUtil
 * @文件名称: TelnetUtil.java
 * @日期: 2017-3-23 下午02:21:00  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.shell;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;

import org.apache.commons.net.telnet.TelnetClient;

/**    
 * 项目名称：ShellUtil   <br/>
 * 类名称：TelnetUtil.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-3-23 下午02:21:00   <br/>
 * 修改人：King   <br/>
 * 修改时间：2017-3-23 下午02:21:00   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class TelnetUtil {

	/**
	 * 结束标识字符窜，Window中是>,linux中是#
	 */
	private String prompt=">";
	
	/**
	 * 结束标识字符窜
	 */
	private char promptChar='>';
	
	  /** 
     * TelnetClient对象 
     */  
    private TelnetClient telnet; 
	
	/**
	 * inputStream输入流，接收返回的信息
	 */
	private InputStream in;
	
	/**
	 * PrintStream向服务器写入命令
	 */
	private PrintStream out;
	
	
	/** 
     * 构造函数 
     * @param termtype 
     * @param prompt 
     */  
    public TelnetUtil(String termtype,String prompt){  
        telnet = new TelnetClient(termtype);  
        setPrompt(prompt);  
    }  
    
    /** 
     * 构造函数 
     * @param termtype 
     */  
    public TelnetUtil(String termtype){  
        telnet = new TelnetClient(termtype);  
    }  
      
    /** 
     * 构造函数 
     */  
    public TelnetUtil(){  
        telnet = new TelnetClient();  
    }  
      
    /** 
     * 登录到目标主机 
     * @param ip Ip地址 
     * @param port 端口号 
     * @param username 用户名 
     * @param password 密码 
     */  
    public void login(String ip, int port, String username, String password){  
        try {  
            telnet.connect(ip, port);  
            in = telnet.getInputStream();  
            out = new PrintStream(telnet.getOutputStream());  
            readUntil("Login username:");  
            write(username);  
            readUntil("Login password:");  
            write(password);  
            readUntil("Domain name:");  
            write(username);  
            String rs = readUntil(null);  
            if(rs!=null&&rs.contains("Login Failed")){  
                throw new RuntimeException("登录失败");  
            }  
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
    
      
    /** 
     * 读取分析结果 
     * @param pattern   匹配到该字符串时返回结果 
     * @return String 
     */  
    public String readUntil(String pattern) {  
        StringBuffer sb = new StringBuffer();  
        try {  
            char lastChar = (char)-1;  
            boolean flag = pattern!=null&&pattern.length()>0;  
            if(flag)  
                lastChar = pattern.charAt(pattern.length() - 1);  
            char ch;  
            int code = -1;  
            while ((code = in.read()) != -1) {  
                ch = (char)code;  
                sb.append(ch);  
                //匹配到结束标识时返回结果  
                if (flag) {  
                    if (ch == lastChar && sb.toString().endsWith(pattern)) {  
                        return sb.toString();  
                    }  
                }else{  
                    //如果没指定结束标识,匹配到默认结束标识字符时返回结果  
                    if(ch == promptChar)  
                        return sb.toString();  
                }  
                //登录失败时返回结果  
                if(sb.toString().contains("Login Failed")){  
                    return sb.toString();  
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return sb.toString();  
    }  
      
    /** 
     * 发送命令 
     * @param value 
     */  
    public void write(String value) {  
        try {  
            out.println(value);  
            out.flush();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
      
     
    
    
    /**
     * 
     * 方法描述：发送命令,返回执行结果 <br/>
     * 创建人：King   <br/>
     * 创建时间：2017-4-5 下午07:21:33<br/>         
     * @param command telnet命令  <br/>   
     * @return String 命令执行结果 <br/>   
     * @version   1.0<br/>
     */
    public String sendCommand(String command) {  
        try {  
            write(command);  
            return readUntil(prompt);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }
        return null;  
    }  
      
   /**
    * 
    * 方法描述：关闭连接<br/>
    * 创建人：King   <br/>
    * 创建时间：2017-4-5 下午07:22:06<br/>         
    * @param <br/>   
    * @return <br/>   
    * @version   1.0<br/>
    */
    public void distinct(){  
        try {  
        	sendCommand("exit");
        	if(telnet!=null&&!telnet.isConnected())  
                telnet.disconnect();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
  
    /**
     * 
     * 方法描述：设置结束标识符 <br/>
     * 创建人：King   <br/>
     * 创建时间：2017-4-5 下午07:22:27<br/>         
     * @param <br/>   
     * @return <br/>   
     * @version   1.0<br/>
     */
    public void setPrompt(String prompt) {  
        if(prompt!=null){  
            this.prompt = prompt;  
            this.promptChar = prompt.charAt(prompt.length()-1);  
        }  
    }  
      
    /** 
     *功能说明:测试函数 
     * 
     *输入参数:args 
     * 
     *输出参数: 
     * 
     *创建人:Gansuper 
     * 
     *创建时间:2014-9-19 下午06:06:40 
     * @throws UnsupportedEncodingException 
     */  
    public static void main(String[] args) throws UnsupportedEncodingException {  
    	TelnetUtil telnet = new TelnetUtil("VT100",">");//Windows,用VT220,否则会乱码  
        telnet.login("192.168.0.182", 23, "administrator", "hnzsfwq");  
        /*String rs = telnet.sendCommand("ipconfig"); 
        try { 
            rs = new String(rs.getBytes("ISO-8859-1"),"UTF-8");//转一下编码 
        } catch (UnsupportedEncodingException e) { 
            e.printStackTrace(); 
        } 
        System.out.println(rs);
        //23为默认端口  
        String command1 = telnet.sendCommand("telnet 192.168.0.73 23");  
        System.out.println(command1);  
        String r1 = telnet.sendCommand("d:");  
        System.out.println(r1);  
        String r2 = telnet.sendCommand("cd Program Files");    
        System.out.println(r2);   
        String r3 = telnet.sendCommand("cd QQGAME");   
        System.out.println(r3);   
       //telnet.distinct();    */
        
        /*
        String r1 = telnet.sendCommand("h:");  
        System.out.println(new String(r1.getBytes("ISO-8859-1"),"GBK"));  
        String r2 = telnet.sendCommand("cd apache-tomcat-6.0.20\bin");    
        System.out.println(new String(r2.getBytes("ISO-8859-1"),"GBK"));
        String r3 = telnet.sendCommand("s.bat");  
        System.out.println(new String(r3.getBytes("ISO-8859-1"),"GBK"));*/
        String r1 = telnet.sendCommand("java -version");  
        System.out.println(new String(r1.getBytes("ISO-8859-1"),"GBK"));  
        telnet.distinct();
    }  
	
}
