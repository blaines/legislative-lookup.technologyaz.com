class Legislator < ActiveRecord::Base
  attr_accessible :chamber, :session, :first_name, :middle_name, :last_name, :suffix, :party, :district, :phone_number, :fax_number, :email_address
end
