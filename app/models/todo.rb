class Todo < ApplicationRecord
  validates_presence_of :title, :notes, :due_date
end
