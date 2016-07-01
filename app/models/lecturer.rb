class Lecturer < ActiveRecord::Base
  has_and_belongs_to_many :schedules

  serialize :details, Hash
  
  validates :name, presence: true
  validate :mykadno_must_not_blank

  #lecturers details
  #House Sitter data
  def mykadno=(value)
    details[:mykadno] = value
  end
  def mykadno
    details[:mykadno]
  end
  
  def phone=(value)
    details[:phone] = value
  end
  def phone
    details[:phone]
  end
  
  def email=(value)
    details[:email] = value
  end
  def email
    details[:email]
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
   
   def self.phone_search(query)
     ids=Array.new
     Lecturer.pluck(:id, :details).each{|det| ids << det[0] if (det[1][:phone]).include?(query)}
     where(id: ids)
   end
   
   def self.email_search(query)
     ids=Array.new
     Lecturer.pluck(:id, :details).each{|det| ids << det[0] if (det[1][:email]).include?(query)}
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
     [:mykadno_search, :phone_search, :email_search, :position_search, :address_search, :qualifications_search, :experiences_search]
   end
   
   def mykadno_must_not_blank
     if mykadno.nil? || mykadno.blank?
       errors.add(:base, I18n.t('activerecord.attributes.lecturer.mykadno_blank'))
     end
   end
  
end

#use mini editor and allow lecturer to update their own profile.
#might be able to have nested data within the hash, but for now just freeform
