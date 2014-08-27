module BroadcastsHelper

  def less_button(page)
    if page.to_i > 0
      link_to 'newer', broadcasts_url({:page => page.to_i-1}), :remote => true, :class => 'button small' 
    else
      raw("<div class = 'button small disabled'>newer</div>")
    end
  end

  def more_button(page, broadcast_list)
    if broadcast_list.size == 20
      link_to 'older', broadcasts_url({:page => page.to_i+1}), :remote => true, :class => 'button small'
    else
      raw("<div class = 'button small disabled'>older</div>")
    end
  end

end
