WannabeApplication.router.config do
  get "/test", :to => "custom#index"
  get /.*/, :to => "custom#show"
end
