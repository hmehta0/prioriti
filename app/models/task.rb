class Task < ApplicationRecord
  # Direct associations

  belongs_to :list,
             :counter_cache => true

  # Indirect associations

  # Validations

end
