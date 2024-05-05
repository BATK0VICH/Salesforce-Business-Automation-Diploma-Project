public without sharing class TaskFactory {
    public static final Map<String, Type> TASKS_BY_TYPE = new Map<String, Type> {
        Tasks.CALL_TYPE => CallTask.class,
        Tasks.EMAIL_TYPE => EmailTask.class,
        Tasks.MEETING_TYPE => MeetingTask.class,
        Tasks.OTHER_TYPE => OtherTask.class
    };

    public AbstractTask getTask(final Id whoId, final String taskType) {
        final Type taskClassType = TASKS_BY_TYPE.get(taskType);
        if (taskClassType == null) {
            return null;
        }

        AbstractTask abstractTask = (AbstractTask) taskClassType.newInstance();
        abstractTask.setWhoId(whoId);

        return abstractTask;
    }
}
