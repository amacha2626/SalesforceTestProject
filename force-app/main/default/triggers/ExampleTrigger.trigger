trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        EmailManager.sendmail('a-imamura@ikk-grp.jp', 'Trailhead Trigger Tutorial', recordCount + ' contact(s) were inseted.');
    }
    else if (Trigger.isDelete) {
        
    }
}