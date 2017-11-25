class User < ApplicationRecord
  # Direct associations

  has_many   :lists,
             :dependent => :destroy

  # Indirect associations

  has_many   :collaborators,
             :through => :lists,
             :source => :collaborators

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
