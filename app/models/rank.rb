class Rank < ActiveRecord::Base
  has_many :participants, class_name: 'Customer'
  validates :rate, presence: true, :if => :rank_for_navy?
  before_save :set_rate_nil_if_maritim
  
  #define scope
#   def self.navy_maritim_search(query)
#     maritim_ids=Rank.where('name ILIKE(?)', "%Maritim%").pluck(:id)
#     if query=='1'
#       a=Rank.where('id NOT IN (?)', maritim_ids)
#     elsif query=='2'
#       a=Rank.where(id: maritim_ids)
#     end
#     a
#   end
#   
#   #ransackable
#   def self.ransackable_scopes(auth_object=nil)
#     [:navy_maritim_search]
#   end
  
  def rank_for_navy?
    name.include?("Maritim")==false
  end
  
  def set_rate_nil_if_maritim
    self.rate=nil unless rank_for_navy? 
  end
  
  def description
    "#{shortname} - #{name}"
  end

  def render_category
    DropDown::CATEGORY.find_all{|disp, value| value==category}.map{|disp, value| disp}[0]
  end
  
  def render_rate
    DropDown::RATE.find_all{|disp, value| value==rate}.map{|disp, value| disp}[0] 
  end
end
