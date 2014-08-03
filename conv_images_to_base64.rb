def encode_to_base64 file_name
  File.open("base64/#{ File.basename(file_name) }.txt", "w") do |f|
    f.write [open(file_name).read].pack("m").gsub(/\n/,'')
  end
end

Dir.glob('100cards/*.jpg') do |file_name|
  encode_to_base64 file_name
end
