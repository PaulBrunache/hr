Rails.application.routes.draw do


  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :referrals
  resources :job_postings
  resources :departments
  root 'pages#home'

  devise_for :human_resources, path: 'hr', controllers: { registrations: "registrations" },
  path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
  confirmation: 'verification',sign_up: 'register',edit: 'edit/profile'
  }


  devise_for :employees, path: 'employee', controllers: { registrations: "registrations" },
  path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
  confirmation: 'verification',sign_up: 'register',edit: 'edit/profile'
  }

  #Employees custom routes
  get 'employee/dashboard/index',to: 'employees/dashboard#index'
  get 'employee/dashboard/my-referrals',to: 'employees/dashboard#my_referrals'

  #HR custom routes
  get 'hr/dashboard/manageReferrals',to: 'human_resources/dashboard#manageReferrals'
  get 'hr/dashboard/manageAdmins',to: 'human_resources/dashboard#manageAdmins'
  get 'hr/dashboard/leaderboard',to: 'human_resources/dashboard#leaderboard'
  get 'hr/dashboard/profile',to: 'human_resources/dashboard#profile'
  post 'validate_admin', to: 'human_resources/dashboard#create_hr'

end
