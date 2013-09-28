class WebhookController < ApplicationController
  def create
    @user_token ||= ENV['PUSHOVER_USER_TOKEN']
    @api_key    ||= ENV['PUSHOVER_API_TOKEN']
    @timezone   ||= 'EST'
    Pushover.notification title: pushover_title,
                          message: pushover_message,
                          user: @user_token,
                          token: @api_key,
                          sound: 'falling'
  end

  private

  def pushover_title
    "#{project_name} (#{environment})"
  end

  def pushover_message
    "An error has occurred: #{error_message} (last at #{last_occurrence}, #{times_occurred_string})"
  end

  def pushover_link
    nil
  end

  def environment;      params[:error][:environment]; end
  def error_file;       params[:error][:file]; end
  def error_message;    params[:error][:error_message]; end
  def last_occurrence
    Time.zone.
      parse(params[:error][:last_occurred_at]).
      in_time_zone(@timezone).
      strftime("%m/%d/%Y %I:%M%p")
  end
  def project_name;     params[:error][:project][:name]; end
  def times_occurred;   params[:error][:times_occurred]; end
  def times_occurred_string
    "occurred #{times_occurred} #{ 'time'.pluralize(times_occurred.to_i) }"
  end
end
