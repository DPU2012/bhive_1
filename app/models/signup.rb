class Signup < ActiveRecord::Base
  attr_accessible :birthday, :email, :email2, :first_name, :last_name, :password, :retype_email, :retype_password, :sex
end
