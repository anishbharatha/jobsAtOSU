Jobsatosu::Application.routes.draw do

  root 'welcome#index'                        # Route to index page
  post 'email_job'  =>  'welcome#email_job'   # Route to email job details
  post 'change_view'=>  'welcome#change_view' # Route to switch between views
  post 'contact_us' =>  'welcome#contact_us'  # Route to let user contact the HR via email
end
