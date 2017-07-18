module SetSession
  def set_session
    session[:lang] ||= 'RoR'

    if session[:last_time]
      if (Time.now - Time.parse(session[:last_time])) > 1200
        Answer.where(session_id: session[:last_time]).delete_all
        session[:last_time] = Time.now.to_s
      end
    else
      session[:last_time] = Time.now.to_s
    end
  end
end
