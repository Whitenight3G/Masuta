package uts.wsd;

import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(namespace = "http://www.uts.edu.au/31284/wsd-diary", name = "Tutors")
public class Tutors implements Serializable {

    @XmlElement(name = "Tutor")
    private ArrayList<Tutor> list = new ArrayList<Tutor>();

    public Tutors() {

    }

    public ArrayList<Tutor> getList() {
        return list;
    }

    public Tutor login(String email, String password) {
        for (Tutor tutor : list) {
            if (tutor.getEmail().equals(email) && tutor.getPassword().equals(password)) {
                return tutor;
            }
        }
        return null;
    }

    public void addTutor(Tutor tutor) {
        list.add(tutor);
    }

    public void removeTutor(Tutor tutor) {
        list.remove(tutor);
    }

    public Tutor getTutor(String email) {
        // For each user in the list...
        for (Tutor tutor : list) {
            if (tutor.getEmail().equals(email)) {
                return tutor;
            }
        }
        return null;
    }
}
