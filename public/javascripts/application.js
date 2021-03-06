function getDPI() {
  return document.getElementById("dpi_sample").offsetHeight;
};

function setDpi(linkobj) {
  linkobj.href = linkobj.href + '?dpi='+getDPI();
};

function publishPublication(linkobj, dom_id_for_link) {
  try {
    document.getElementById(dom_id_for_link+"_spinner").style.visibility = 'visible';
    document.getElementById(dom_id_for_link).innerHTML = '';
    new Ajax.Request(linkobj.href, {
      method:'get',
      onSuccess: function(transport){
        document.getElementById(dom_id_for_link+"_spinner").style.visibility = 'hidden';
        var jsonObj = transport.responseText.evalJSON(); 
        if ( jsonObj.status == 'ok') {
          var linkHref = jsonObj.data.bitly.short_url;
          document.getElementById(dom_id_for_link+"_publish").style.visibility = 'hidden';
          document.getElementById(dom_id_for_link+"_delete").style.visibility = 'hidden';
          document.getElementById(dom_id_for_link).innerHTML = '<a href="' + linkHref + '">Published</a>';
        } else {
          document.getElementById(dom_id_for_link).innerHTML = 'Failed - try again';
        }
      },
      onFailure: function() { 
        document.getElementById(dom_id_for_link+"_spinner").style.visibility = 'hidden';
        document.getElementById(dom_id_for_link).innerHTML = 'Failed';
      }
    });
  } catch (x) {
    return false;
  }
  return false;
};

function showPublicationIndex(e) {
  if (  $('index_dropdown').toggle().visible() ) {
    $('index_button').style.color = "#eee";
  } else {
    $('index_button').style.color = "blue";
  }
}

function showPublicationCopies(e) {
  if (  $('pub_copies_dropdown').toggle().visible() ) {
    $('pub_copies_button').style.color = "#eee";
  } else {
    $('pub_copies_button').style.color = "blue";
  }
}

// -------------------------------------------------------------------------------------------
// reload an image.
function reloadImg(id) {
  var obj = $(id);
  var url_parts = obj.src.split("?");
  var para_ary = [];
  var timestamp = (new Date()).getTime();

  if (url_parts.length > 1) 
  {
	var parameters = url_parts[1].split("&");
    
	for (var outer = 0; outer < parameters.length; outer++)
	{
	  var innerParts = parameters[outer].split("=");
	  var key = innerParts[0];
	  var value = (innerParts.length > 1) ? innerParts[1] : "";

      if ( key != "reload_timestamp" ) {
        para_ary.push(key + "=" + value);
      }
	}
  }

  para_ary.push("reload_timestamp=" + timestamp);
  obj.src = (url_parts[0] + "?" + para_ary.join("&"));
  return false;
}

// -------------------------------------------------------------------------------------------
// YouTube Controls
var YouTubeVideosPlayImmediately = [];
var YouTubeVideosSeekTo = {};
var YouTubeVideosPlayOrder = []; // objects with top/left
var YouTubeVideosCurrentPlayIndex = 0;
var YouTubeVideosPlayingAll = false;
var YouTubeVideosLoopAll = false;
var YouTubeVideosLoopCurrent = false;

function youTubePlayOnReady(dom_id) {
  YouTubeVideosPlayImmediately.push(dom_id);
}

function youTubeSeekToOnReady( dom_id, position_in_secs) {
  YouTubeVideosSeekTo[dom_id] = position_in_secs;
}

function youTubePlayVideoAt( dom_id, position_in_secs, end_at_in_secs) {
  var ytplayer = $(dom_id);
  if ( ytplayer ) {
    ytplayer.seekTo(position_in_secs,true);
    // setup timer to stop player if there is an end_at specified.
    if ( end_at_in_secs > position_in_secs ) {
      new PeriodicalExecuter(function(pe) { 
         ytplayer.pauseVideo();
         pe.stop();
      }, (end_at_in_secs - position_in_secs) + 5);
    }
  }
}

// From http://code.google.com/apis/youtube/js%5Fapi%5Freference.html#Events
// Possible values are unstarted (-1), ended (0), playing (1), 
// paused (2), buffering (3), video cued (5).
function youTubeStateChange(new_state) {
  if ( YouTubeVideosPlayingAll && new_state == 0 ) {
    if ( YouTubeVideosLoopCurrent ) {
      YouTubeVideosPlayOrder[YouTubeVideosCurrentPlayIndex].player().playVideo();
      return null;
    }

    YouTubeVideosCurrentPlayIndex++;
    if ( YouTubeVideosCurrentPlayIndex >= YouTubeVideosPlayOrder.length ) {
      if ( YouTubeVideosLoopAll ) {
        YouTubeVideosCurrentPlayIndex = 0;
        YouTubeVideosPlayOrder[YouTubeVideosCurrentPlayIndex].player().playVideo();
      } else {
        YouTubeVideosPlayingAll = false;
      }
    } else {
      YouTubeVideosPlayOrder[YouTubeVideosCurrentPlayIndex].player().playVideo();
    }
  }
  return null;
}

function onYouTubePlayerReady(playerId) {
  var ytplayer = $(playerId);
  // register event notification
  if ( ytplayer ) {
    ytplayer.addEventListener("onStateChange", "youTubeStateChange");
  }

  // seek to a specific copy of a video
  if ( YouTubeVideosSeekTo[playerId] ) {
    ytplayer.seekTo(YouTubeVideosSeekTo[playerId],true);
    ytplayer.pauseVideo();
  }

  // if this video should be played immediately ...
  if ( YouTubeVideosPlayImmediately.indexOf(playerId) > -1 && ytplayer) {
    ytplayer.playVideo();
  }
}

function youTubeSortVideoArray( obj_a, obj_b ) {
  if ( obj_a.y > obj_b.y ) { return 1; }
  if ( obj_a.y < obj_b.y ) { return -1;  }
  if ( obj_a.x < obj_b.x ) { return -1;  }
  if ( obj_a.x > obj_b.x ) { return 1; }
  return 0;
}

function youTubeRegister(dom_id, loc_top, loc_left) {
  var obj = {
    x: loc_left,
    y: loc_top,
    dom_id: dom_id,
    player: function() {
      return $(dom_id);
    }
  };
  YouTubeVideosPlayOrder.push(obj);
  YouTubeVideosPlayOrder.sort(youTubeSortVideoArray);
}

function youTubePlayAll(elem) {
  // TODO need to register the dom_id of this thing in case we get to the 
  // TODO end of the playlist and there is no loop happening then the link
  // TODO needs to say 'Play All'.
  if ( !YouTubeVideosPlayingAll ) {
    YouTubeVideosPlayingAll = true;
    YouTubeVideosCurrentPlayIndex = 0;
    YouTubeVideosPlayOrder[YouTubeVideosCurrentPlayIndex].player().playVideo();
    elem.innerHTML = "[Stop]";
  } else {
    YouTubeVideosPlayingAll = false;
    YouTubeVideosPlayOrder[YouTubeVideosCurrentPlayIndex].player().stopVideo();
    elem.innerHTML = "[Play All]";
  }
}

// stick this on a checkbox and pass self to the call.
function youTubeSetLoop(elem) {
  if ( YouTubeVideosLoopAll ) {
    if ( YouTubeVideosLoopCurrent ) {
      // can't happen
    } else {
      YouTubeVideosLoopCurrent = true;
      YouTubeVideosLoopAll = false;
      elem.innerHTML = "[Loop Current]";
    }
  } else {
    if ( YouTubeVideosLoopCurrent ) {
      YouTubeVideosLoopCurrent = false;
      YouTubeVideosLoopAll = false;
      elem.innerHTML = "[Loop None]";
    } else {
      YouTubeVideosLoopCurrent = false;
      YouTubeVideosLoopAll = true;
      elem.innerHTML = "[Loop All]";
    }
  }
}

// EOF YouTube Controls
// -------------------------------------------------------------------------------------------
