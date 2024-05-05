public without sharing class EmailTask extends AbstractTask {
    
    public EmailTask() {
        super();
    }

    public EmailTask(final Id whoId) {
        super(whoId);
    }

    public override Task create() {
        Task task = this.createEmptyTask();
        task.Type = Tasks.EMAIL_TYPE;
        return task;
    }
}