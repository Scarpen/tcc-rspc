module ApplicationHelper
  def page_header(header)
    content_for(:page_header) {header.to_s}
  end
  def active_class(link_path)
    current_page?(link_path) ? 'actived' : ""
  end

end