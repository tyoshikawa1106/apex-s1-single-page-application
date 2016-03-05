@isTest
private class S1AccountDaoTest {

    private static S1AccountDao dao = new S1AccountDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 取引先リスト取得
     * 値なし
     */
    static testMethod void getAccountsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<Account> results = dao.getAccounts();
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 取引先リスト取得
     * 値あり
     */
    static testMethod void getAccountsTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'sforce');
            insert account;

            Test.startTest();
            
            List<Account> results = dao.getAccounts();
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }

    /**
     * 削除の取引先取得
     * 値なし
     */
    static testMethod void getDeleteAccountTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String recordId = '';
            List<Account> results = dao.getDeleteAccount(recordId);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 削除の取引先取得
     * 値なし
     */
    static testMethod void getDeleteAccountTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'sforce');
            insert account;

            Test.startTest();
            
            String recordId = account.Id;
            List<Account> results = dao.getDeleteAccount(recordId);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }

    /**
     * 取引先取得
     * 値なし
     */
    static testMethod void getAccountTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String recordId = '';
            Account result = dao.getAccount(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 取引先取得
     * 値あり
     */
    static testMethod void getAccountTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'sforce');
            insert account;

            Test.startTest();
            
            String recordId = account.Id;
            Account result = dao.getAccount(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }

    /**
     * 取引先ルックアップ一覧取得
     * 値なし
     */
    static testMethod void getLookupAccountsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String accountName = '';
            List<Account> results = dao.getLookupAccounts(accountName);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 取引先ルックアップ一覧取得
     * 値あり
     */
    static testMethod void getLookupAccountsTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'sforce');
            insert account;

            Test.startTest();
            
            String accountName = '';
            List<Account> results = dao.getLookupAccounts(accountName);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}