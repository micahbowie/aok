require 'securerandom'

class UniqueIdentifier < ApplicationRecord
  has_many :acts, dependent: :destroy
  validates :unique_id,      presence: true

  @@count = 001

  def generate_id
    @random = SecureRandom.alphanumeric(4)
    @@count = @@count + 1
    @unique_id = "#{@random}00#{@@count}"
    self.unique_id = @unique_id
    self.save
  end

  def self.search(search_term)
   if search_term
     where(["unique_id LIKE ?", "%#{search_term}%"])
   else
     all
   end
 end

end
