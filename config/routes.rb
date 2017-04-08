Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/page_pdf'
  post 'pages/page_pdf'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
