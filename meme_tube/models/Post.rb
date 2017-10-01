require 'pg'
class Meme

	attr_accessor :id , :title , :url , :description , :genre

	def self.open_connection
		PG::Connection.connect( dbname: "meme_tube")
	end

	def self.all 
		conn = self.open_connection
		sql='SELECT * FROM meme;'
		results=conn.exec(sql)
		memes=results.map do |record|
			self.hydrate(record)
		end
		memes
	end

	def self.hydrate meme_data
		meme = Meme.new

		meme.id=meme_data['id']
		meme.title=meme_data['title']
		meme.url=meme_data['url']
		meme.description=meme_data['description']
		meme.genre=meme_data['genre']

		meme
	end

	def self.find id
		conn = self.open_connection
		sql = "SELECT * FROM meme WHERE id=#{id}"
		memes=conn.exec(sql)
		meme= self.hydrate memes[0]
	end

	def save 
		conn=Meme.open_connection

		if (!self.id)
			sql="INSERT INTO meme (title, url, description, genre) VALUES ('#{self.title}' , '#{self.url}' , '#{self.description}' , '#{self.genre}')"
		else 
			sql="UPDATE meme SET title='#{self.title}',url='#{self.url}', description='#{self.description}', genre='#{self.genre}' WHERE id=#{id}"
		end

		conn.exec(sql)
	end

	def self.destroy id 
		conn=self.open_connection
		sql="DELETE FROM meme where id=#{id}"

		conn.exec(sql)

	end


end




