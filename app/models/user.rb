class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, :presence => true,
                   :length => {:maximum => 50 }

  validates :email, :presence => true,
                    :uniqueness => {:case_sensitive => false},
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }

  before_save :encrypt_password
  def has_password?(submitted_password)
    self.encrypted_password == encrypt(submitted_password)
  end

  class << self
    
    def authenticate(email, submitted_password)
      
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
      
  
    end
    
    def authenticate_with_salt(id, cookie_salt)
      
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
      
    end

  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(self.password)
  end

  def encrypt(string)
    secure_hash("#{self.salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{self.password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end
