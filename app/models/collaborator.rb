class Collaborator < ApplicationRecord
  # Direct associations

  belongs_to :list,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
