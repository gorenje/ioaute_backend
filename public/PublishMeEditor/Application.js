var a,baseURL=new CFURL(".",ObjectiveJ.pageURL),URLCache={},CFHTTPRequest_open=CFHTTPRequest.prototype.open;CFHTTPRequest.prototype.open=function(c,b){var d=CFHTTPRequest._lookupCachedRequest(b);if(d){var e=this;this._nativeRequest=d;this._nativeRequest.onreadystatechange=function(){ObjectiveJ.determineAndDispatchHTTPRequestEvents(e)}}return CFHTTPRequest_open.apply(this,arguments)};CFHTTPRequest._cacheRequest=function(c,b,d,e){URLCache[c]=new MockXMLHttpRequest(b,d,e)};
CFHTTPRequest._lookupCachedRequest=function(c){return URLCache[c]};function MockXMLHttpRequest(c,b,d){this.readyState=CFHTTPRequest.UninitializedState;this.status=c||200;this.statusText="";this.responseText=d||"";this._responseHeaders=b||{}}a=MockXMLHttpRequest.prototype;a.open=function(c,b,d){this.readyState=CFHTTPRequest.LoadingState;this.async=d};
a.send=function(){function c(){for(b.readyState=CFHTTPRequest.LoadedState;b.readyState<=CFHTTPRequest.CompleteState;b.readyState++)b.onreadystatechange()}var b=this;b.responseText=b.responseText.toString();(b.async?ObjectiveJ.Asynchronous(c):c)()};a.onreadystatechange=function(){};a.abort=function(){};a.setRequestHeader=function(){};a.getAllResponseHeaders=function(){return this._responseHeaders};a.getResponseHeader=function(c){return this._responseHeaders[c]};a.overrideMimeType=function(){};
for(var appFilesCount=4,i=1;i<=appFilesCount;i++){var script=document.createElement("script");script.src="Application"+i+".js?t=1301678977";script.charset="UTF-8";script.onload=function(){--appFilesCount===0&&ObjectiveJ.bootstrap()};document.getElementsByTagName("head")[0].appendChild(script)};
