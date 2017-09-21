package uts.wsd;
import java.io.*;
import javax.xml.bind.*;

public class TutorApp  implements Serializable{

	private String filePath;
    private Tutors tutors;
    
	public TutorApp(String filePath, Tutors tutors) {
		super();
		this.filePath = filePath;
		this.tutors = tutors;
	}
    
    public TutorApp() {
		// TODO Auto-generated constructor stub
	}
    
    public void updateXML(Tutors tutors, String filePath) throws Exception {
        this.tutors = tutors;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(tutors, fout);
        fout.close();
    }
    
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) throws Exception{
		JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        tutors = (Tutors) u.unmarshal(fin); 		
        fin.close();
	}
	
	public Tutors getTutors() {
		return tutors;
	}

	public void setTutors(Tutors tutors) {
		this.tutors = tutors;
	}
    
	public void saveTutors() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(tutors, fout);
        fout.close();
    }
    
    
    
}
