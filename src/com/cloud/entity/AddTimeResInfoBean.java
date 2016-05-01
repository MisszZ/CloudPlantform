package com.cloud.entity;


public class AddTimeResInfoBean {

	private String machineName;
	private String outIp;
	private String outPortTrue;
	private String time;
	private String timed;
	public String getMachineName() {
		return machineName;
	}
	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}

	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTimed() {
		return timed;
	}
	public void setTimed(String timed) {
		this.timed = timed;
	}
	public String getOutIp() {
		return outIp;
	}
	public void setOutIp(String outIp) {
		this.outIp = outIp;
	}
	public String getOutPortTrue() {
		return outPortTrue;
	}
	public void setOutPortTrue(String outPortTrue) {
		this.outPortTrue = outPortTrue;
	}
	
}
