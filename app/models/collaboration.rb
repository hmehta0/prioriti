class Collaboration < ApplicationRecord
  # Direct associations

  belongs_to :list

  belongs_to :user,
             :required => false

  # Indirect associations

  # Validations

end
