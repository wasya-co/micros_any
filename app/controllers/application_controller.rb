
##
## This controller is not used!
##
class ApplicationController < ActionController::Base

  def home
    # flash[:notice] = 'okk'
  end

  def tmp_1
    render 'tmp/one', layout: 'bootstrap'
  end

  ##
  ## private
  ##
  private

end
