WannabeApplication.router.config do
  get "/test", :to => "custom#index"
  root "custom#index"
  get /.*/, :to => "custom#show"
end
