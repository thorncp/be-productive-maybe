class Task < ApplicationRecord
  belongs_to :user
  has_many :completions, dependent: :destroy

  validates :description, presence: true
end
