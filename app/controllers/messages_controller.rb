class MessagesController < ApplicationController

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save

  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
