class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references   :purchase,         null:false, foreign_key: true
      t.string       :post_num,         null:false
      t.string       :city,             null:false
      t.string       :address,          null:false
      t.string       :building,         null:true
      t.string       :phone,            null:false
      t.integer      :region_id,        null:false
      t.timestamps
    end
  end
end
