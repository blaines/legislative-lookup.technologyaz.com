class AddRegionToLegislator < ActiveRecord::Migration
  def self.up
    add_column :legislators, :region, :string
  end

  def self.down
    remove_column :legislators, :region
  end
end
