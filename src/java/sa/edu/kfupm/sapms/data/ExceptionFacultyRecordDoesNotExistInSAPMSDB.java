/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sa.edu.kfupm.sapms.data;

import java.util.Date;

/**
 *
 * @author Administrator
 */
public class ExceptionFacultyRecordDoesNotExistInSAPMSDB extends Exception
{
private final String facultyKFUPMID;
    private final Date accessTime;
    public ExceptionFacultyRecordDoesNotExistInSAPMSDB(Date time, String kfupmID)
    {
        this.facultyKFUPMID = kfupmID;
        this.accessTime = time;
    }
    
    @Override
    public String toString()
    {
        return "Faculty " + this.facultyKFUPMID + " does not exist in the SAPMS datastore on:" + accessTime.toString();
    }
}
