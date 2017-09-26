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
    private int ID;
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
    @XmlElement(name = "bookStatus")
    private String bookStatus;
    
    public Booking(){
        
    }
    public Booking(int ID, String tutName, String tutEmail, String subject, String stuName, String stuEmail, String bookStatus) {
        this.ID = ID;
        this.tutName = tutName;
        this.tutEmail = tutEmail;
        this.subject = subject;
        this.stuName = stuName;
        this.stuEmail = stuEmail;
        this.bookStatus = bookStatus;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
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
        return bookStatus;
    }

    public void setStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }
    
}
