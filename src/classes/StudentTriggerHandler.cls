Public class StudentTriggerHandler
 {
    private boolean m_isExecuting = True;
    private integer BatchSize = 0;
    private final static boolean ISUPDATE_TRUE = true;
    private final static boolean ISUPDATE_FALSE = false;
    
    public StudentTriggerHandler(boolean isExecuting, integer size)
    {
        m_isExecuting = isExecuting;
        BatchSize = size;
        
    }
    public void onBeforeInsert(list<Student__c> triggerNew, map<id,Student__c> triggerNewMap)
    {
        // call Before Insert Method
    }
        
    public void OnAfterInsert(list<Student__c> triggerNew, map<id,Student__c> triggerNewMap)
    {
        // call After Insert Method
            
            CalculateStudentRecord(triggerNew,triggerNewMap);
    
    }
    
    public void OnBeforeUpdate(list<Student__c> triggerNew, map<id,Student__c> triggerNewMap, map<id,Student__c> triggerOldMap)
    {
       // call Before update Method
    }
    
    public void OnAfterUpdate(list<Student__c> triggerNew, map<id,Student__c> triggerNewMap)
    {
        // call After update Method
        CalculateStudentRecord(triggerNew,triggerNewMap);
    }
    
    public void OnBeforeDelete(list<Student__c> triggerOld, map<id,Student__c> triggerOldMap)
    {
        // call Before Delete Method
    }
    
    public void OnAfterDelete(list<Student__c> triggerOld, map<id,Student__c> triggerOldMap)
    {
        // call After Delete Method
    }
 
 
    private void CalculateStudentRecord(list<Student__c> triggerNew,map<id,Student__c> triggerNewMap)
    {
    
        Set<ID> setTeacherID = new Set<ID>();
        Map<ID, List<Student__c>> mapIdToStudent = new Map<ID, List<Student__c>>();
        Map<ID, Teacher__c> mapIdToTeacher = new Map<ID,Teacher__c>();
        
        for(Student__c objstu: triggerNew) {
               setTeacherID.add(objstu.Teacher__c);
           }
           


        for(Student__c objstudent: [select ID, First_Name__c , Teacher__c from Student__c where Teacher__c IN:setTeacherID ]) {

            if(mapIdToStudent.get(objstudent.Teacher__c) == null) {

                mapIdToStudent.put(objstudent.Teacher__c, new List<Student__c>());
            }
                mapIdToStudent.get(objstudent.Teacher__c).add(objstudent);
        }

        for(Teacher__c tc: [Select ID from Teacher__c where ID IN:setTeacherID ]) {

            mapIdToTeacher.put(tc.ID, tc);
        }

        List<Teacher__c>  updateTeacherList = new List<Teacher__c>();

        for(ID eachID: mapIdToStudent.keySet()) {

            Teacher__c tc = mapIdToTeacher.get(eachID);
            List<Student__c> listOfStudent = mapIdToStudent.get(eachID);
            tc.TotalSTudentCount__c = listOfStudent.size();
            updateTeacherList.add(tc);
            System.debug('ADDED LIST ' + updateTeacherList.size());
        }

        if(updateTeacherList != null && updateTeacherList.size() > 0) {
            update updateTeacherList;
        }

    }
  
  // create more method as per your requirement
}