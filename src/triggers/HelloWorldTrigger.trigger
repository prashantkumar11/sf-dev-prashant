trigger HelloWorldTrigger on Account (before insert) {
    for(Account ac: Trigger.New) {
        ac.Description = 'New Description';
    }
}