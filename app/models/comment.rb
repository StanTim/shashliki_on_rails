class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  # Не может быть комментария без события
  # validates :event, presence: true

  # Без пустых комментариев
  validates :body, presence: true
  validates :event, presence: true

  # юзернэйм должен быть заполнен только если у нас нет юсера
  validates :user_name, presence: true, unless: :user_present

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_present
    user.present?
  end
end
