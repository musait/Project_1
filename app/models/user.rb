class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :lastname, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}

 validates :surname, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}

 validates :password, presence: true, length: { minimum: 6 } , on: :create

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

 validates :email, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX }

 validates :id_number, uniqueness:  {case_sensitive: false}

 has_many :events

 has_many :position_validations
 has_many :positions, through: :position_validations

 after_create :position_assignation


  def position_assignation
    self.positions = [Position.first]
  end


  def admin?
    true
  end

  def to_s
    lastname
  end
end
