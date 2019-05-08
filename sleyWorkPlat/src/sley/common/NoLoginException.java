/**
 * 
 */
package sley.common;

/**
 * @author WangLi
 * 
 */
public class NoLoginException extends Exception {

	/** 描述 (@author: wangli */

	private static final long serialVersionUID = 1L;

	public NoLoginException() {
	}

	public NoLoginException(String smg) {

		super(smg);
	}
}
