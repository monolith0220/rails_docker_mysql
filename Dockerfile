FROM ruby:3.1

WORKDIR /app

#Gemfile, Gemfile.lock を docker 上にコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

#bundle install で Gemfile に指定されたパッケージをインストール
RUN bundle install

#rails server -b 0.0.0.0 で コンテナ起動時に、docker 内の全ての IP アドレスに結びつけて、サーバーを立ち上げる
CMD ["rails", "server", "-b", "0.0.0.0"]
