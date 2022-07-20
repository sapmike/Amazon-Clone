class AddUserToOrders < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      t.references :user, index: true, foreign_key: {to_table: :users}
    end
  end
end
