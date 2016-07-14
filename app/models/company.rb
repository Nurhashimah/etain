class Company < ActiveRecord::Base
  has_many :customers, dependent: :restrict_with_error
  validates :name, presence: true
end
