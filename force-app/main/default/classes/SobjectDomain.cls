public abstract class SobjectDomain {
    public List<SObject> records;
    
    public SobjectDomain(List<SObject> records) {
        this.records = records == null ? new List<SObject>() : records;
    }
}