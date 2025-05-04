class GetInTouchesController < ApplicationController
  skip_before_action :authenticate_current_user!

  def contact_us
    @contact = GetInTouch.new
  end

  def create
    @contact = GetInTouch.new(contact_params)

    if @contact.save
      @success = true
    else
      @messages = @contact.errors.full_messages
      @success = false
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone_number, :message)
  end
end
