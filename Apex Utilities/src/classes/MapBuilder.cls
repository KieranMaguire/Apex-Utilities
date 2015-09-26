/*
	
*/
public class MapBuilder 
{
	map<Object, SObject> sobjectMap;
	
	/*
		Takes a list of SObjects and groups them into a map by the field name specified 
	*/
	public static map<Object, list<SObject>> GroupSObjectListByField(list<SObject> sobjects, Schema.sObjectField field)
	{
		if(	sobjects == null ||
			field == null)
		{
			throw new InvalidParameterException('Argument Cannot be null');
		}
		
		map<Object, list<SObject>> sobjectsByField = new map<Object, list<SObject>>();
		for(SObject sobjectIterator : sobjects)
		{
			Object key = sobjectIterator.get(field);
			if(!sobjectsByField.containsKey(key))
			{
				sobjectsByField.put(key, new list<SObject>());
			}
			sobjectsByField.get(key).add(sobjectIterator);
		}	
		return sobjectsByField;
	}
	
	/*
		Takes a list of SObjects and groups them into a map by the field name specified.
		If there are multiple sobjects with the same value in the specified field, they will be overwritten.
	*/
	public static map<Object, SObject> GroupSObjectListByUniqueField(list<SObject> sobjects, Schema.DescribeFieldResult fieldAPIName)
	{
		map<Object, SObject> sobjectByField = new map<Object, list<SObject>>();
		for(SObject sobjectIterator : sobjects)
		{
			Object key = sobjectIterator.get(field);
			sobjectMultiMap.put(key, sobjectIterator);
		}	
		return sobjectMultiMap;
	}
}