class Match < ApplicationRecord
  belongs_to :decision
  has_many :users, through: :decision
end
