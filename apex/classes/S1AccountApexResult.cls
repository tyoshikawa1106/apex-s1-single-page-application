public with sharing class S1AccountApexResult {

    public Id recordId {get; set;}
    public List<String> errorMessages {get; set;}

    /**
     * コンストラクタ
     */
    public S1AccountApexResult() {
        this.recordId = null;
        this.errorMessages = new List<String>();
    }
}