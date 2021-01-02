require 'securerandom'

class UniqueIdentifier < ApplicationRecord
  has_many :acts, dependent: :destroy
  # accepts_nested_attributes_for :acts
  @@count = 001

  def generate_id
    @random = SecureRandom.alphanumeric(4)
    @@count = @@count + 1
    @unique_id = "#{@random}00#{@@count}"
    self.unique_id = @unique_id
    self.save
  end

end
