public abstract class AbstractTask {
    private Id whoId;

    public AbstractTask() {
        this.setWhoId(null);
    }

    public AbstractTask(final Id whoId) {
        this.setWhoId(whoId);
    }

    public void setWhoId(final Id whoId) {
        this.whoId = whoId;
    }

    public abstract Task create();

    protected Task createEmptyTask() {
        Task task = new Task();

        task.Priority = Tasks.NORMAL_PRIORITY;
        task.Status = Tasks.TO_DO_STATUS;
        task.ActivityDate = Date.today();
        task.WhoId = this.whoId;

        return task;
    }
}
