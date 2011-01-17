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
          document.getElementById(dom_id_for_link).innerHTML = '<a href="' + linkHref + '">' + linkHref + "</a>";
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
