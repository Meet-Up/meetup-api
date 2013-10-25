MeetupApi::Application.routes.draw do
  resources :events, except: [:index, :new, :edit] do
    resources :participants, except: [:new, :edit]
    get 'time_selection', on: :collection
  end

  match '/*path' => 'application#cors_preflight_check', :via => :options

end
