module ApplicationHelper
  # Возвращает путь к аватарке данного юзера
  def user_avatar(user)
    asset_pack_path('media/images/user.png')
  end
  #
  # def bootstrap_flash(alert)
  #   {
  #     success: "alert-success",
  #     error: "alert-danger",
  #     danger: "alert-danger",
  #     alert: "alert-warning",
  #     notice: "alert-info"
  #   }[alert.to_sym] || alert
  # end
end
