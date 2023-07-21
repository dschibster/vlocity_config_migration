List<vlocity_cmt__ObjectClass__c> classList = [SELECT Id, OldId__c FROM vlocity_cmt__ObjectClass__c];
Map<id, Id> idmapping = new Map<Id, Id>();
for(vlocity_cmt__ObjectClass__c obc : classList){
    idMapping.put(obc.OldId__c, obc.Id);
}

List<vlocity_cmt__ObjectLayout__c> layoutList = [SELECT Id, vlocity_cmt__SubclassId__c FROM vlocity_cmt__ObjectLayout__c];
for(vlocity_cmt__ObjectLayout__c obl : layoutList){
    if(obl.vlocity_cmt__SubclassId__c != null){
        obl.vlocity_cmt__SubclassId__c = idMapping.get(obl.vlocity_cmt__SubclassId__c);
    }
}
update layoutList;