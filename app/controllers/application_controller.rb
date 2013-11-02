class ApplicationController < ActionController::API
  rescue_from ActionController::RoutingError do |exception|
    render text: ""
    return
  end
end
