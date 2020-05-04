class Event < ApplicationRecord
    belongs_to :creator , class_name: "User"
    has_many :guests, class_name: "User"
end
