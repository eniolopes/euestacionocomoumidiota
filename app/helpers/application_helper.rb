module ApplicationHelper
  def error_messages_for(resource)
    render "shared/error_messages_for", :resource => resource
  end
end
