public without sharing class Tasks extends SobjectDomain {

    // Priorities
    public static final String HIGH_PRIORITY = 'High';
    public static final String NORMAL_PRIORITY = 'Normal';
    public static final String LOW_PRIORITY = 'Low';

    // Types
    public static final String CALL_TYPE = 'Call';
    public static final String EMAIL_TYPE = 'Email';
    public static final String MEETING_TYPE = 'Meeting';
    public static final String OTHER_TYPE = 'Other';

    // Statuses
    public static final String TO_DO_STATUS = 'TO DO';
    public static final String IN_PROGRESS_STATUS = 'IN PROGRESS';
    public static final String DONE_STATUS = 'DONE';

    public Tasks(List<Task> tasks) {
        super(tasks);
    }
}