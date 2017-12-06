class User < ApplicationRecord
  # Direct associations

  has_many   :collaborations,
             :dependent => :destroy

  has_many   :lists,
             :dependent => :destroy

  # Indirect associations

  has_many   :shared_lists,
             :through => :collaborations,
             :source => :list

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
