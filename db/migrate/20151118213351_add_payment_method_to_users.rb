class AddPaymentMethodToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paymentMethod, :string
  end
end
