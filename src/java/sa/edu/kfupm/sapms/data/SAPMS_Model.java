/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sa.edu.kfupm.sapms.data;

import banner.kfupm.edu.sa.DataServiceFault;
import banner.kfupm.edu.sa.Student;
import data.sapms.kfupm.edu.sa.PetitionType;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 *
 * @author Administrator
 */
public class SAPMS_Model
{

    public static Student getStudentInfo(String kfupmID) throws DataServiceFault, ExceptionInvalidStudentID
    {
        List<banner.kfupm.edu.sa.Student> studentList = operationGetStudentInformationByID(kfupmID);
        if (studentList.size() < 1)
        {
            throw new ExceptionInvalidStudentID(new Date(), kfupmID);
        }
        return studentList.get(0);
    }

    private static java.util.List<banner.kfupm.edu.sa.Student> operationGetStudentInformationByID(java.lang.String studentKFUPMID) throws DataServiceFault
    {
        banner.kfupm.edu.sa.BannerSAPMS service = new banner.kfupm.edu.sa.BannerSAPMS();
        banner.kfupm.edu.sa.BannerSAPMSPortType port = service.getSOAP11Endpoint();
        return port.operationGetStudentInformationByID(studentKFUPMID);
    }

    public static java.util.List<banner.kfupm.edu.sa.Course> getStudentTranscript(String kfupmID) throws DataServiceFault
    {
        return operationGetStudentTranscript(kfupmID);
    }

    private static java.util.List<banner.kfupm.edu.sa.Course> operationGetStudentTranscript(java.lang.String studentKFUPMID) throws DataServiceFault
    {
        banner.kfupm.edu.sa.BannerSAPMS service = new banner.kfupm.edu.sa.BannerSAPMS();
        banner.kfupm.edu.sa.BannerSAPMSPortType port = service.getSOAP11Endpoint();
        return port.operationGetStudentTranscript(studentKFUPMID);
    }

    public static boolean createPetition(String studentKFUPMID, String petitionText) throws data.sapms.kfupm.edu.sa.DataServiceFault, DatatypeConfigurationException
    {
        // ensure that student entry is in the SAPMS DB
        // // get student from SAPMS DB
        java.util.List<data.sapms.kfupm.edu.sa.Student> studentList = selectWithKeyStudentOperation(studentKFUPMID);
        // // if student does not exist
        if (studentList.size() < 1)
        {
            // // // insert student in SAPMS DB

            insertStudentOperation(studentKFUPMID);

        }
        // add petition in the DB
        // // prepare the data for the petition
        GregorianCalendar c = new GregorianCalendar();
        c.setTime(new Date());
        XMLGregorianCalendar date2 = DatatypeFactory.newInstance().newXMLGregorianCalendar(c);
        insertPetitionOperation(petitionText, studentKFUPMID, getPetitionTypeIDForUNKNOWN(), date2);
        return true;
    }

    private static java.util.List<data.sapms.kfupm.edu.sa.Student> selectWithKeyStudentOperation(java.lang.String kfupmId) throws data.sapms.kfupm.edu.sa.DataServiceFault
    {
        data.sapms.kfupm.edu.sa.SAPMSMainDataService service = new data.sapms.kfupm.edu.sa.SAPMSMainDataService();
        data.sapms.kfupm.edu.sa.SAPMSMainDataServicePortType port = service.getSOAP11Endpoint();
        return port.selectWithKeyStudentOperation(kfupmId);
    }

    private static void insertStudentOperation(java.lang.String kfupmId)
    {
        data.sapms.kfupm.edu.sa.SAPMSMainDataService service = new data.sapms.kfupm.edu.sa.SAPMSMainDataService();
        data.sapms.kfupm.edu.sa.SAPMSMainDataServicePortType port = service.getSOAP11Endpoint();
        port.insertStudentOperation(kfupmId);
    }

    private static void insertPetitionOperation(java.lang.String petitionText, java.lang.String studentKfupmId, java.lang.Integer petitionTypePetitionTypeId, javax.xml.datatype.XMLGregorianCalendar timestamp)
    {
        data.sapms.kfupm.edu.sa.SAPMSMainDataService service = new data.sapms.kfupm.edu.sa.SAPMSMainDataService();
        data.sapms.kfupm.edu.sa.SAPMSMainDataServicePortType port = service.getSOAP11Endpoint();
        port.insertPetitionOperation(petitionText, studentKfupmId, petitionTypePetitionTypeId, timestamp);
    }

    public static int getPetitionTypeIDForUNKNOWN() throws data.sapms.kfupm.edu.sa.DataServiceFault
    {
        java.util.List<data.sapms.kfupm.edu.sa.PetitionType> typeList = selectAllPetitionTypeOperation();
        for (PetitionType type : typeList)
        {
            if (type.getPetitionTypeDescription().equals("UNKNOWN"))
            {
                type.getPetitionTypeId();
            }
        }
        return 30;
    }

    private static java.util.List<data.sapms.kfupm.edu.sa.PetitionType> selectAllPetitionTypeOperation() throws data.sapms.kfupm.edu.sa.DataServiceFault
    {
        data.sapms.kfupm.edu.sa.SAPMSMainDataService service = new data.sapms.kfupm.edu.sa.SAPMSMainDataService();
        data.sapms.kfupm.edu.sa.SAPMSMainDataServicePortType port = service.getSOAP11Endpoint();
        return port.selectAllPetitionTypeOperation();
    }

}
