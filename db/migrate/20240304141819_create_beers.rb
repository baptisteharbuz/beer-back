class CreateBeers < ActiveRecord::Migration[7.1]
  def change
    create_table :beers do |t|
      t.string :brand
      t.string :style
      t.integer :quantity
      t.references :country, null: true, foreign_key: true

      t.timestamps
    end
  end
end
