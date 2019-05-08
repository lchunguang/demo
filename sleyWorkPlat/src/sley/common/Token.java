/**
 * 防止订单重复提交的Token串生成类
 */
package sley.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author WangLi 防止订单重复提交的Token串生成类
 */
public class Token {
	/**
	 * 将生成的Token保存到session和request域中
	 * 
	 * @param request
	 */
	public synchronized void saveToken(HttpServletRequest request) {
		String token = GenerateToken(request);
		HttpSession session = request.getSession();
		session.setAttribute("token_key", token);
		request.setAttribute("token_key", token);

	}

	/**
	 * 生成token
	 * 
	 * @param request
	 * @return
	 */
	public synchronized String GenerateToken(HttpServletRequest request) {
		HttpSession session = request.getSession();
		byte id[] = session.getId().getBytes();
		byte now[] = new Long(System.currentTimeMillis()).toString().getBytes();
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(id);
			md.update(now);
			return toHex(md.digest());
		} catch (NoSuchAlgorithmException e) {
			return (null);
		}

	}

	/**
	 * 转成十六进制
	 * 
	 * @param buffer
	 * @return
	 */
	public static String toHex(byte[] buffer) {
		StringBuffer sb = new StringBuffer(buffer.length * 2);
		for (int i = 0; i < buffer.length; i++) {
			sb.append(Character.forDigit((buffer[i] & 0xf0) >> 4, 16));
			sb.append(Character.forDigit(buffer[i] & 0x0f, 16));
		}
		return sb.toString();
	}

	/**
	 * 判断Token串是否有效， 防止訂單重複提交
	 * 
	 * @param request
	 * @return
	 */
	public synchronized boolean isTokenValid(HttpServletRequest request) {
		String saved = null;
		String token = request.getParameter("token_key");
		if (token == null) {
			return false;
		}
		HttpSession session = request.getSession(false);
		if (session == null) {
			return false;
		} else {
			saved = (String) session.getAttribute("token_key");
			session.removeAttribute("token_key");
			if (saved == null) {
				return false;
			} else {
				return saved.equals(token);
			}
		}

	}

}
