class Act < ApplicationRecord
  has_one_attached :image
  belongs_to :unique_identifier


  validates :uid_reference,      presence: true
  validates :unique_identifier_id,      presence: true
  validates :giver,      presence: true
  validates :message,      presence: true
end
