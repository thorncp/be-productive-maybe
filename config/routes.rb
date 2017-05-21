Rails.application.routes.draw do
  root to: "tasks#index"

  resources :tasks, only: %i{index create update} do
    resource :completion, only: :create do
      match "", to: "completions#create", via: :get
    end
  end
end
