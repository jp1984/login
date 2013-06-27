# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Login::Application.config.secret_key_base = '60dcdbfdc7ce25ef153d017ce7e4efe81263aba31ece7332aa6bd4877f0795b3902cd50c819fb1e757693c9764e72558ac2c2697f3461da3724ad445439095af'
