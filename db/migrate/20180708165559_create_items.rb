class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.belongs_to :business

      t.timestamps
    end
  end
end
