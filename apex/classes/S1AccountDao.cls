public with sharing class S1AccountDao {

    /**
     * コンストラクタ
     */
    public S1AccountDao() {
        
    }

    /**
     * 取引先リスト取得
     */
    public List<Account> getAccounts() {
        return [
            SELECT
                 Id
                ,Name
                ,PhotoUrl
                ,AccountNumber
                ,ParentId
                ,Parent.Name
                ,Parent.PhotoUrl
                ,Website
                ,BillingPostalCode
                ,BillingCountry
                ,BillingState
                ,BillingCity
                ,BillingStreet
            FROM
                Account
            ORDER BY Name ASC
            LIMIT 200
        ];
    }

    /**
     * 削除の取引先取得
     */
    public List<Account> getDeleteAccount(String recordId) {
        return [SELECT Id FROM Account WHERE Id =: recordId LIMIT 1];
    }

    /**
     * 取引先取得
     */
    public Account getAccount(String recordId) {
        List<Account> accounts = [
            SELECT
                 Id
                ,Name
                ,PhotoUrl
                ,AccountNumber
                ,ParentId
                ,Parent.Name
                ,Parent.PhotoUrl
                ,Website
                ,BillingPostalCode
                ,BillingCountry
                ,BillingState
                ,BillingCity
                ,BillingStreet
            FROM
                Account
            WHERE
                Id =: recordId
            LIMIT 1
        ];
        return accounts.isEmpty() ? new Account() : accounts[0];
    }

    /**
     * 取引先ルックアップ一覧取得
     */
    public List<Account> getLookupAccounts(String accountName) {
        String key = accountName + '%';
        return [SELECT Id,Name,PhotoUrl FROM Account WHERE Name LIKE: key LIMIT 200];
    }
}