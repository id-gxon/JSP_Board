package com.itwillbs.servlet;

public class Phone {
	private String telNum;
	private String modelName;

	public String getTelNum() {
		return telNum;
	}

	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	
	@Override
	public String toString() {
		return "Phone [telNum=" + telNum + ", modelName=" + modelName + "]";
	}
}
