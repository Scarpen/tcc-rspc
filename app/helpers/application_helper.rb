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
  	if count == 1 
      return "#{count} solicitação pendente"
    elsif count > 1
      return "#{count} solicitações pendentes" 
    elsif count < 1
      return "Nenhuma solicitação pendente"
    end
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
  def conversation_interlocutor(conversation)
    conversation.recipient == current_user ? conversation.sender : conversation.recipient
  end

  def project_interests(project)
    if project.interests.count == 1
      return project.interests.first.name.to_s
    elsif project.interests.count > 1
      result = ""
      project.interests.each do |interest|
        result += interest.name.to_s + ", "
      end
      return result
    else
      return "Não possui nenhuma área definida"
    end
  end

  def project_interests_about(project)
    if project.interests.count == 1
      return "Pertence à área de " + project.interests.first.name.to_s
    elsif project.interests.count > 1
      result = "Percente às áreas de"
      project.interests.each do |interest|
        result += interest.name.to_s
      end
      return result
    else
      return "Não possui nenhuma área definida"
    end
  end

  def members_count(count)
    count > 1 ? "#{count} Membros" : "#{count} Membro"
  end

  def topic_fixed(topic)
    topic.important ? "topic-fixed-true" : ""
  end

end
