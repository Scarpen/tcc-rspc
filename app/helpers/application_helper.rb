module ApplicationHelper
  def page_header(header)
    content_for(:page_header) {header.to_s}
  end
  def active_class(link_path)
    current_page?(link_path) ? 'actived' : ""
  end
  def requests(count)
  	count > 1 ? "#{count} Solicitações pendentes" : "#{count} Solicitação pendente"
  end
end