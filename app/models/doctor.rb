class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  before_validation :default_values
  validates :name, presence: true
  validates :gender, presence: true
  validates :specialization, presence: true

  def default_values
    self.photo = if gender == 'M' || gender == 'Male'
                   'male-placeholder.png'
                 else
                   'female-placeholder.png'
                 end
    photo
  end
end
