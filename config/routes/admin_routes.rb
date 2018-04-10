module AdminRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :admin do
        root to: 'home#index'
      end
    end
  end
end