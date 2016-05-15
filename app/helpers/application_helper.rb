module ApplicationHelper
  def page_header(header)
    content_for(:page_header) {header.to_s}
  end
  def active_class(link_path)
    current_page?(link_path) ? 'actived' : ""
  end
  def user_online
  	user = User.find(current_user.id)
  	user.status = "Online"
  	user.save
  end

  def user_offline
  	user = User.find(current_user.id)
  	user.status = "Offline"
  	user.save
  end


end