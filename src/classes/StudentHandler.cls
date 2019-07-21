public class StudentHandler {
    
    Set<ID> setTeacherID = new Set<ID>();
    Map<ID, List<Student__c>> mapIdToStudent = new Map<ID, List<Student__c>>();
    Map<ID, Teacher__c> mapIdToTeacher = new Map<ID,Teacher__c>();
    
    public void deleteStudentDetail(List<Student__c> stdt) {
        for(Student__c objstu: stdt) {
            setTeacherID.add(objstu.Teacher__c);
        }
    }
    
    public void upsertStudentDetail(List<Student__c> stdt) {
        for(Student__c objstu: stdt) {
            setTeacherID.add(objstu.Teacher__c);
        }
    }

}