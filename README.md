docker php+mysql+unison+nginx
============================


# Installation

```
make start
```


# MySQL
```
GRANT ALL PRIVILEGES ON *.* TO 'dev'@'%'  WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

# Docker-sync
```
# If connecting to HTTPS rubygem server is impossible
gem install docker-sync --source http://rubygems.org
```
