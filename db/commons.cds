namespace db.commons;

using {Currency} from '@sap/cds/common';

type Gender       : String(1) enum {
    male = 'M';
    female = 'F';
    others = 'U';
};

type AmountT      : Decimal(10, 2) @(
    Semantic.amount.currencyCode: 'Currency_code',
    sap.unit                    : 'Currency_code'
);

aspect Amount {
    Currency     : Currency;
    Gross_Amount : AmountT @(title: 'Gross Amount');
    Net_Amount   : AmountT @(title: 'Net Amount');
    Tax_Amount   : AmountT @(title: 'Tax Amount');
}

type Guid         : String(32);
type PhoneNumber  : String(30) @assert.format: '^\+?[0-9]{1,3}?[-.\s]?\(?[0-9]{3}\)?[-.\s]?[0-9]{3}[-.\s]?[0-9]{4}$';
type EmailAddress : String(60) @assert.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

aspect addressData {
    House_No : String;
    Street   : String;
    City     : String;
    Country  : String;
}
