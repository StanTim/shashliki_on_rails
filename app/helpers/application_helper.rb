module ApplicationHelper
  # Возвращает путь к аватарке данного юзера
  def user_avatar(user)
    asset_pack_path('media/images/user.png')
  end

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end

end
