class Score < ActiveRecord::Base
  validates :number, presence: true
end
