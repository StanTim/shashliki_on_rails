class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email,
              uniqueness: { scope: :event_id },
              presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

    validate :email_in_use
  end

  with_options if: -> { user.present? } do
    # Для конкретного event_id один юзер может подписаться только один раз (если юзер задан)
    validates :user, uniqueness: { scope: :event_id }
    validate :decline_self_subscription
  end

  # Если есть юзер, выдаем его имя,
  # если нет – дергаем исходный метод
  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  # Если есть юзер, выдаем его email,
  # если нет – дергаем исходный метод
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  # можно оформить подписку всем кроме автора события
  def decline_self_subscription
    errors.add(:base, :decline_self_subscription) if user.id == event.user.id
  end

  # если адрес электронной почты уже занят зарегистрированным пользователем
  def email_in_use
    errors.add(:base, :email_in_use) if User.find_by(email: user_email).present?
  end
end
