# Use the Ruby 2.7.4 image from Docker Hub
FROM ruby:2.7.4

# Use a directory called /code in which to store
# this application's files.
WORKDIR /app

# Copy all the application's files into the /app
# directory.
COPY Gemfile Gemfile.lock ./

#  Run bundle install to install the Ruby dependencies.
RUN bundle install

# Copy all the application's files into the container
COPY . .

# Expose port 3000.
EXPOSE 3000

# Set "rails server -b 0.0.0.0" as the command to
# run when this container starts.
CMD ["rails", "server", "-b", "0.0.0.0"]