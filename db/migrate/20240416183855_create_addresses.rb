class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zipcode
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
