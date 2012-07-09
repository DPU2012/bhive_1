Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '393160320721597', 'bbaf9cd1aa2c6716d786c99cbfd875f9',  {:scope => 'publish_stream, read_stream, manage_pages '}

end