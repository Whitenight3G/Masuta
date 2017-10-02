package uts.wsd;

import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;

@XmlRootElement(namespace = "http://www.uts.edu.au/31284/wsd-diary", name = "Students")
@XmlAccessorType(XmlAccessType.FIELD)
public class Students implements Serializable {

    @XmlElement(name = "Student")
    private ArrayList<Student> list = new ArrayList<Student>();

    public Students() {
        // TODO Auto-generated constructor stub

    }

    public ArrayList<Student> getList() {
        return list;
    }

    public Student login(String email, String password) {
        for (Student student : list) {
            if (student.getEmail().equals(email) && student.getPassword().equals(password)) {
                return student;
            }
        }
        return null;
    }

    public void addStudent(Student student) {
        list.add(student);
    }

    public void removeStudent(Student student) {
        list.remove(student);
    }

    public Student getStudent(String email) {
        // For each user in the list...
        for (Student student : list) {
            if (student.getEmail().equals(email)) {
                return student;
            }
        }
        return null;
    }
}
