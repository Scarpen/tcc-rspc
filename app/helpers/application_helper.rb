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


  def requests(count)
  	count > 1 ? "#{count} Solicitações pendentes" : "#{count} Solicitação pendente"
  end
  
  def shares_count(count)
  	if count == 0
  		return ""
  	elsif count == 1
  		return "#{count} Compartilhamento"
  	else 
  		return "#{count} Compartilhamentos"
	end
  end


   def comments_count(count)
  	if count == 0
  		return ""
  	elsif count == 1
  		return "#{count} Comentário"
  	else 
  		return "#{count} Comentários"
	end
  end
end