class Task < ApplicationRecord
  validates :title, presence: ture
  validates :body, presence: true
end
