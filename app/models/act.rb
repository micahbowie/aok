class Act < ApplicationRecord
  has_one_attached :image
  belongs_to :unique_identifier
end
