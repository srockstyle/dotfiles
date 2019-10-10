##---------------------------------------------
## コマンドラインからWebの検索をする
##---------------------------------------------
# 使い方 $ google vim rails
# url: $1, delimiter: $2, prefix: $3, words: $4..
function web_search {
  local url=$1       && shift
  local delimiter=$1 && shift
  local prefix=$1    && shift
  local query

  while [ -n "$1" ]; do
    if [ -n "$query" ]; then
      query="${query}${delimiter}${prefix}$1"
    else
      query="${prefix}$1"
    fi
    shift
  done

  open "${url}${query}"
}

## qiita
function qiita () {
  web_search "http://qiita.com/search?utf8=✓&q=" "+" "" $*
}

## google
function google () {
  web_search "https://www.google.co.jp/search?&q=" "+" "" $*
}

# search in metacpan
function perldoc() {
  command perldoc $1 2>/dev/null
  [ $? -ne 0 ] && web_search "https://metacpan.org/search?q=" "+" "" $*
  return 0
}

# search in rurima
function rurima () {
  web_search "http://rurema.clear-code.com" "/" "query:" $*
}

# search in rubygems
function gems () {
  web_search "http://rubygems.org/search?utf8=✓&query=" "+" "" $*
}

# search in github
function github () {
  web_search "https://github.com/search?type=Code&q=" "+" "" $*
}
