class BeerSerializer < ActiveModel::Serializer
  attributes :id, :brand, :style, :quantity, :created_at, :updated_at

  belongs_to :country
  has_many :bars
end