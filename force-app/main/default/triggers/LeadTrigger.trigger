/**
 * @description trigger on Lead object
 * @param  insert - some leads before insert
 */
trigger LeadTrigger on Lead (before insert) {
    /**
     * Invokes method to check leads before insert
     */ 
    new LeadTriggerHandler().checkLeadBeforeInsert(Trigger.New);
}