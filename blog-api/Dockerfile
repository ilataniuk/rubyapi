FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /blog-api
COPY Gemfile /blog-api/Gemfile
COPY Gemfile.lock /blog-api/Gemfile.lock
RUN bundle install
EXPOSE 3000
# Add a script to be executed every time the container starts.
COPY ./bin/dbcreate.sh /usr/bin/
RUN chmod +x /usr/bin/dbcreate.sh
ENTRYPOINT ["/usr/bin/dbcreate.sh"]
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
