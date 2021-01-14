class RoomsController < ApplicationController
  # before_action :authenticate_user!

  def index
    
  end

  def show
    @messages = Message.all
  end

  def destroy
    Message.destroy_all
    redirect_to action: :show
  end

end
