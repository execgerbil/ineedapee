class Washroom < ActiveRecord::Base
  has_one :user

  validates :name, presence: true
  validates :address, presence: true
end
