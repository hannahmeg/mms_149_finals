class AddManufacturersToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :manufacturers, :string
  end
end
