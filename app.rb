require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

# ---- square with form
get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @user_num = params[:users_number]
  @square_user_num = params[:users_number].to_f**2
  erb(:square_results)
end

# ---- square root with form
get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @user_num = params[:users_number]
  @square_root_user_num = Math.sqrt(@user_num.to_f)
  erb(:square_root_results)
end

# ---- payment with form
get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  @apr = params[:user_apr].to_f
  @years = params[:user_years].to_f
  @principal = params[:user_pv].to_f.round(2)

  monthly_interest_rate = (@apr / 12) / 100
  total_payments = @years * 12
  @payment = (@principal * monthly_interest_rate * (1 + monthly_interest_rate)**total_payments) / ((1 + monthly_interest_rate)**total_payments - 1)
  @payment = @payment.round(2)
 
  erb(:payment_results)
end

# ---- random with form
get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min = params[:user_min].to_f
  @max = params[:user_max].to_f
  @random_number= rand(@min..@max)
  erb(:random_result)
end
