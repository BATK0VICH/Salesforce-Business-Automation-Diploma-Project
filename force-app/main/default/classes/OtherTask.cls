public without sharing class OtherTask extends AbstractTask {
    
    public OtherTask() {
        super();
    }

    public OtherTask(final Id whoId) {
        super(whoId);
    }

    public override Task create() {
        Task task = this.createEmptyTask();
        task.Type = Tasks.OTHER_TYPE;
        task.Priority = Tasks.HIGH_PRIORITY;
        task.Subject = Tasks.OTHER_SUBJECT;
        return task;
    }
}