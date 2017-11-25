class List < ApplicationRecord
  # Direct associations

  has_many   :tasks,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
