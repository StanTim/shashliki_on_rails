class Event < ActiveRecord::Base
  # Событие всегда принадлежит юзеру
  belongs_to :user
  has_many :comments
  has_many :subscriptions
  has_many :photos

  # связь many-to-many: событие имеет много подписчиков через
  # промежуточную таблицу подписчики в виде пользователей.
  has_many :subscribers, through: :subscriptions, source: :user

  validates :user, presence: true

  validates :title, presence: true, length: { maximum: 255 }

  validates :address, presence: true
  validates :datetime, presence: true

  def visitors
    (subscribers + [user]).uniq
  end

  def pincode_valid?(pin2check)
    pincode == pin2check
  end

end
