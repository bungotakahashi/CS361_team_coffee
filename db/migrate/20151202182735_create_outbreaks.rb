class CreateOutbreaks < ActiveRecord::Migration
  def change
    create_table :outbreaks do |t|
      t.string :name
      t.string :campid
      t.string :integer

      t.timestamps null: false
    end
  end
end
