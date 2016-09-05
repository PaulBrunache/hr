Rails.application.routes.draw do

  namespace :employee do
    get 'dashboard/index'
  end

  namespace :admin do
    get 'dashboard/manageReferrals'
    get 'dashboard/manageAdmins'
    get 'dashboard/leaderboard'
    get 'dashboard/profile'
  end

  resources :referrals
  devise_for :admins
  devise_for :employees
  get 'pages/home'

end
