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
  @user_num = params[:users_number].to_f
  @square_root_user_num = Math.sqrt(@user_num)
  erb(:square_root_results)
end

# ---- payment with form


# ---- random with form
