class CreateLegislators < ActiveRecord::Migration
  def self.up
    create_table :legislators do |t|
      t.string :chamber
      t.string :session
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :party
      t.string :district
      t.string :phone_number
      t.string :fax_number
      t.string :email_address
      t.timestamps
    end
  end
  
  def self.down
    drop_table :legislators
  end
end
