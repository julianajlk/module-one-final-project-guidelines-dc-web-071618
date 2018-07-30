class Collaboration < ActiveRecord::Base
  belongs_to :inventors
  belongs_to :ideas
end
