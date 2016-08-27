class Customer < ActiveRecord::Base
  belongs_to :clientcompany, class_name: 'Company', foreign_key: 'company_id'
  belongs_to :rank, foreign_key: 'rank_id'
  has_and_belongs_to_many :schedules
  has_many :bookings
  validates_presence_of :company_id, :if => :client_is_corporate?, :message => " - "+I18n.t("helpers.select_company")+" ("+I18n.t("customers.corporate")+")"
  validates :name, :id_no, presence: true
  validate :rank_or_position_must_exist, :message => "Please enter staff rank or position"
  before_save :non_corporate_remove_company, :non_navy_apmm_remove_rank
  
  def client_is_corporate?
    corporate==true
  end
  
  def rank_or_position_must_exist
    if rank_id==nil && position==""
      errors.add(:base, I18n.t('activerecord.attributes.customer.rank_or_position'))
    end
  end
  
  def id_no_with_name 
    id_no+" "+name
  end
  
  def id_no_with_name_position
    a=id_no+" "+name
    a+=" ("+position+")" unless position.blank?
    a
  end
  
  def rank_with_name
    "<b>#{rank.try(:shortname)}</b></td><td width='21%'> #{name}</td>".html_safe
  end
  
  def corporate_payer
    clientcompany.name+"-"+id_no_with_name_position
  end
  
  def non_corporate_remove_company
    self.company_id=nil if corporate==false
  end
  
  def non_navy_apmm_remove_rank
    navy=Company.where(name: 'Tentera Laut Diraja Malaysia')
    apmm=Company.where(name: 'Agensi Penguatkuasaan Maritim Malaysia')
    if((navy.count > 0  && company_id==navy.first.id) || (apmm.count > 0 && company_id==apmm.first.id))
    else
      self.rank_id=nil 
    end
  end
  
end
