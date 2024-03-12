class AddCountryToBeers < ActiveRecord::Migration[7.1]
  def change
    add_reference :beers, :country, null: true, foreign_key: true
  end
end
