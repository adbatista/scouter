# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

# Make sure your secret_key_base is kept private
def secret_key
  key_file = Rails.root.join('.secret')

  if File.exist? key_file
    File.read(key_file).chomp
  else # Generate a new token and store it in key_file.
    require 'securerandom'
    token = SecureRandom.hex(128)
    File.write(key_file, token)
    token
  end
end

Scouter::Application.config.secret_key_base = secret_key