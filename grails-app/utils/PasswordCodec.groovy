import java.security.MessageDigest
import sun.misc.BASE64Encoder
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author wufei
 */
class PasswordCodec {
	def encode = {  
	str ->  
	//用 SHA 加密密码  
	MessageDigest md = MessageDigest.getInstance('SHA')  
	md.update(str.getBytes('UTF-8'))  
	//把SHA加密产生的字节数组交给BASE64在加密一把，并返回该字符串  
	return(new BASE64Encoder()).encode(md.digest())  
      }  
}

