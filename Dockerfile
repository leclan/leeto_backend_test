FROM ruby:2.7.0-buster

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Set Rails environment to production
ENV RAILS_ENV production

# Install gems, nodejs and precompile the assets
RUN bundle install --deployment --without development test \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt install -y nodejs

# Start the application server
CMD ['/application/entrypoint.sh']
