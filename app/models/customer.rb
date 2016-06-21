class Customer < ActiveRecord::Base
  belongs_to :clientcompany, class_name: 'Company', foreign_key: 'company_id'
end
