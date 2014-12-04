module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def nav_link_top(link_text, link_path, controller_name)
    class_name = controller.controller_name == controller_name ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def avatar_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def joinings_flash
    return unless user_signed_in?
    pending_joinings = current_user.joinings.where(
      status: Joining.statuses[:pending]
    )
    return unless pending_joinings.length > 0
    render partial: 'joinings/pending', locals: {
      joining: pending_joinings.first
    }
  end
end
