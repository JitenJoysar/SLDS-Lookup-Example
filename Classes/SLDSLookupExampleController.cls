/**
* Controller        : SLDSLookupExampleController
* Created by        : Jiten (G10)
* Version           : 1.0  -- Initail Draft(24-11-2016)    
* Description       : This class will contain all the server logic of the page SLDSPicklistExample 
*                   : Inline comments are added to get specific details.
**/

public class SLDSLookupExampleController{

    /* VARIABLES */
    
    public static final Integer USER_LIST_LIMIT = 20;
    
    /* DEFAULT CONTRUCTORS */
    public SLDSLookupExampleController(){
        
    }
    
    /* PARAMETERIZE CONTRUCTORS */
    public SLDSLookupExampleController(ApexPages.StandardController stdController){
        
    }
    
    /*
    * Method Name   : getContactObjectKey
    * Description   : Method will return object key for Described object    
    * @param        : None
    * @returns      : Contact object Key 
   */
 
    public static String getContactObjectKey(){        
      Schema.DescribeSObjectResult schemaResult = Contact.sObjectType.getDescribe();
      return JSON.serialize(schemaResult.getKeyPrefix());
    }
    
    /*
    * Method Name   : searchContact
    * Description   : Method will return List of Contact    
    * @param        : contactName - Search String
    * @returns      : List of contacts
    */
    
    @RemoteAction
    public static List<Contact> searchContact(String contactName){
        String query = 'SELECT Id,Name,AccountId,Account.Name FROM Contact '+ 
                   ' WHERE Name LIKE \'%'+contactName+'%\' LIMIT '+ USER_LIST_LIMIT;
        return Database.query(query);
    }

}