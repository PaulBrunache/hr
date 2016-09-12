Rails.application.routes.draw do

  devise_for :hrs
  devise_for :employees
  resources :referrals
  get 'pages/home'

  root 'hr/dashboard#manageReferrals'

  namespace :employee do
    get 'dashboard/index'
  end

  namespace :hr do
    get 'dashboard/manageReferrals'
    get 'dashboard/manageAdmins'
    get 'dashboard/leaderboard'
    get 'dashboard/profile'
  end

end
