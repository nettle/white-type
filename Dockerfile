FROM jekyll/jekyll

# Copy site and fix permissions!
WORKDIR /app
COPY --chown=jekyll:jekyll . /app
RUN chown jekyll:jekyll .
RUN bundle install

# Run Jekyll, note host 0.0.0.0!
CMD jekyll serve -H 0.0.0.0
