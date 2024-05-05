public abstract class AbstractTriggerHandler {
    private List<SObject> newRecords;
    private Map<Id, SObject> oldRecordsByIds;

    public AbstractTriggerHandler(
        List<SObject> newRecords,
        Map<Id, SObject> oldRecordsByIds
    ) {
        this.newRecords = newRecords == null ? new List<SObject>() : newRecords;
        this.oldRecordsByIds = oldRecordsByIds == null
            ? new Map<Id, SObject>()
            : oldRecordsByIds;
    }

    public abstract void handleAfterInsert();

    public List<SObject> getNewRecords() {
        return this.newRecords;
    }

    public Map<Id, SObject> getOldRecordsByIds() {
        return this.oldRecordsByIds;
    }
}
