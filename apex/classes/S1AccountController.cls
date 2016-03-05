public with sharing class S1AccountController {

    private static S1AccountDao dao = new S1AccountDao();

    /**
     * コンストラクタ
     */
    public S1AccountController() {
        
    }

    /**
     * 取引先リストの取得
     */
    @RemoteAction
    public static List<Account> getAccounts() {
        return dao.getAccounts();
    }

    /**
     * 取引先の削除
     */
    @RemoteAction
    public static S1AccountApexResult deleteAccount(String recordId) {
        S1AccountApexResult result = new S1AccountApexResult();
        try {
            delete dao.getDeleteAccount(recordId);
        } catch(DmlException e) {
            result.errorMessages.add(e.getDmlMessage(0));
            return result;
        } catch(Exception e) {
            result.errorMessages.add(e.getMessage());
            return result;
        }
        
        return result;
    }

    /**
     * 取引先の取得
     */
    @RemoteAction
    public static Account getAccount(String recordId) {
        return dao.getAccount(recordId);
    }

    /**
     * 取引先の登録
     */
    @RemoteAction
    public static S1AccountApexResult saveAccount(Account account) {
        S1AccountApexResult result = new S1AccountApexResult();
        try {
            upsert account;
            result.recordId = account.Id;
        } catch(DmlException e) {
            result.errorMessages.add(e.getDmlMessage(0));
            return result;
        } catch(Exception e) {
            result.errorMessages.add(e.getMessage());
            return result;
        }
        
        return result;
    }

    /**
     * 取引先ルックアップ一覧取得
     */
    @RemoteAction
    public static List<Account> getLookupAccounts(String accountName) {
        if (String.isEmpty(accountName)) {
            return new List<Account>();
        }
        return dao.getLookupAccounts(accountName);
    }
}