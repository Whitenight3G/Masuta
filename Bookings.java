/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;


@XmlRootElement( namespace = "http://www.uts.edu.au/31284/wsd-diary", name = "Bookings")
@XmlAccessorType(XmlAccessType.FIELD)
public class Bookings implements Serializable {
	
    @XmlElement(name = "Booking")
    private ArrayList<Booking> list = new ArrayList<Booking>();
 
    public Bookings() {
		// TODO Auto-generated constructor stub
    		
	}
    
    public ArrayList<Booking> getList() {
		return list;
	}
    public void addListing(Booking booking) {
		list.add(booking);
	}
}