class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  # 모바일 버전 정의 하는 부분 
  helper_method :mobile?
  
  private
  def mobile? # has to be in here because it has access to "request"
    request.user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
  end

end
