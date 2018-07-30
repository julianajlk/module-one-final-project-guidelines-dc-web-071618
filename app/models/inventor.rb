class Inventor < ActiveRecord::Base
  has_many :collaborations
  has_many :ideas, through: :collaborations
end
