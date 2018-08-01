class Investment < ActiveRecord::Base
  belongs_to :investor
  belongs_to :idea
end
