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
  
end
