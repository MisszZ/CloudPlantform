package com.cloud.entity;

public class SomeInfoOfMaBean {

	private String domainName;//用户自己的域名
	private String outIp;//外网ip
	private String outPortTrue;//实际外网端口号
	private String inPortTrue;//实际内网端口号
	public String getDomainName() {
		return domainName;
	}
	public void setDomainName(String domainName) {
		this.domainName = domainName;
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
	public String getInPortTrue() {
		return inPortTrue;
	}
	public void setInPortTrue(String inPortTrue) {
		this.inPortTrue = inPortTrue;
	}
	
}
