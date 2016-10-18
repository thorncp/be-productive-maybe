class Task < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :description, presence: true
end
