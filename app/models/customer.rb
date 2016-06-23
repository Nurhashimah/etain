class Customer < ActiveRecord::Base
  belongs_to :clientcompany, class_name: 'Company', foreign_key: 'company_id'
  validates_presence_of :company_id, :if => :client_is_corporate?, :message => " - "+I18n.t("helpers.select_company")+" ("+I18n.t("customers.corporate")+")"
  
  def client_is_corporate?
    corporate==true
  end
end
