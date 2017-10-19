class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = @group.messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :root
    else
      render :index, alert: "メッセージを入力してください"
    end

  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
