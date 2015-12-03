class AddUseridToCamp < ActiveRecord::Migration
  def change
    add_column :camps, :userid, :integer
  end
end
