AirbrakeToPushoverApi::Application.routes.draw do
  resources :webhook, only: [:create], path: 'send-to-pushover'
  resources :webhook, only: [:show], path: 'history', as: :history
end
