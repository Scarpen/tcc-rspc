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
      result = "Pertence às áreas de "
      project.interests.each do |interest|
        result += interest.name.to_s + ", "
      end
      return result
    else
      return "Não possui nenhuma área definida"
    end
  end

  def members_count(count)
    count > 1 ? "#{count} Membros" : "#{count} Membro"
  end

  def users_count(count)
    if count == 1 
      return "Foi encontrado o usuário:"
    elsif count > 1
      return "Foram encontrados os usuários:" 
    elsif count < 1
      return "Nenhum usuário foi encontrado"
    end
  end

  def project_count(count)
    if count == 1 
      return "Foi encontrado o projeto:"
    elsif count > 1
      return "Foram encontrados os projetos:" 
    elsif count < 1
      return "Nenhum projeto foi encontrado"
    end
  end

  def topic_fixed(topic)
    topic.important ? "topic-fixed-true" : ""
  end

  def posts_count(count)
    if count == 0 
      "Sem Respostas"
    elsif count == 1
      "1 Resposta"
    else
      "#{count} Respostas"
    end
  end

  def user_on(user)
    if user.status == "Online"
      "user_on"
    else
      "user_off"
    end
  end

  def notification_count 
    @activities = PublicActivity::Activity.where(owner_id: current_user.id).order(created_at: :desc)
    @activities.where(:visible => false).count 

  end 
  def recommends
    list_projets = Array.new
    Project.all.each do |project|
      current_user.interests.each do |interest|
        if project.interests.include?(interest)
          unless Member.where(user_id: current_user.id, project_id: project.id).first
            unless list_projets.include?(project)
              list_projets << project
            end
          end
        end
      end
    end
    list_projets
  end

  def inter(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end

end
