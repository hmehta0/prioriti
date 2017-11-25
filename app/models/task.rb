class Task < ApplicationRecord
  # Direct associations

  has_many   :subtasks,
             :dependent => :destroy

  belongs_to :list,
             :counter_cache => true

  # Indirect associations

  # Validations

end
