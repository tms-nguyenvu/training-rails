class User < ApplicationRecord
  rolify
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable


  # Override for use with Active Job
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
