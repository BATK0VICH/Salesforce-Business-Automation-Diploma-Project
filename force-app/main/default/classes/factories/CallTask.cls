public without sharing class CallTask extends AbstractTask {
    
    public CallTask() {
        super();
    }

    public CallTask(final Id whoId) {
        super(whoId);
    }

    public override Task create() {
        Task task = this.createEmptyTask();
        task.Type = Tasks.OTHER_TYPE;
        task.Subject = Tasks.CALL_SUBJECT;
        task.Priority = Tasks.HIGH_PRIORITY;
        return task;
    }
}