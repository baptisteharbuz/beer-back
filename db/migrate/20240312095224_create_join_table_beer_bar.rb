class CreateJoinTableBeerBar < ActiveRecord::Migration[7.1]
  def change
    create_join_table :beers, :bars do |t|
      # t.index [:beer_id, :bar_id]
      # t.index [:bar_id, :beer_id]
      t.index :beer_id
      t.index :bar_id
    end
  end
end
