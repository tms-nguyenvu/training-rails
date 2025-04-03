class Auth::SessionsController < Devise::SessionsController 
  def create
    super do |resource|
      # binding.pry
      
    end
  end
end