class User < ApplicationRecord
  before_validation :default_values
  validates :name, presence: true

  def default_values; end
end
