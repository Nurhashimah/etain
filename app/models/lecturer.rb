class Lecturer < ActiveRecord::Base
  has_many :schedules
end
