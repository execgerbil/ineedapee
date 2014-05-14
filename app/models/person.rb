class Person < ActiveRecord::Base
  has_many :populations, dependent: :destroy
  has_many :washrooms, through: :populations
end
