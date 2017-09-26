package uts.wsd;

import java.io.*;
import javax.xml.bind.*;

public class BookingApp implements Serializable {

    private String filePath;
    private Bookings bookings;

    public BookingApp(String filePath, Bookings bookings) {
        super();
        this.filePath = filePath;
        this.bookings = bookings;
    }

    public BookingApp() {
        // TODO Auto-generated constructor stub
    }

    public void updateXML(Bookings bookings, String filePath) throws Exception {
        this.bookings = bookings;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(bookings, fout);
        fout.close();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws Exception {
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        bookings = (Bookings) u.unmarshal(fin);
        fin.close();
    }

    public Bookings getBookings() {
        return bookings;
    }

    public void setBookings(Bookings bookings) {
        this.bookings = bookings;
    }

    public void saveBookings() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(bookings, fout);
        fout.close();
    }

}
