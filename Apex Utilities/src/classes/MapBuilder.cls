/*
	
*/
public class MapBuilder 
{
	map<Object, SObject> sobjectMap;
	
	/*
		
	*/
	public static map<Object, list<SObject>> GroupSObjectListByField(list<SObject> sobjects, Schema.sObjectField field)
	{
		if(	sobjects == null ||
			field == null)
		{
			throw new InvalidParameterException('Argument Cannot be null');
		}
		
		map<Object, list<SObject>> sobjectMultiMap = new map<Object, list<SObject>>();
		for(SObject sobjectIterator : sobjects)
		{
			Object key = sobjectIterator.get(field);
			if(!sobjectMultiMap.containsKey(key))
			{
				sobjectMultiMap.put(key, new list<SObject>());
			}
			sobjectMultiMap.get(key).add(sobjectIterator);
		}	
		return sobjectMultiMap;
	}
	
	public static map<Object, list<SObject>> GroupSObjectListByUniqueField(list<SObject> sobjects, Schema.SObjectType sobjType, Schema.DescribeFieldResult fieldAPIName)
	{
		return null; //map<Object, SObject> sobjectMultiMap;
		
	}
}