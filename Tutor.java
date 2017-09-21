package uts.wsd;
import javax.xml.bind.annotation.*;
import java.io.Serializable;

@XmlAccessorType(XmlAccessType.FIELD)
public class Tutor implements Serializable {
	@XmlElement(name = "Email")
    private String email;
    @XmlElement(name = "Name")
    private String name;
    @XmlElement(name = "Password")
    private String password;
    @XmlElement(name = "DOB")
    private String dob;
    @XmlElement(name = "Subject")
    private String subject;
    @XmlElement(name = "Status")
    private String status;
    
	public Tutor(String email, String name, String password, String dob, String subject, String status) {
		super();
		this.email = email;
		this.name = name;
		this.password = password;
		this.dob = dob;
		this.subject = subject;
		this.status = status;
	}
	
	public Tutor() {
		// TODO Auto-generated constructor stub
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String showCredential(){
            return "<td>"+name+"</td><td>"+email+"</td><td>"+subject+"</td>";
        }
    
}

