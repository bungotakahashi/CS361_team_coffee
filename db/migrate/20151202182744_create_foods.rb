class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :campid
      t.string :integer

      t.timestamps null: false
    end
  end
end
