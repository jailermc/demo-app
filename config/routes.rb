Rails.application.routes.draw do
  devise_for :users

  resources :time_sheets
  resources :employees
  resources :rois
  resources :fill_formulas
  resources :template_uploads
  resources :leeds
  resources :change_orders do
    member do
      get 'show_alternative', to: 'change_orders#show_alternative'
    end
  end
  resources :rfis
  resources :cost_sheets
  resources :dailylogs do
    member do
      get 'show_alternative'
    end
  end
  resources :estimateds

  get 'estimateds/search', to: 'estimateds#search', as: 'search_estimateds'

  root to: 'estimateds#index'
end
