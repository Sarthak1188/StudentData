using { sap.capire.model.Master as Master } from '../db/schema';
using { sap.capire.model.transaction as Transaction } from '../db/schema';

service catservice {
    entity BusinessPartnerSet as projection on Master.businesspartner;
    entity AddressSet        as projection on Master.address;
    entity EmployeeSet       as projection on Master.employees;
    entity ProductSet        as projection on Master.products;
    entity PurchaseOrderSet  as projection on Transaction.purchaseorder;
    entity POItemsSet        as projection on Transaction.poitems;
}
