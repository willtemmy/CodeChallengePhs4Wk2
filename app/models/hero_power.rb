class HeroPower < ApplicationRecord
  belongs_to :power
  belongs_to :hero

  validates :strength, presence: true, inclusion:{in: ["Strong","Weak","Average"]}
end
