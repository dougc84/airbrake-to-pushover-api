AirbrakeToPushoverApi::Application.routes.draw do
  resources :webhook, only: [:create], path: 'send-to-pushover'
end
