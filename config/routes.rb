Rails.application.routes.draw do



  devise_for :human_resources
  devise_for :employees
  resources :referrals

  get 'pages/home'

  root 'human_resources/dashboard#manageReferrals'

  namespace :employees do
    get 'dashboard/index'
  end

  namespace :human_resources do
    get 'dashboard/manageReferrals'
    get 'dashboard/manageAdmins'
    get 'dashboard/leaderboard'
    get 'dashboard/profile'
  end



end
