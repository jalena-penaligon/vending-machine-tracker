class UpdateSnacks < ActiveRecord::Migration[5.1]
  def change
    change_column :snacks, :price, :decimal, :precision => 15, :scale => 2, null: false
  end
end
