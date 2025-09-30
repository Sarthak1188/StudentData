namespace sap.capire.model;

using {cuid, managed, temporal, Currency} from '@sap/cds/common';
using {db.commons as commons } from './commons';

context Master {
    entity businesspartner {
        key NodeKey      : commons.Guid;
            BP_Role      : String(2);
            EmailAddress : String(105);
            PhoneNumber  : String(20);
            FAXNumber    : String(30);
            Web_Address  : String(50);
            BP_Id        : String(20);
            Company_Name : String(20);
            Address_Guid : Association to address;
    };

    entity address {
        key NodeKey          : commons.Guid;
            City             : String(30);
            PostalCode       : String(30);
            Street           : String(30);
            Building         : String(50);
            Country          : String(50);
            Address_Type     : String(10);
            Val_Start_Date   : Date;
            Val_End_Date     : Date;
            Latitude         : Decimal;
            Longitude        : Decimal;
            business_partner : Association to businesspartner;
    };

    entity products {
        key NODEKEY       : commons.Guid;
            PRODUCT_ID     : String(28);
            TYPE_CODE      : String(2);
            CATEGORY       : String(32);
            DESCRIPTION    : localized String(255);
            SUPPLIER_GUID  : Association to businesspartner;
            TAX_TARIF_CODE : Integer;
            MEASURE_UNIT   : String(2);
            WEIGHT_UNIT    : String(2);
            WEIGHT_MEASURE : Decimal(5, 2);
            CURRENCY_CODE  : String(4);
            PRICE          : Decimal(15, 4);
            WIDTH          : Decimal(5, 2);
            HEIGHT         : Decimal(5, 2);
            DEPTH          : Decimal(5, 2);
            DIM_UNIT       : String(2);
    };

    entity employees : cuid {
        nameFirst     : String(40);
        nameMiddle    : String(40);
        nameLast      : String(40);
        nameInitials  : String(40);
        sex           : commons.Gender;
        language      : String(1);
        phoneNumber   : commons.PhoneNumber;
        email         : commons.EmailAddress;
        loginName     : String(12);
        salaryAmount  : commons.AmountT;
        accountNumber : String(16);
        bankId        : String(8);
        bankName      : String(64);
    }
}

context transaction {
    entity purchaseorder : commons.Amount {
    key NODE_KEY : commons.Guid;
    PO_ID        : String(40);
    PARTNER_GUID : Association to Master.businesspartner;
    LIFECYCLE_STATUS : String(1);
    OVERALL_STATUS   : String(1);
}


    entity poitems : commons.Amount {
        key NODE_KEY     : commons.Guid;
            PARENT_KEY   : Association to purchaseorder;
            PO_ITEM_POS  : Integer;
            PRODUCT_GUID : Association to Master.products;
    }
}
