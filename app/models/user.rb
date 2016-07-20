class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  serialize :roles, Hash
  
  belongs_to :employer, class_name: 'Company', foreign_key: 'company_id'
  belongs_to :college, class_name: 'Company', foreign_key: 'college_id'

  before_save :company_email_should_owned_by_admin
  
  #roles: admin(company creator), trainer, trainee, guest
  #fields to add : company_id(integer), college_id(integer), name(string), roles(text)

  def user_roles=(value)
    roles[:user_roles]=value
  end
  
  def user_roles
    roles[:user_roles]
  end
  
  def role_symbols
    user_roles.find_all{|key, value| value == '1'}.map(&:first).map(&:to_sym) rescue []
  end
  
  def role_strings
    user_roles.find_all{|key, value| value == '1'}.map(&:first).join(", ") rescue ""
  end
  
  #define scope
  def self.roles_search(query)
    user_ids=[]
    if query=='administration'
      User.all.each{|x|user_ids << x.id if x.user_roles[:administration]=='1'}
    elsif query=='trainer'
      User.all.each{|x|user_ids << x.id if x.user_roles[:trainer]=='1'}
    elsif query=='trainee'
      User.all.each{|x|user_ids << x.id if x.user_roles[:trainee]=='1'}
    end
    #User.all.each{|x|user_ids << x.id if x.user_roles[:administration]=='1'}
     where(id: user_ids)
  end
  
  #ransackable
  def self.ransackable_scopes(auth_object = nil)
     [:roles_search]
  end
  
  def company_email_should_owned_by_admin
    self.roles[:user_roles][:administration]='1' if employer && email==employer.email
  end

end
