Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # READ
  get 'tasks/', to: 'tasks#index'
  get 'tasks/new', to: 'tasks#new', as: :new_task #This belongs to "CREATE" should come before task/:id

  get 'tasks/:id', to: 'tasks#show', as: :task

  #CREATE
  post 'tasks', to: "tasks#create"

  # Update
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  post 'tasks/:id', to: 'tasks#update'

  #Delete
  delete 'tasks/:id', to: 'tasks#destroy'

  # The above 7 routes is expressed with just one line in config/routes.rb:
  #resources :tasks
end
