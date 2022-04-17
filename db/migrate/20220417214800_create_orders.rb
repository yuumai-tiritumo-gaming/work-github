class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer  :customer_id,     null: false
      t.string   :postal_code,     null: false
      t.string   :address,         null: false
      t.string   :name,            null: false
      t.integer  :payment_method,  null: false, default: 0
      t.integer  :trade_status,    null: false, default: 0
      t.integer  :total_payment,   null: false
      t.integer  :postage,         null: false, default: 800
      t.timestamps                 null: false
    end
  end
end
