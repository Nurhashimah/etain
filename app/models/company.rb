class Company < ActiveRecord::Base
  has_many :customers, dependent: :restrict_with_error
  has_many :employees, class_name: 'User'
  has_many :college_user, class_name: 'User'
  validates :name, presence: true
end
