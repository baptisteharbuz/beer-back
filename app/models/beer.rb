class Beer < ApplicationRecord
    belongs_to :country
    has_and_belongs_to_many :bars
end
