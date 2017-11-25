class Subtask < ApplicationRecord
  # Direct associations

  belongs_to :task,
             :counter_cache => true

  # Indirect associations

  # Validations

end
