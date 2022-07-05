class AddOrderIdToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :order_id, :string
    add_column :order_items, :integer, :string
  end
end
