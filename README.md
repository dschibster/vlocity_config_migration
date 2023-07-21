# Transfering Attributes, Object Layouts and more between two Vlocity Orgs with SFDMU

The attached export.json file in this repo has been used to successfully migrate Attributes, attribute assignments, object classes and their respective Layotus (among a few other things) between two Vlocity Orgs using SFDMU. 

## Requirements

* Your source Org has a Formula Field called `ObjectClassId__c` on the `vlocity_cmt__ObjectClass__c` object simply containing `CASESAFEID(Id)`
* Your target Org has a Text field `OldId__c` on the `vlocity_cmt__ObjectClass__c` object

These two steps are necessary to migrate the Object Layouts that belong to each Object Type in the Product Designer.

## Run SFDMU

Use the export.json to migrate data between your source and target org. 

## Adjust Subclasses on Layouts

Run the `overridesubclasses.apex` script. This will use the OldId__c that has been mapped to the Old Id of the record on the target org, and uses it to assign the new Id on the new org.

After this, visiting the Product Designer and the the respective Object Types (for example Product Configuration Layouts) will show you the layouts you are used to from your previous org.