/**

 */
@isTest
private class MapBuilder_Test 
{

    private static testMethod void GroupSObjectListByField_Test_WithAccounts_NoDML() 
    {
    	/*
    		Setup config
    	*/
    	String accName1 = 'Account Name 1';
    	String accName2 = 'Account Name 2';
    	String accName3 = 'Account Name 3';
    	
    	Integer numAccs = 300;
    	
    	/*
    		Setup data
    	*/
    	list<Account> accs = new list<Account>();
    
    	for(Integer i = 0; i < numAccs; i++)
    	{
    		Account a;
    		if(Math.mod(i, 3) == 0)
    		{
    			a = new Account(Name = accName1);
    		}
    		else if(Math.mod(i, 3) == 1)
    		{
    			a = new Account(Name = accName2);
    		}
    		else
    		{
    			a = new Account(Name = accName3);
    		}
    		accs.add(a);
    	}
		
		/*
			test the method
		*/
		test.startTest();
			map<Object, list<SObject>> result = MapBuilder.GroupSObjectListByField(accs, Account.Name.GetDescribe().getSObjectField());
		test.stopTest();
		
		/*
			assert the result is as expected.
		*/
		system.assertEquals(3, result.size());
		system.assert(result.containsKey(accName1));
		list<Account> resultAccs = result.get(accName1);
		system.assertEquals(numAccs / 3, resultAccs.size());
		for(Account acc : resultAccs)
		{
			system.assertEquals(accName1, acc.Name);
		}
		
		list<Account> resultAccs2 = result.get(accName2);
		system.assertEquals(numAccs / 3, resultAccs2.size());
		for(Account acc : resultAccs2)
		{
			system.assertEquals(accName2, acc.Name);
		}
		
		list<Account> resultAccs3 = result.get(accName3);
		system.assertEquals(numAccs / 3, resultAccs3.size());
		for(Account acc : resultAccs3)
		{
			system.assertEquals(accName3, acc.Name);
		}
    }
    
    private static testMethod void GroupSObjectListByField_Test_InvalidArguments()
    {
    	try
    	{
    		MapBuilder.GroupSObjectListByField(null, null);
    		system.assert(false);
    	}
    	catch(InvalidParameterException e)
    	{
    		system.assert(true);
    	} 
    } 
}