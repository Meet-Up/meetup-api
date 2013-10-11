MeetupApi::Application.routes.draw do
  resources :events, except: [:index, :new, :edit]
end
