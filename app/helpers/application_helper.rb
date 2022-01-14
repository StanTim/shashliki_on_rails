module ApplicationHelper
  # Возвращает путь к аватарке данного юзера
  def user_avatar(user)
    asset_pack_path('media/images/user.png')
  end

  def flash_class(level)
    case level
      when 'notice' then 'info'
      when 'success' then 'success'
      when 'error' then 'danger'
      when 'alert' then 'warning'
    end
  end

end
