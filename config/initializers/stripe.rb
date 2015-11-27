Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# stripe_api_key: sk_test_BQokikJOvBiI2HlWgH4olfQ2
# stripe_publishable_key: pk_test_6pRNASCoBOKtIshFeQd4XMUh