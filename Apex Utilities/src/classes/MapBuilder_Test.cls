/**

 */
@isTest
private class MapBuilder_Test 
{

    private static testMethod void GroupSObjectListByField_Test_WithAccounts_NoDML() 
    {
    	Integer numAccs = 300;
    	
    	list<Account> accs = new list<Account>();
    	
    	for(Integer i = 0; i < numAccs; i++)
    	{
    		Account a;
    		if(Math.mod(i, 3) == 0)
    		{
    			a = new Account(Name = 'Account Name 1');
    		}
    		else if(Math.mod(i, 3) == 1)
    		{
    			a = new Account(Name = 'Account Name 2');
    		}
    		else
    		{
    			a = new Account(Name = 'Account Name 3');
    		}
    		accs.add(a);
    	}
		
		test.startTest();
			map<Object, list<SObject>> result = MapBuilder.GroupSObjectListByField(accs, Account.Name.GetDescribe().getSObjectField());
		test.stopTest();
		
		system.assertEquals(3, result.size());
		system.assert(result.containsKey('Account Name 1'));
		list<Account> resultAccs = result.get('Account Name 1');
		system.assertEquals(numAccs / 3, resultAccs.size());
		for(Account acc : resultAccs)
		{
			system.assertEquals('Account Name 1', acc.Name);
		}
		
		list<Account> accs2 = result.get('Account Name 2');
		system.assertEquals(numAccs / 3, accs2.size());
		for(Account acc : accs2)
		{
			system.assertEquals('Account Name 2', acc.Name);
		}
		
		system.debug(result);
    }
}