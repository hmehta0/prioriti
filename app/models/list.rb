class List < ApplicationRecord
  # Direct associations

  has_many   :collaborations,
             :dependent => :destroy

  has_many   :tasks,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_many   :collaborators,
             :through => :collaborations,
             :source => :user

  # Validations

end
