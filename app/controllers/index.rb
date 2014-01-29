get '/' do
  # Look in app/views/index.erb
  erb :index
end
# Create a new post
post '/posts' do
  # puts "Params #{params.inspect}"
  Post.create!(
    :title => params["title"],
    :description => params["description"],
    :price => params["price".to_i],
    :contact => params["contact"],
    :category_id => params["category"]
    )
    "Thanks!"
end

put '/posts' do
  puts "This is totally different!"
end

# Displays a post
get '/posts/:id' do
  @post = Post.find(params[:id])
  @category = Category.find(@post.category_id).name
  erb :post
end
# Displays all categories
get '/categories' do
  @categories = []
  Category.all.each do |cat|
    @categories << cat.name
  end

  erb :categories
end

# Displays all posts from a category
get '/categories/:id' do
  @name = Category.find(params[:id]).name
  c = Post.where("category_id = ?", params[:id])
  @posts = []
  c.each do |post|
    @posts << post.title
  end

  erb :category_posts
end


get '/edit/:id' do
  post = Post.find(params[:id])
  @hash = post.attributes
  puts @hash
  @var = "old value"
  erb :edit_form
end

post '/edit' do
  # puts "Params #{params.inspect}"
  Post.update( params["id"],
    :title => params["title"],
    :description => params["description"],
    :price => params["price".to_i],
    :contact => params["contact"],
    :category_id => params["category"]
    )
    "Thanks!"
end
