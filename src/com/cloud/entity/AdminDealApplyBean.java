package com.cloud.entity;


public class AdminDealApplyBean {
	private String email;//用户邮箱
	private String phone;//用户电话
	private String name;//用户姓名
	private String department;//用户所在院系
	private String time;//申请云平台时间
	private String timed;//云平台使用时限
	private String uses;//用途
	private String systemType;//windows还是Linux类型的服务器
	private String configuration;//云平台资源配置
	private String domainName;//用户自己的域名
	private int state;//申请的资源审核状态  "0"审核中，"1" 通过，“2”拒绝，“3”到期
	private String temPort;//申请端口号
	private String inPortTrue;//实际内网端口号
	private String outPortTrue;//实际外网端口号
	private String reason;//拒绝申请理由
	private String location;//虚机物理归属
	private String note;//备注
	private String inIp;//内网ip
	private String outIp;//外网ip
	private String machineName;//虚机名称
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
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
	public String getUses() {
		return uses;
	}
	public void setUses(String uses) {
		this.uses = uses;
	}
	public String getSystemType() {
		return systemType;
	}
	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}
	public String getConfiguration() {
		return configuration;
	}
	public void setConfiguration(String configuration) {
		this.configuration = configuration;
	}
	public String getDomainName() {
		return domainName;
	}
	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public String getTemPort() {
		return temPort;
	}
	public void setTemPort(String temPort) {
		this.temPort = temPort;
	}
	public String getInPortTrue() {
		return inPortTrue;
	}
	public void setInPortTrue(String inPortTrue) {
		this.inPortTrue = inPortTrue;
	}
	public String getOutPortTrue() {
		return outPortTrue;
	}
	public void setOutPortTrue(String outPortTrue) {
		this.outPortTrue = outPortTrue;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getInIp() {
		return inIp;
	}
	public void setInIp(String inIp) {
		this.inIp = inIp;
	}
	public String getOutIp() {
		return outIp;
	}
	public void setOutIp(String outIp) {
		this.outIp = outIp;
	}
	public String getMachineName() {
		return machineName;
	}
	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}
	
}
