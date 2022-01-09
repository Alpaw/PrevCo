package BeanPackage;

public class NotificationBean {
	private java.sql.Timestamp date;
	private int type;
	private int sendBy;
	private int autoId;

	public java.sql.Timestamp getDate() {
		return date;
	}

	public void setDate(java.sql.Timestamp date) {
		this.date = date;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		// TODO Auto-generated method stub
		this.type = type;
	}
	
	public int getSendBy() {
		return sendBy;
	}

	public void setSendBy(int sendBy) {
		// TODO Auto-generated method stub
		this.sendBy = sendBy;
	}

	public int getAutoId() {
		return autoId;
	}

	public void setAutoId(int autoId) {
		this.autoId = autoId;
	}


}
