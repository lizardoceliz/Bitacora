class AddStarredToLogEntries < ActiveRecord::Migration
  def self.up
    add_column :log_entries, :starred, :boolean, :default => false
  end

  def self.down
    remove_column :log_entries, :starred
  end
end
