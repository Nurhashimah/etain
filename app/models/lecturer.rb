class Lecturer < ActiveRecord::Base
  has_many :schedules


  serialize :details, Hash

  #lecturers details
  #House Sitter data
  def mykadno=(value)
    details[:mykadno] = value
  end
  def mykadno
    details[:mykadno]
  end
  
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
  
  #define scope
   def self.mykadno_search(query)
     ids=Array.new
     Lecturer.pluck(:id, :details).each{|det| ids << det[0] if (det[1][:mykadno]).include?(query)}
     where(id: ids)
   end
   
   def self.position_search(query)
     ids=Array.new
     Lecturer.pluck(:id, :details).each{|det| ids << det[0] if (det[1][:position]).include?(query) || (det[1][:position]).downcase.include?(query)}
     where(id: ids)
   end
   
   def self.address_search(query)
     ids=Array.new
     Lecturer.pluck(:id, :details).each{|det| ids << det[0] if (det[1][:address]).include?(query) || (det[1][:address]).downcase.include?(query)}
     where(id: ids)
   end
   
   def self.qualifications_search(query)
     ids=Array.new
     Lecturer.pluck(:id, :details).each{|det| ids << det[0] if (det[1][:qualifications]).include?(query) || (det[1][:qualifications]).downcase.include?(query)}
     where(id: ids)
   end
   
   def self.experiences_search(query)
     ids=Array.new
     Lecturer.pluck(:id, :details).each{|det| ids << det[0] if (det[1][:experiences]).include?(query) || (det[1][:experiences]).downcase.include?(query)}
     where(id: ids)
   end
   
   #ransackable
   def self.ransackable_scopes(auth_object = nil)
     [:mykadno_search, :position_search, :address_search, :qualifications_search, :experiences_search]
   end
  
end

#use mini editor and allow lecturer to update their own profile.
#might be able to have nested data within the hash, but for now just freeform
