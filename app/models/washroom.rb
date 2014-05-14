class Washroom < ActiveRecord::Base

  has_many :populations, dependent: :destroy
  has_many :people, through: :populations

  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
end
