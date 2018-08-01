class Investor < ActiveRecord::Base
  has_many :investments
  has_many :ideas, through: :investments

  # def self.investments#return all investments from an investor
  #   name = Investor.find_by(name: "@user_input")
  #     joins(:investments).where("self.investor_id = name.id")
  # end


end
