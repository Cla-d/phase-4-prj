class Review < ApplicationRecord
    belongs_to :movie
    accepts_nested_attributes_for :movie
end
