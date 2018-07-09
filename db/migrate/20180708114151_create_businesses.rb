class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :password_digest
      t.float :balance

      t.timestamps
    end
  end
end
