Rails.application.routes.draw do

  resources :referrals

  devise_for :employees, path: "",
  path_names: { sign_in: 'employee/login',sign_out: 'logout' }

  devise_for :hrs, path: "",
  path_names: { sign_in: 'hr/login',sign_out: 'logout' }


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
