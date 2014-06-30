class ShoutsController < ApplicationController
  def create
    @shout = current_user.shouts.create(shout_params)
    redirect_to :dashboard 
  end

  private

  def shout_params
    params.require(:shout).permit(
      :body,
    )
  end
end
