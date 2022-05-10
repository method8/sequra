require 'sidekiq/web'
Rails.application.routes.draw do
  namespace 'api' do
      resources :disbursements
  end
  mount Sidekiq::Web => '/sidekiq'
end