require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:"home")
end

get("/square/new") do
  erb(:"home")
end

get("/square/results") do
  @num = params.fetch("number").to_f
  @result = @num**2.to_f
  erb(:"square_results")
end

get("/square_root/new") do
  erb(:"square_root")
end

get("/square_root/results") do
  @num = params.fetch("number").to_f
  @result = @num**0.5.to_f
  erb(:"square_root_results")
end

get("/payment/new") do
  erb(:"payment")
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f.to_fs(:percentage, {:precision => 4})
  @years = params.fetch("years").to_i
  @principal = @params.fetch("principal").to_f.to_fs(:currency, {:precision => 2})

  @apr_float = params.fetch("apr").to_f
  @principal_float = @params.fetch("principal").to_f
  @rate = (@apr_float / 100) / 12
  @monthly = @years * 12
  @numerator = @rate * @principal_float
  @denomenator = 1 - (1 + @rate)**-@monthly
  @payment = @numerator / @denomenator
  @payment_format = @payment.to_fs(:currency, {:precision => 2})
   
  erb(:"payment_results")
end

get("/random/new") do
  erb(:"random")
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @random = rand(@min..@max).to_f
  erb(:"random_results")
end
