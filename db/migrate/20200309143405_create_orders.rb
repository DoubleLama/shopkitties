class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.belongs_to :cart, index:true
      t.belongs_to :user, index:true
    end
  end
end
