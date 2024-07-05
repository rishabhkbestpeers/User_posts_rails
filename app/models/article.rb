class Article < ApplicationRecord
  belongs_to :student
  validates :student_id, presence: true
  validates :title, uniqueness: true
end
