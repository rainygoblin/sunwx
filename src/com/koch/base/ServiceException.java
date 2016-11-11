package com.koch.base;


public class ServiceException extends Exception implements MessageAlertable,Logable{
	private static final long serialVersionUID = 1L;
   
	public ServiceException(String msg,Throwable e){
		super(msg, e);
	}
	
}
