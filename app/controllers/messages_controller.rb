class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.ip = request.remote_ip
    
    @message.save!
    head :ok
  end
  
  private 
  def message_params
    params.require(:message).permit(:content, :ip)
  end
  
  def render_message(message)
    "<a href=\"#\" class=\"list-group-item\">\n  <h4 class=\"list-group-item-heading\">message.ip </h4>\n  <p class=\"list-group-item-text\">message.content </p>\n</a>"
  end
end
