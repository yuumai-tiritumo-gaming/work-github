class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer   :genre_id,      null: false
      t.string    :name,          null: false
      t.string    :body,          null: false
      t.integer   :non_tax_price, null: false
      t.boolean   :is_selling,    null: false, default: false
      t.timestamps
    end
    add_index :items, :name
  end
end
