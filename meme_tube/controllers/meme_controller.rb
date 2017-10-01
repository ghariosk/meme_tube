class MemeController < Sinatra::Base


	configure :development do
		register Sinatra::Reloader
	end


	set :root, File.join(File.dirname(__FILE__), '..')

	set :views, Proc.new { File.join(root, 'views') }


	$meme=[
	{
	title:'meme',
	link:'hehe'
	},
	{
	title:'meme2',
	link:'hehehe'
	}
	]

	get '/meme'  do 

		erb :'/meme/index'
	end


	get '/meme/:id' do
		@id= params[:id].to_i

		@meme=$meme[@id]

		@title=@meme[:title]
		@url=@meme[:link]

			erb :'/meme/show'
		end

	get '/meme/new' do
		erb : '/meme/new'
	end

	post '/meme' do

		@memes=$meme
		new_meme={
		title:params[:title],
		url:params[:url]
		}

		@memes << new_meme

		redirect :'/meme/:id'
	end








end