Rails.application.routes.draw do
  root "event#index"

  recources :events
end
