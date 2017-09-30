/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;

@XmlRootElement(namespace = "http://www.uts.edu.au/31284/wsd-diary", name = "bookings")
@XmlAccessorType(XmlAccessType.FIELD)
public class Bookings implements Serializable {

    @XmlElement(name = "booking")
    private ArrayList<Booking> list = new ArrayList<Booking>();
    private int id = 0;

    public Bookings() {
        // TODO Auto-generated constructor stub

    }

    public ArrayList<Booking> getList() {
        return list;
    }

    public void addBooking(Booking booking) {
        list.add(booking);
    }

    public void removeBooking(Booking booking) {
        list.remove(booking);
    }

    public Booking getBooking(int id) {
        for (Booking booking : list) {
            if (booking.getID() == id) {
                return booking;
            }
        }
        return null;
    }

    public ArrayList<Booking> getBookingByStuEmail(String stuEmail) {
        ArrayList<Booking> list2 = new ArrayList<>();
        for (Booking booking : list) {
            if (booking.getStuEmail().equals(stuEmail)) {
                list2.add(booking);
            }
        }
        return list2;
    }

    public ArrayList<Booking> getBookingBySubject(String subject) {
        ArrayList<Booking> list2 = new ArrayList<>();
        for (Booking booking : list) {
            if (booking.getSubject().equals(subject)) {
                list2.add(booking);
            }
        }
        return list2;
    }

    public ArrayList<Booking> getBookingByStatus(String bookStatus) {
        ArrayList<Booking> list2 = new ArrayList<>();
        for (Booking booking : list) {
            if (booking.getBookStatus().equals(bookStatus)) {
                list2.add(booking);
            }
        }
        return list2;
    }

    public Booking getBookingByTutEmail(String tutEmail) {
        for (Booking booking : list) {
            if (booking.getTutEmail().equals(tutEmail)) {
                return booking;
            }
        }
        return null;
    }

    public int getLastBooking() {
        id = 0;
        for (Booking booking : list) {
            id++;
        }
        return id;
    }
}
