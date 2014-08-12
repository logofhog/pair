module BroadcastsHelper
  def message
    puts 'in message ===================='
    if @message.nil?
      'There are no broadcasts in that area!'
    end
  end

end
