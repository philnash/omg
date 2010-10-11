module Omg
  def omg!(obj=nil)
    Rails.logger.debug('')
    Rails.logger.debug('~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    Rails.logger.debug "OMG!"
    if obj
      Rails.logger.debug "#{omg_method} called!"
    else
      Rails.logger.debug obj.inspect
    end
    Rails.logger.debug('~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    Rails.logger.debug('')
  end
end