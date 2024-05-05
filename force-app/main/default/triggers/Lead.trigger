trigger Lead on Lead (after insert) {
    LeadTriggerHandler triggerHandler = new LeadTriggerHandler(Trigger.new, Trigger.oldMap);
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            triggerHandler.handleAfterInsert();
        }
    }
}