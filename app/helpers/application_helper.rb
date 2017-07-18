module ApplicationHelper
  def check_it
    session[:lang] == 'JQuery' ? true : false
  end
end
