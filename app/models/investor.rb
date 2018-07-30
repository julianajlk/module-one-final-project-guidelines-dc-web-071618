class Investor < ActiveRecord::Base
  has_many :investments
  has_many :ideas, through: :investments
end
