class User < ActiveRecord::Base
  attr_accessible :name, :email
  validates :name, :presence => true,
                   :length => {:maximum => 50 }
                   
  validates :email, :presence => true,
                    :uniqueness => {:case_sensitive => false},
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i } 
  
end
