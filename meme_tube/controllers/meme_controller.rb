class MemeController < Sinatra::Base


	configure :development do
		register Sinatra::Reloader
	end


	set :root, File.join(File.dirname(__FILE__), '..')

	set :views, Proc.new { File.join(root, 'views') }




	get '/meme'  do 

		@meme=Meme.all

		@id=params[:id].to_i

		erb :'meme/index'
	end

	get '/meme/new' do
		erb :'meme/new'
	end

	get '/meme/:id' do
		@id= params[:id].to_i

		@meme=Meme.find(@id)

		erb :'meme/show'
	end




	post '/meme' do

		@meme=Meme.new

		@meme.title=params[:title]
		@meme.url=params[:url]

		@meme.save

	

		redirect '/meme'

	end

	get '/meme/:id/edit' do
		@id=params[:id].to_i

		@meme=Meme.find(@id)



		erb :'meme/edit'
	end


	put '/meme/:id' do
		@id=params[:id].to_i

		@meme=Meme.find(@id)

		@meme.title=params[:title]
		@meme.url=params[:url]

		@meme.save


		

		redirect "/meme/#{@id}"
	end


	delete '/meme/:id' do
		@id=params[:id].to_i

		@meme=$meme

		@meme.delete_at(@id)

		redirect '/meme'
	end

end