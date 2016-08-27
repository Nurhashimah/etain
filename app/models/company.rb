class Company < ActiveRecord::Base
  has_many :customers, dependent: :restrict_with_error
  has_many :employees, class_name: 'User'
  has_many :college_user, class_name: 'User'
  validates :name, presence: true
  
  def self.company_collection
    company_collection=[]
    Company.all.each{|x|company_collection << [x.name, x.id]}
    company_collection
  end
end
