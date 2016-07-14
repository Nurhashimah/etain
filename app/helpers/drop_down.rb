module DropDown
  DURATION_TYPE=[
     #  Displayed       stored in db
        [ I18n.t('time.hours'), "hours"],
        [ I18n.t('time.days'), "days"],
        [ I18n.t('time.weeks'), "weeks"],  
        [ I18n.t('time.months'), "months"],
        [ I18n.t('time.years'), "years"]
  ]
  
  REGION=[
    # Displayed       stored in db
        [ "Southern", 1],
        [ "Northern", 2],
        [ "Eastern", 3],
        [ "Sabah", 4],
        [ "Sarawak", 5]
    ]
  
  PAYMENT_METHOD=[
    # Displayed       stored in db
        [ I18n.t('helpers.select'), ""],
        [ I18n.t('activerecord.attributes.payment.cash'), "Cash" ],
        [ I18n.t('activerecord.attributes.payment.cheque_draft'), "Cheque / bank draft"],
        [ I18n.t('activerecord.attributes.payment.credit_card'), "Credit card" ],
        [ I18n.t('activerecord.attributes.payment.local_postal'), "Local / postal order"],
        [ I18n.t('activerecord.attributes.payment.transfer'), "Bank transfer" ],
        [ I18n.t('activerecord.attributes.payment.others'), "Others"]
    ]
  
end