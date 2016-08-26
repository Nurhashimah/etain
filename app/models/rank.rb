class Rank < ActiveRecord::Base
  has_many :participants, class_name: 'Customer'
  validates :rate, presence: true, :if => :rank_for_navy?
  before_save :set_rate_nil_if_maritim
  
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
