#現況
目前已經有簡單架構了，不過之後是一定還會再改。

目前的架構設計就是希望每個 paper model 物件實體都代表一篇論文，而每個 paper model 會去載入指定的FieldParser(config/initializers/paper.rb)。而每個 FieldParser 分別負責解析一個或多個欄位。例如：論文標題的parser、論文引用次數的parser...


這樣的設計是希望可以提高擴充性，以後若欄位變動就只需要修改個別 parser、若有需要增加欄位，就增加 parser。

#Requirement
1. Ruby 2.0   --it is recommended using [rvm](https://rvm.io/) or [rbenv](https://github.com/sstephenson/rbenv) to manage your ruby version.
2. [MongoDB](https://www.mongodb.org/)

#Getting Start
clone this repository
```
$ git clone https://github.com/leepupu/ISI_crawler.git
```

change directory to this repository
```
$ cd ISI_crawler
```

you should install [bundler](http://bundler.io/) first, if you haven't.
```
$ gem install bundler
```

run bundle install
```
$ bundle install
```

copy config/mongo-sample.yml to config/mongo.yml
```
$ cp config/mongo-sample.yml config/mongo.yml
```

run ruby irb, and load ./work.rb
```
$ irb
> require './isi_crawler.rb'
> ISICrawler.init      #make sure that MongoDB is running and the configs in config/mongo.yml is correct
```
after initializing, you can starting testing
```
> paper = Paper.new
> paper.parse('html')
> paper.save
```
you should see a new record is saved to database.

Note: the 'html' param above should be Mechanize instance, and it should be passed into each parser of paper. By handling the Mechanize instance, each parser is able to get the data it responsable for.
