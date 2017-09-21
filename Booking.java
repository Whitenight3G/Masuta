/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

/**
 *
 * @author erena
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Booking implements Serializable{
    @XmlElement(name = "ID")
    private String ID;
    @XmlElement(name = "tutName")
    private String tutName;
    @XmlElement(name = "tutEmail")
    private String tutEmail;
    @XmlElement(name = "subject")
    private String subject;
    @XmlElement(name = "stuName")
    private String stuName;
    @XmlElement(name = "stuEmail")
    private String stuEmail;
    @XmlElement(name = "status")
    private String status;
    
    public Booking(){
        
    }
    public Booking(String ID, String tutName, String tutEmail, String subject, String stuName, String stuEmail, String status) {
        this.ID = ID;
        this.tutName = tutName;
        this.tutEmail = tutEmail;
        this.subject = subject;
        this.stuName = stuName;
        this.stuEmail = stuEmail;
        this.status = status;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getTutName() {
        return tutName;
    }

    public void setTutName(String tutName) {
        this.tutName = tutName;
    }

    public String getTutEmail() {
        return tutEmail;
    }

    public void setTutEmail(String tutEmail) {
        this.tutEmail = tutEmail;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuEmail() {
        return stuEmail;
    }

    public void setStuEmail(String stuEmail) {
        this.stuEmail = stuEmail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
