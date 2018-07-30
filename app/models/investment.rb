class Investment < ActiveRecord::Base
  belongs_to :investors
  belongs_to :ideas
end
