class Inventor < ActiveRecord::Base
  has_many :ideas
  has_many :investments, through: :ideas
end
