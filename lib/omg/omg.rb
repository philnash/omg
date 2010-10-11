module Omg
  def omg!
    Rails.logger.debug('==============')
    Rails.logger.debug "OMG! #{this_method} called!"
    Rails.logger.debug('==============')
  end
end