class Collaborator < ApplicationRecord
  # Direct associations

  belongs_to :list,
             :required => false,
             :counter_cache => true

  # Indirect associations

  has_one    :leader,
             :through => :list,
             :source => :user

  # Validations

end
