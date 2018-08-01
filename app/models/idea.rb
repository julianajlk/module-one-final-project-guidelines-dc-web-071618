class Idea < ActiveRecord::Base
  has_many :investments
  belongs_to :inventor
end
