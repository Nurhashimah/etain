class Customer < ActiveRecord::Base
  belongs_to :clientcompany, class_name: 'Company', foreign_key: 'company_id'
  belongs_to :rank, foreign_key: 'rank_id'
  has_and_belongs_to_many :schedules
  has_many :bookings
  validates_presence_of :company_id, :if => :client_is_corporate?, :message => " - "+I18n.t("helpers.select_company")+" ("+I18n.t("customers.corporate")+")"
  validates :name, :id_no, :position, presence: true
  before_save :non_corporate_remove_company
  
  def client_is_corporate?
    corporate==true
  end
  
  def id_no_with_name 
    id_no+" "+name
  end
  
  def id_no_with_name_position
    a=id_no+" "+name
    a+=" ("+position+")" unless position.blank?
    a
  end
  
  def corporate_payer
    clientcompany.name+"-"+id_no_with_name_position
  end
  
  def non_corporate_remove_company
    self.company_id=nil if corporate==false
  end
end
