class MemeController < Sinatra::Base


	configure :development do
		register Sinatra::Reloader
	end


	set :root, File.join(File.dirname(__FILE__), '..')

	set :views, Proc.new { File.join(root, 'views') }


	$meme=[{
	title:'meme',
	link:'hehe'
	},
	{
	title:'meme2',
	link:'hehehe'
	}]

	get '/meme'  do 

		@meme=$meme

		@id=params[:id].to_i

		erb :'meme/index'
	end

	get '/meme/new' do
		erb :'meme/new'
	end

	get '/meme/:id' do
		@id= params[:id].to_i

		@meme=$meme[@id]

		@title=@meme[:title]
		@url=@meme[:link]

		erb :'meme/show'
	end




	post '/meme' do

		@memes=$meme

		new_meme={
		title:params[:title],
		link:params[:url]
		}

		@memes << new_meme

		"HELLO"

		redirect '/meme'

	end

	get '/meme/:id/edit' do
		@id=params[:id].to_i

		@meme=$meme[@id]


		erb :'meme/edit'
	end


	put '/meme/:id' do
		@id=params[:id].to_i
		@meme=$meme[@id]
		@meme[:title]=params[:title]
		@meme[:link]=params[:url]

		puts @meme

		redirect "/meme/#{@id}"
	end


	delete '/meme/:id' do
		@id=params[:id].to_i

		@meme=$meme

		@meme.delete_at(@id)

		redirect '/meme'
	end

end