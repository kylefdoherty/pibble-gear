class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable, :registerable,
  devise :database_authenticatable,
          :rememberable, :trackable, :validatable

  has_many :comments
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
end
