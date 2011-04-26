class Login < ActiveRecord::Base
  has_many :product
  
  attr_accessor :password  
  validates_length_of     :password, :within => 4..20, :if => :password_required?
  validates_presence_of :email
  validates_uniqueness_of :email
  
  before_save :encrypt_password
  
  def password_required?
    encrypted_password.blank? || !password.blank?
  end
  
  def encrypt_password
    return if password.blank?
    if new_record?
      #self.salt = ActiveSupport::SecureRandom.base64(8)
      self.salt = Digest::SHA1.hexdigest("#{Time.now}--#{email}")
    end
    self.encrypted_password= Login.encrypt(password,salt)
  end
  
  def self.encrypt(pass,salt)
    #Digest::SHA2.hexdigest(salt+pass)
    Digest::SHA1.hexdigest("#{salt}--#{pass}")
  end
  
  def self.authenticate(email,pass)
    user = find_by_email(email)
    user && user.authenticated?(pass) ? user :nil
  end
  
  def authenticated?(pass)
    encrypted_password == Login.encrypt(pass,salt)
  end
end
