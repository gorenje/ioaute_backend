(function(){
   var id = 0, head = $$('head')[0], global = this;
   global.getJSONP = function(url, callback) {
     var script = document.createElement('script'), token = '__jsonp' + id;
     global[token] = callback;
     script.src = url.replace(/\?(&|$)/, '__jsonp' + id + '$1');
     script.onload = function() {
       script.remove();
       script = null;
       delete global[token];
     };
     head.appendChild(script);
     id++;
   }
 })();

function updateCategory(obj) {
  var elem = $$('#category_field')[0];
  if ( elem.value == "" ) {
    elem.value = obj.innerHTML;
  } else {
    elem.value += ", " + obj.innerHTML;
  }
}

function linkForTrend(cnt, idx)
{
  return "<a class='trend_link size" + cnt + "' onclick='updateCategory(this);'>" + idx + "</a> ";
}

// Get twitter trends, requires the #twitter_trends div
getJSONP(
  'http://api.twitter.com/1/trends/weekly.json?format=json&callback=?',
  function(data){
    var allTrends = new Object();
    for ( var idx in data.trends ) {
      for ( var jdx = 0; jdx < data.trends[idx].length; jdx++ ) {
        var query = data.trends[idx][jdx].query;
        if ( query in allTrends ) {
          allTrends[query] += 1;
        } else {
          allTrends[query] = 1;
        }
      }
    }
    for ( var idx in allTrends ) {
      var cnt = allTrends[idx];
      $$('#twitter_trends')[0].innerHTML += linkForTrend(cnt, idx);
    }
  }
);

// digg trends, requires digg_trends div.
getJSONP(
  'http://services.digg.com/2.0/comment.getRecent?count=100&type=javascript&callback=?',
  function(data){
    var allTrends = new Object();
    for ( var jdx = 0; jdx < data.comments.length; jdx++ ) {
      var query = data.comments[jdx].item.title;
      if ( query in allTrends ) {
        allTrends[query] += 1;
      } else {
        allTrends[query] = 1;
      }
    }
    for ( var idx in allTrends ) {
      var cnt = allTrends[idx];
      $$('#digg_trends')[0].innerHTML += linkForTrend(cnt, idx);
    }
  }
);
