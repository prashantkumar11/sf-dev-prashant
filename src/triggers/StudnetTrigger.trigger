trigger StudnetTrigger on student__C (after insert, after update, before delete, before insert, before update) 
{
    StudentTriggerHandler triggerHandler = new StudentTriggerHandler(Trigger.isExecuting,Trigger.size);
   
    if(Trigger.isBefore && Trigger.isInsert){
        triggerHandler.OnBeforeInsert(trigger.new, trigger.NewMap);
    }
   
    if(Trigger.isAfter && Trigger.isInsert){
        triggerHandler.OnAfterInsert(trigger.new, trigger.NewMap);
    }
   
    if(Trigger.isBefore && Trigger.isUpdate){       
        triggerHandler.OnBeforeUpdate(trigger.new, trigger.NewMap, Trigger.oldMap);
    }
   
    if(Trigger.isAfter && Trigger.isUpdate){
        triggerHandler.OnAfterUpdate(trigger.new, trigger.NewMap);
    }
        
    if(Trigger.isBefore && Trigger.isDelete){       
        triggerHandler.OnBeforeDelete(trigger.Old, Trigger.oldMap);
    }
   
    if(Trigger.isAfter && Trigger.isDelete){
        triggerHandler.OnAfterDelete(trigger.Old, Trigger.oldMap);
    }
}