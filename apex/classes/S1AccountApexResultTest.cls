@isTest
private class S1AccountApexResultTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void S1AccountApexResultTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            S1AccountApexResult cls = new S1AccountApexResult();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.recordId), true);
            System.assertEquals(cls.errorMessages.size(), 0);
        }
    }
}