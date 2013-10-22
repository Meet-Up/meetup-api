MeetupApi::Application.routes.draw do
  resources :events, except: [:index, :new, :edit] do
    resources :participants, except: [:new, :edit]
  end

  match '/*path' => 'application#cors_preflight_check', :via => :options

end
