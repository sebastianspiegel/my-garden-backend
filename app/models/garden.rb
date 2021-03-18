class Garden < ApplicationRecord
    has_and_belongs_to_many :seeds
    belongs_to :user
end
