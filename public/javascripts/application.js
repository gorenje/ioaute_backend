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
// YouTube Controls
var YouTubeVideosPlayImmediately = [];
var YouTubeVideosPlayOrder = []; // objects with top/left
var YouTubeVideosCurrentPlayIndex = 0;
var YouTubeVideosPlayingAll = false;
var YouTubeVideosLoopAll = false;
var YouTubeVideosLoopCurrent = false;

function youTubePlayOnReady(dom_id) {
  YouTubeVideosPlayImmediately.push(dom_id);
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
  var ytplayer = document.getElementById(playerId);
  // register event notification
  if ( ytplayer ) {
    ytplayer.addEventListener("onStateChange", "youTubeStateChange");
  }

  // if this video should be played immediately ...
  if ( YouTubeVideosPlayImmediately.indexOf(playerId) > -1 && ytplayer) {
    ytplayer.playVideo();
  }
}

function youTubeSortVideoArray( obj_a, obj_b ) {
  if ( obj_a.y > obj_b.y ) { return -1; }
  if ( obj_a.y < obj_b.y ) { return 1;  }
  if ( obj_a.x < obj_b.x ) { return 1;  }
  if ( obj_a.x > obj_b.x ) { return -1; }
  return 0;
}

function youTubeRegister(dom_id, loc_top, loc_left) {
  var obj = {
    x: loc_left,
    y: loc_top,
    dom_id: dom_id,
    player: function() {
      return document.getElementById(dom_id);
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
