class Population < ActiveRecord::Base
  belongs_to :person
  belongs_to :washroom
end
