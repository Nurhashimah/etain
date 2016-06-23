class Lecturer < ActiveRecord::Base
  has_many :schedules


  serialize :details, Hash

  #lecturers details
  #House Sitter data
  def position=(value)
    details[:position] = value
  end
  def position
    details[:position]
  end

  def address=(value)
    details[:address] = value
  end
  def address
    details[:address]
  end

  def qualifications=(value)
    details[:qualifications] = value
  end
  def qualifications
    details[:qualifications]
  end

  def experiences=(value)
    details[:experiences] = value
  end
  def experiences
    details[:experiences]
  end
end

#use mini editor and allow lecturer to update their own profile.
#might be able to have nested data within the hash, but for now just freeform
