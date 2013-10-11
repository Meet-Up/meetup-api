MeetupApi::Application.routes.draw do
  resources :events, only: [:show, :create, :update]
end
