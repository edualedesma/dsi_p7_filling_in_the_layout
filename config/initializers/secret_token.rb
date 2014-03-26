# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#P6SampleApp::Application.config.secret_key_base = 'c174f42af5b00dbd75c537a173bbf4cbf7224bad84994eebab4960c98e9c3fa4c715e6ece8772fab6e76b0bb5e4e80753a36bc5615dd50a961feca8945a67b8a'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

P6SampleApp::Application.config.secret_key_base = secure_token
