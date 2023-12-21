
class ApplicationController < ActionController::Base

  def home
    # if !current_user
    #   redirect_to new_user_session_path
    #   return
    # end
  end

  def test_exception
    throw 'test exception'
  end

  ##
  ## private
  ##
  private

end
