public without sharing class TaskService {
    private TaskFactory taskFactory = new TaskFactory();

    public List<Task> createDefaultTasksFor(final Lead lead) {
        List<Task> defaultTasks = new List<Task>();
        defaultTasks.add(this.createDefaultResearchTask(lead));
        defaultTasks.add(this.createDefaultEmailTask(lead));
        defaultTasks.add(this.createDefaultCallTask(lead));
        defaultTasks.add(this.createDefaultMeetingTask(lead));
        return defaultTasks;
    }

    public Task createDefaultResearchTask(final Lead newLead) {
        AbstractTask researchTask = this.taskFactory.getTask(
            newLead.Id,
            Tasks.OTHER_TYPE
        );

        Task task = researchTask.create();
        task.Subject = Tasks.RESEARCH_SUBJECT;
        task.Description =
            'Before you start, do a research about ' + newLead.Company;

        return task;
    }

    public Task createDefaultEmailTask(final Lead newLead) {
        AbstractTask emailTask = this.taskFactory.getTask(
            newLead.Id,
            Tasks.EMAIL_TYPE
        );

        Task task = emailTask.create();
        task.Description =
            'Share intersted products with ' +
            newLead.FirstName +
            ' ' +
            newLead.LastName +
            ' who is intrested in ' +
            newLead.ProductInterest__c;

        return task;
    }

    public Task createDefaultCallTask(final Lead newLead) {
        AbstractTask callTask = this.taskFactory.getTask(
            newLead.Id,
            Tasks.CALL_TYPE
        );

        Task task = callTask.create();
        task.Description =
            'Follow up with ' +
            newLead.FirstName +
            ' ' +
            newLead.LastName +
            ' who is intrested in ' +
            newLead.ProductInterest__c +
            ' for ' +
            newLead.Company;

        return task;
    }

    public Task createDefaultMeetingTask(final Lead newLead) {
        AbstractTask meetingTask = this.taskFactory.getTask(
            newLead.Id,
            Tasks.MEETING_TYPE
        );

        Task task = meetingTask.create();
        task.Description =
            'Schedule meeting with ' +
            newLead.FirstName +
            ' ' +
            newLead.LastName +
            ' from ' +
            newLead.Company +
            ' who is intrested in ' +
            newLead.ProductInterest__c;

        return task;
    }
}
