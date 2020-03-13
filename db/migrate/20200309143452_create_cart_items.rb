class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.timestamps
      t.belongs_to :cart, index:true
      t.belongs_to :item, index:true
    end
  end
end
