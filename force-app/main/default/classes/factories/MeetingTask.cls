public without sharing class MeetingTask extends AbstractTask {
    
    public MeetingTask() {
        super();
    }

    public MeetingTask(final Id whoId) {
        super(whoId);
    }

    public override Task create() {
        Task task = this.createEmptyTask();
        task.Type = Tasks.OTHER_TYPE;
        task.Priority = Tasks.HIGH_PRIORITY;
        task.ActivityDate = Date.today().addDays(1);
        task.Subject = Tasks.MEETING_SUBJECT;
        return task;
    }
}