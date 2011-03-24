@STATIC;1.0;p;12;WKTextView.jt;17798;@STATIC;1.0;I;15;AppKit/AppKit.jI;20;Foundation/CPTimer.jt;17733;
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("Foundation/CPTimer.j",NO);
var _1=objj_allocateClassPair(CPWebView,"_WKWebView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("DOMWindow"),function(_3,_4){
with(_3){
var _5=nil;
try{
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_WKWebView").super_class},"DOMWindow");
}
catch(e){
}
return _5;
}
})]);
WKTextCursorHeightFactor=0.2;
WKTextViewInnerPadding=4;
WKTextViewDefaultFont="Verdana";
_CancelEvent=function(ev){
if(!ev){
ev=window.event;
}
if(ev&&ev.stopPropagation){
ev.stopPropagation();
}else{
if(ev&&ev.cancelBubble){
ev.cancelBubble=true;
}
}
};
_EditorEvents=["onmousedown","onmouseup","onkeypress","onkeydown","onkeyup"];
var _1=objj_allocateClassPair(_WKWebView,"WKTextView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("delegate"),new objj_ivar("loadTimer"),new objj_ivar("editor"),new objj_ivar("_scrollDiv"),new objj_ivar("shouldFocusAfterAction"),new objj_ivar("suppressAutoFocus"),new objj_ivar("editable"),new objj_ivar("enabled"),new objj_ivar("autohidesScrollers"),new objj_ivar("lastFont"),new objj_ivar("lastColorString"),new objj_ivar("lastColor"),new objj_ivar("eventHandlerSwizzler"),new objj_ivar("_verticalScroller"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_cursorPlaced"),new objj_ivar("_isTryingToBecomeFirstResponder")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_6,_7){
with(_6){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_8,_9,_a){
with(_8){
delegate=_a;
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_b,_c){
with(_b){
return autohidesScrollers;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_d,_e,_f){
with(_d){
autohidesScrollers=_f;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_10,_11,_12){
with(_10){
if(_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("WKTextView").super_class},"initWithFrame:",_12)){
lastColor=objj_msgSend(CPColor,"blackColor");
_verticalPageScroll=10;
_verticalLineScroll=10;
autohidesScrollers=YES;
objj_msgSend(_10,"setDrawsBackground:",NO);
objj_msgSend(_10,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
eventHandlerSwizzler=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
shouldFocusAfterAction=YES;
objj_msgSend(_10,"setEditable:",YES);
objj_msgSend(_10,"setEnabled:",YES);
objj_msgSend(_10,"setScrollMode:",CPWebViewScrollNative);
objj_msgSend(_10,"setMainFrameURL:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_10,"class")),"pathForResource:","WKTextView/editor.html"));
_verticalScroller=objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),MAX(CGRectGetHeight(objj_msgSend(_10,"bounds")),objj_msgSend(CPScroller,"scrollerWidth")+1)));
objj_msgSend(_verticalScroller,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_verticalScroller,"setTarget:",_10);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_10,"addSubview:",_verticalScroller);
objj_msgSend(_10,"_updateScrollbar");
objj_msgSend(_10,"checkLoad");
}
return _10;
}
}),new objj_method(sel_getUid("_startedLoading"),function(_13,_14){
with(_13){
editor=nil;
_cursorPlaced=NO;
objj_msgSendSuper({receiver:_13,super_class:objj_getClass("WKTextView").super_class},"_startedLoading");
}
}),new objj_method(sel_getUid("viewDidHide"),function(_15,_16){
with(_15){
editor=nil;
_cursorPlaced=NO;
}
}),new objj_method(sel_getUid("viewDidUnhide"),function(_17,_18){
with(_17){
if(editor===nil){
objj_msgSend(_17,"checkLoad");
}else{
objj_msgSend(_17,"_actualizeEnabledState");
}
}
}),new objj_method(sel_getUid("_finishedLoading"),function(_19,_1a){
with(_19){
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("WKTextView").super_class},"_finishedLoading");
objj_msgSend(_19,"checkLoad");
}
}),new objj_method(sel_getUid("checkLoad"),function(_1b,_1c){
with(_1b){
if(objj_msgSend(_1b,"isHiddenOrHasHiddenAncestor")){
return;
}
var _1d=objj_msgSend(_1b,"objectByEvaluatingJavaScriptFromString:","typeof(__closure_editor) != 'undefined' ? __closure_editor : null");
if(_1d){
_scrollDiv=_1d.__scroll_div;
objj_msgSend(_1b,"setEditor:",_1d);
if(loadTimer){
objj_msgSend(loadTimer,"invalidate");
loadTimer=nil;
}
if(_html!=nil){
objj_msgSend(_1b,"setHtmlValue:",_html);
}
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("textViewDidLoad:"))){
objj_msgSend(delegate,"textViewDidLoad:",_1b);
}
return;
}
if(!loadTimer||!objj_msgSend(loadTimer,"isValid")){
loadTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.1,_1b,"checkLoad",nil,NO);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_1e,_1f){
with(_1e){
return (editor!==nil&&objj_msgSend(_1e,"isEditable")&&objj_msgSend(_1e,"isEnabled"));
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_20,_21){
with(_20){
objj_msgSend(_20,"_didBeginEditing");
if(_cursorPlaced){
editor.focus();
}else{
editor.focusAndPlaceCursorAtStart();
_cursorPlaced=YES;
}
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_22,_23){
with(_22){
window.focus();
objj_msgSend(_22,"_didEndEditing");
return YES;
}
}),new objj_method(sel_getUid("setEditable:"),function(_24,_25,_26){
with(_24){
editable=_26;
}
}),new objj_method(sel_getUid("isEditable"),function(_27,_28){
with(_27){
return editable;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_29,_2a,_2b){
with(_29){
if(enabled===_2b){
return;
}
enabled=_2b;
objj_msgSend(_29,"_actualizeEnabledState");
}
}),new objj_method(sel_getUid("_actualizeEnabledState"),function(_2c,_2d){
with(_2c){
if(editor){
var _2e=!editor.isUneditable();
if(!_2e&&enabled){
editor.makeEditable();
}else{
if(_2e&&!enabled){
editor.makeUneditable();
}
}
}
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_2f,_30,_31){
with(_2f){
if(autohidesScrollers===_31){
return;
}
autohidesScrollers=_31;
objj_msgSend(_2f,"_updateScrollbar");
}
}),new objj_method(sel_getUid("isEnabled"),function(_32,_33){
with(_32){
return enabled;
}
}),new objj_method(sel_getUid("setShouldFocusAfterAction:"),function(_34,_35,_36){
with(_34){
shouldFocusAfterAction=_36;
}
}),new objj_method(sel_getUid("shouldFocusAfterAction"),function(_37,_38){
with(_37){
return shouldFocusAfterAction;
}
}),new objj_method(sel_getUid("tryToBecomeFirstResponder"),function(_39,_3a){
with(_39){
if(_isTryingToBecomeFirstResponder){
return YES;
}
var win=objj_msgSend(_39,"window");
if(objj_msgSend(win,"firstResponder")===_39){
return YES;
}
var _3b=false;
_isTryingToBecomeFirstResponder=YES;
try{
if(objj_msgSend(_39,"acceptsFirstResponder")){
_3b=objj_msgSend(win,"makeFirstResponder:",_39);
if(_3b){
if(!objj_msgSend(win,"isKeyWindow")){
objj_msgSend(win,"makeKeyAndOrderFront:",_39);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}
}
finally{
_isTryingToBecomeFirstResponder=NO;
}
return _3b;
}
}),new objj_method(sel_getUid("setEditor:"),function(_3c,_3d,_3e){
with(_3c){
if(editor===_3e){
return;
}
if(!objj_msgSend(_3c,"DOMWindow")){
return;
}
editor=_3e;
_iframe.allowTransparency=true;
objj_msgSend(_3c,"DOMWindow").document.body.style.backgroundColor="transparent";
suppressAutoFocus=YES;
suppressAutoFocus=NO;
if(editor["WKTextView_Installed"]===undefined){
var win=objj_msgSend(_3c,"DOMWindow"),doc=win.document;
var _3f=function(ev){
return objj_msgSend(_3c,"tryToBecomeFirstResponder");
};
defaultKeydown=doc.onkeydown;
var _40=function(ev){
if(!ev){
ev=window.event;
}
var key=ev.keyCode;
if(!key){
key=ev.which;
}
if(ev.shiftKey&&key==9){
setTimeout(function(){
objj_msgSend(objj_msgSend(_3c,"window"),"selectPreviousKeyView:",_3c);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},0);
return false;
}else{
if(defaultKeydown){
return defaultKeydown(ev);
}
return true;
}
};
var _41=function(ev){
if(!ev){
ev=window.event;
}
objj_msgSend(_3c,"_updateScrollbar");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
return true;
};
if(doc.addEventListener){
doc.addEventListener("mousedown",_3f,true);
editor.addEventListener("keydown",_40,true);
doc.body.addEventListener("scroll",_41,true);
}else{
if(doc.attachEvent){
doc.attachEvent("onmousedown",_3f);
doc.attachEvent("onkeydown",_40);
doc.body.attachEvent("scroll",_41);
}
}
editor.__fieldChangeExternal=function(){
objj_msgSend(_3c,"_didChange");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
editor.__selectionChangeExternal=function(){
objj_msgSend(_3c,"_cursorDidMove");
objj_msgSend(_3c,"tryToBecomeFirstResponder");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
editor["WKTextView_Installed"]=true;
}
objj_msgSend(_3c,"_actualizeEnabledState");
objj_msgSend(_3c,"_resizeWebFrame");
}
}),new objj_method(sel_getUid("editor"),function(_42,_43){
with(_42){
return objj_msgSend(_42,"isHiddenOrHasHiddenAncestor")?nil:editor;
}
}),new objj_method(sel_getUid("_updateScrollbar"),function(_44,_45){
with(_44){
if(!_verticalScroller){
return;
}
var _46=0,_47=1,_48=CGRectGetHeight(objj_msgSend(_44,"bounds")),_49=CGRectGetWidth(objj_msgSend(_verticalScroller,"bounds"));
if(_scrollDiv){
_46=_scrollDiv.scrollTop;
_47=_scrollDiv.scrollHeight;
}
_47=MAX(1,_47);
var _4a=_47-_48,_4b=_48/_47;
if(_4b>0.99){
_4b=1;
}
objj_msgSend(_verticalScroller,"setHidden:",autohidesScrollers&&_4b==1);
objj_msgSend(_verticalScroller,"setFloatValue:",_46/_4a);
objj_msgSend(_verticalScroller,"setKnobProportion:",_4b);
objj_msgSend(_verticalScroller,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_44,"bounds"))-_49,0,_49,_48));
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_4c,_4d,_4e){
with(_4c){
if(!_scrollDiv){
return;
}
var _4f=_scrollDiv.scrollTop,_50=_scrollDiv.scrollHeight,_51=CGRectGetHeight(objj_msgSend(_4c,"bounds")),_52=objj_msgSend(_4e,"floatValue");
switch(objj_msgSend(_verticalScroller,"hitPart")){
case CPScrollerDecrementLine:
_4f-=_verticalLineScroll;
break;
case CPScrollerIncrementLine:
_4f+=_verticalLineScroll;
break;
case CPScrollerDecrementPage:
_4f-=_51-_verticalPageScroll;
break;
case CPScrollerIncrementPage:
_4f+=_51-_verticalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_4f=ROUND(_52*(_50-_51));
}
_scrollDiv.scrollTop=_4f;
}
}),new objj_method(sel_getUid("_didChange"),function(_53,_54){
with(_53){
objj_msgSend(_53,"_updateScrollbar");
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("textViewDidChange:"))){
objj_msgSend(delegate,"textViewDidChange:",_53);
}
}
}),new objj_method(sel_getUid("_didBeginEditing"),function(_55,_56){
with(_55){
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("textViewDidBeginEditing:"))){
objj_msgSend(delegate,"textViewDidBeginEditing:",_55);
}
}
}),new objj_method(sel_getUid("_didEndEditing"),function(_57,_58){
with(_57){
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("textViewDidEndEditing:"))){
objj_msgSend(delegate,"textViewDidEndEditing:",_57);
}
}
}),new objj_method(sel_getUid("_cursorDidMove"),function(_59,_5a){
with(_59){
if(!objj_msgSend(_59,"DOMWindow")){
return;
}
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("textViewCursorDidMove:"))){
objj_msgSend(delegate,"textViewCursorDidMove:",_59);
}
}
}),new objj_method(sel_getUid("_resizeWebFrame"),function(_5b,_5c){
with(_5b){
if(editor&&editor.getElement()){
editor.getElement().style.minHeight=(CGRectGetHeight(objj_msgSend(_5b,"bounds"))-(2+WKTextViewInnerPadding*2))+"px";
}
objj_msgSend(_5b,"_updateScrollbar");
}
}),new objj_method(sel_getUid("_loadMainFrameURL"),function(_5d,_5e){
with(_5d){
objj_msgSend(_5d,"_startedLoading");
_ignoreLoadStart=YES;
_ignoreLoadEnd=NO;
_url=_mainFrameURL;
_html=null;
objj_msgSend(_5d,"_load");
}
}),new objj_method(sel_getUid("_addKeypressHandler:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_5f,"editor")){
var doc=objj_msgSend(_5f,"DOMWindow").document;
if(doc.addEventListener){
doc.addEventListener("keypress",_61,true);
}else{
if(doc.attachEvent){
doc.attachEvent("onkeypress",function(){
_61(objj_msgSend(_5f,"editor").event);
});
}
}
}
}
}),new objj_method(sel_getUid("htmlValue"),function(_62,_63){
with(_62){
if(!objj_msgSend(_62,"editor")){
return _html;
}
return objj_msgSend(_62,"editor").getCleanContents();
}
}),new objj_method(sel_getUid("setHtmlValue:"),function(_64,_65,_66){
with(_64){
if(objj_msgSend(_64,"editor")!=nil){
editor.setHtml(false,_66,false,false);
}else{
_html=_66;
}
_cursorPlaced=NO;
objj_msgSend(_64,"_didChange");
}
}),new objj_method(sel_getUid("_didPerformAction"),function(_67,_68){
with(_67){
if(shouldFocusAfterAction&&!suppressAutoFocus){
objj_msgSend(_67,"DOMWindow").focus();
editor.focus();
}
}
}),new objj_method(sel_getUid("clearText:"),function(_69,_6a,_6b){
with(_69){
objj_msgSend(_69,"setHtmlValue:","");
objj_msgSend(_69,"_didChange");
objj_msgSend(_69,"_didPerformAction");
}
}),new objj_method(sel_getUid("insertHtml:"),function(_6c,_6d,_6e){
with(_6c){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"not available with google-closure editor yet");
}
}),new objj_method(sel_getUid("boldSelection:"),function(_6f,_70,_71){
with(_6f){
editor.execCommand(editor.Command.BOLD,null);
objj_msgSend(_6f,"_didPerformAction");
}
}),new objj_method(sel_getUid("underlineSelection:"),function(_72,_73,_74){
with(_72){
editor.execCommand(editor.Command.UNDERLINE,null);
objj_msgSend(_72,"_didPerformAction");
}
}),new objj_method(sel_getUid("italicSelection:"),function(_75,_76,_77){
with(_75){
editor.execCommand(editor.Command.ITALIC,null);
objj_msgSend(_75,"_didPerformAction");
}
}),new objj_method(sel_getUid("strikethroughSelection:"),function(_78,_79,_7a){
with(_78){
editor.execCommand(editor.Command.STRIKE_THROUGH,null);
objj_msgSend(_78,"_didPerformAction");
}
}),new objj_method(sel_getUid("alignSelectionLeft:"),function(_7b,_7c,_7d){
with(_7b){
editor.execCommand(editor.Command.JUSTIFY_LEFT,null);
objj_msgSend(_7b,"_didPerformAction");
}
}),new objj_method(sel_getUid("alignSelectionRight:"),function(_7e,_7f,_80){
with(_7e){
editor.execCommand(editor.Command.JUSTIFY_RIGHT,null);
objj_msgSend(_7e,"_didPerformAction");
}
}),new objj_method(sel_getUid("alignSelectionCenter:"),function(_81,_82,_83){
with(_81){
editor.execCommand(editor.Command.JUSTIFY_CENTER,null);
objj_msgSend(_81,"_didPerformAction");
}
}),new objj_method(sel_getUid("alignSelectionFull:"),function(_84,_85,_86){
with(_84){
editor.execCommand(editor.Command.JUSTIFY_FULL,null);
objj_msgSend(_84,"_didPerformAction");
}
}),new objj_method(sel_getUid("linkSelection:"),function(_87,_88,_89){
with(_87){
editor.execCommand(editor.Command.LINK,"http://www.wireload.net");
objj_msgSend(_87,"_didPerformAction");
}
}),new objj_method(sel_getUid("linkSelectionToURL:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=editor.getAppWindow(),_8e=_8d["prompt"];
_8d["prompt"]=function(){
return _8c;
};
editor.execCommand(editor.Command.LINK,null);
_8d["prompt"]=_8e;
objj_msgSend(_8a,"_didPerformAction");
}
}),new objj_method(sel_getUid("unlinkSelection:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"linkSelectionToURL:",nil);
}
}),new objj_method(sel_getUid("insertOrderedList:"),function(_92,_93,_94){
with(_92){
editor.execCommand(editor.Command.ORDERED_LIST,null);
objj_msgSend(_92,"_didPerformAction");
}
}),new objj_method(sel_getUid("insertUnorderedList:"),function(_95,_96,_97){
with(_95){
editor.execCommand(editor.Command.UNORDERED_LIST,null);
objj_msgSend(_95,"_didPerformAction");
}
}),new objj_method(sel_getUid("insertImage:"),function(_98,_99,_9a){
with(_98){
}
}),new objj_method(sel_getUid("insertImageWithURL:"),function(_9b,_9c,_9d){
with(_9b){
editor.execCommand(editor.Command.IMAGE,_9d);
objj_msgSend(_9b,"_didPerformAction");
}
}),new objj_method(sel_getUid("setFontNameForSelection:"),function(_9e,_9f,_a0){
with(_9e){
lastFont=_a0;
editor.execCommand(editor.Command.FONT_FACE,_a0);
objj_msgSend(_9e,"_didPerformAction");
}
}),new objj_method(sel_getUid("fontSizeRaw"),function(_a1,_a2){
with(_a1){
try{
return editor.queryCommandValue(editor.Command.FONT_SIZE);
}
catch(e){
return "16px";
}
}
}),new objj_method(sel_getUid("fontSize"),function(_a3,_a4){
with(_a3){
var _a5=parseInt(objj_msgSend(_a3,"fontSizeRaw")),_a6={10:1,13:2,16:3,18:4,24:5,32:6,48:7};
if(_a5<=7){
return _a5;
}else{
if(_a5 in _a6){
return _a6[_a5];
}else{
return 3;
}
}
}
}),new objj_method(sel_getUid("setFontSizeForSelection:"),function(_a7,_a8,_a9){
with(_a7){
editor.execCommand(editor.Command.FONT_SIZE,_a9);
objj_msgSend(_a7,"_didPerformAction");
}
}),new objj_method(sel_getUid("font"),function(_aa,_ab){
with(_aa){
try{
var _ac=editor.queryCommandValue(editor.Command.FONT_FACE);
}
catch(e){
return lastFont;
}
var _ad=/'(.*?)'/,r=_ac?_ac.match(new RegExp(_ad)):nil;
if(r&&r.length==2){
lastFont=r[1];
}else{
if(_ac){
lastFont=_ac;
}
}
return lastFont;
}
}),new objj_method(sel_getUid("color"),function(_ae,_af){
with(_ae){
var _b0;
try{
_b0=editor.queryCommandValue(editor.Command.FONT_COLOR);
}
catch(e){
CPLog.warning(e);
}
if(!_b0||_b0==lastColorString){
return lastColor;
}
lastColor=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithCSSString:",_b0);
lastColorString=_b0;
return lastColor;
}
}),new objj_method(sel_getUid("setColorForSelection:"),function(_b1,_b2,_b3){
with(_b1){
editor.execCommand(editor.Command.FONT_COLOR,objj_msgSend(_b3,"hexString"));
objj_msgSend(_b1,"_didPerformAction");
}
})]);
e;