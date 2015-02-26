namespace :secrets do
  desc "Generate secret environment variables"
  task :init do
    # Put devise key in /etc/environment
    queue %{echo "DEVISE_SECRET_KEY=#{SecureReandom.hex(64)}" | sudo tee -a /etc/environment}

    # Put Rails secret key base in /etc/environment
    queue %{echo "SECRET_KEY_BASE=#{SecureReandom.hex(64)}" | sudo tee -a /etc/environment}
  end
end