module PhotoGalleryHelper

  def photo_title(photo)
    link_to(image_tag(user_avatar_thumb(photo.user), class: 'img-icon') + photo.user.name, user_path(photo.user))
  end

  def delete_photo_link_with_icon(photo)
    if current_user_can_edit?(photo)
      link_to(image_tag(asset_pack_path('media/images/trash-10-16.png')),
              event_photo_path(photo.event, photo), method: :delete,
              data: { confirm: t('controllers.photos.delete_photo') })
    else
      ""
    end
  end
end
