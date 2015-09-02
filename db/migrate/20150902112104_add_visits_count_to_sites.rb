class AddVisitsCountToSites < ActiveRecord::Migration
  def change
    add_column :sites, :visits_count, :integer, default: 0
  end
end
