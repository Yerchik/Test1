/**
 * handling functionality to call on different actions on Lead object 
 */ 
public with sharing class LeadTriggerHandler {
    /**
     * @description method to check leads before insert
     * @param  leads list of leads from trigger
     */ 
    public void checkLeadBeforeInsert(List<Lead> leads){
        Set<String> setCompany = new Set<String>();
        for(Lead lead : leads)
        {
            setCompany.add(lead.Company);
        }
        
        if(setCompany.size() > 0 )
        {
            for(Lead oldLead : [SELECT Company, Email, id  FROM Lead WHERE Company in :setCompany]){
            	for(Lead newLead : leads){
                	if(oldLead.Company.equals(newLead.Company) && oldLead.Email != null && newLead.Email != null){
                        if(newLead.Email.equals(oldLead.Email)){
                            newLead.Email.addError('already Exist with this Company and Email');
                        }
                    }    
                }
            }
        }
    }
}
