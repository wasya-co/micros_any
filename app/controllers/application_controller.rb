
class ApplicationController < ActionController::Base

  def home
    # if !current_user
    #   redirect_to new_user_session_path
    #   return
    # end
  end

  ##
  ## private
  ##
  private

  def initialize
    Keycloak.proc_cookie_token = lambda do
      cookies.permanent[:keycloak_token]
    end

    super
  end

end
