require 'sqlite3'

$db = SQLite3::Database.new "db/100_sentences.sqlite3"

def insert file_name
  content = IO.read(file_name)
  base_name = File.basename(file_name, 'jpg.txt')
  $db.execute "
      INSERT INTO images (name, content) 
      VALUES (?, ?)
  ", [base_name, content]
end

Dir.glob("base64/*.txt") do |f|
  insert f
end