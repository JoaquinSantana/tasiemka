class AddYtchannelToSites < ActiveRecord::Migration
  def change
    add_column :sites, :ytchannel, :boolean, default: false
  end
end
