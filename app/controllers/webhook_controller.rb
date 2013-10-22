class WebhookController < ApplicationController
  #
  # curl -X POST -H 'content-type: application/json' -d @sample.json http://localhost:3000/send-to-pushover
  # 
  def create
    history = History.new
    history.params = params
    history.save

    @user_token ||= ENV['PUSHOVER_USER_TOKEN']
    @api_key    ||= ENV['PUSHOVER_API_TOKEN']

    Pushover.notification title: history.title,
                          message: pushover_message(history),
                          user: @user_token,
                          token: @api_key,
                          sound: 'falling',
                          url: history_url(history.sid)

    render nothing: true
  end

  def show
    @history = History.where(sid: params[:id])
    render
  end

  private

  def pushover_message(history)
    message = <<-MESSAGE.squish
      An error has occurred: #{history.message} (last at #{history.last_occurrence_string},
      occurred #{history.times_occurred} #{'time'.pluralize(history.times_occurred)}
    MESSAGE
  end

  def pushover_link
    nil
  end
end
