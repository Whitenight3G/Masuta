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
    public void addBooking(Booking booking) {
		list.add(booking);
	}
    public Booking getBooking(int id){
        for(Booking booking:list){
            if(booking.getID()==id){
                return booking;
            }
        }
        return null;
    }
    public Booking getBookingByEmail(String stuEmail){
        for(Booking booking:list){
            if(booking.getStuEmail().equals(stuEmail)){
                return booking;
            }
        }
        return null;
    }
/*
    public void addBooking(Booking user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/
}