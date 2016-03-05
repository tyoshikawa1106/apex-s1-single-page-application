@isTest
private class S1AccountControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void S1AccountControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            S1AccountController cls = new S1AccountController();
            
            Test.stopTest();
        }
    }

    /**
     * 取引先リストの取得
     * 値なし
     */
    static testMethod void getAccountsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<Account> results = S1AccountController.getAccounts();
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }

    /**
     * 取引先リストの取得
     * 値あり
     */
    static testMethod void getAccountsTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'sforce');
            insert account;

            Test.startTest();
            
            List<Account> results = S1AccountController.getAccounts();
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }

    /**
     * 取引先の削除
     * 値なし
     */
    static testMethod void deleteAccountTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String recordId = '';
            S1AccountApexResult result = S1AccountController.deleteAccount(recordId);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 取引先の削除
     * 値あり
     */
    static testMethod void deleteAccountTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'sforce');
            insert account;

            Test.startTest();
            
            String recordId = account.Id;
            S1AccountApexResult result = S1AccountController.deleteAccount(recordId);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 取引先の取得
     * 値なし
     */
    static testMethod void getAccountTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String recordId = '';
            Account result = S1AccountController.getAccount(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 取引先の取得
     * 値あり
     */
    static testMethod void getAccountTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'sforce');
            insert account;

            Test.startTest();
            
            String recordId = account.Id;
            Account result = S1AccountController.getAccount(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }


    /**
     * 取引先の登録
     * 値なし
     */
    static testMethod void saveAccountTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Account account = new Account();
            S1AccountApexResult result = S1AccountController.saveAccount(account);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.size(), 1);
            System.assertEquals(String.isEmpty(result.recordId), true);
        }
    }

    /**
     * 取引先の登録
     * 値あり
     */
    static testMethod void saveAccountTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'sforce');

            Test.startTest();
            
            S1AccountApexResult result = S1AccountController.saveAccount(account);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.size(), 0);
            System.assertEquals(String.isNotEmpty(result.recordId), true);
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
            List<Account> results = S1AccountController.getLookupAccounts(accountName);
            
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
            
            String accountName = 's';
            List<Account> results = S1AccountController.getLookupAccounts(accountName);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}