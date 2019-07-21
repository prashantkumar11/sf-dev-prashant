trigger AccountTrigger on Account (after insert, after update) 
{
    
    Account_TriggerHandlerHelperClass   objHandler = new Account_TriggerHandlerHelperClass();
    
    if (Trigger.isInsert && Trigger.isAfter )
    {
        objHandler.onAfterInsert(Trigger.New);
    }
    if (Trigger.isUpdate && Trigger.isAfter)
    {
         objHandler.onAfterUpdate(Trigger.New,Trigger.oldMap);
            
    }
    
    
   
    
}