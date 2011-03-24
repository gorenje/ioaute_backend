@STATIC;1.0;p;9;TNAlert.jt;4148;@STATIC;1.0;t;4129;
var _1=objj_allocateClassPair(CPObject,"TNAlert"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_alert"),new objj_ivar("_helpAction"),new objj_ivar("_helpTarget"),new objj_ivar("_actions"),new objj_ivar("_target"),new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("alert"),function(_3,_4){
with(_3){
return _alert;
}
}),new objj_method(sel_getUid("_setAlert:"),function(_5,_6,_7){
with(_5){
_alert=_7;
}
}),new objj_method(sel_getUid("helpAction"),function(_8,_9){
with(_8){
return _helpAction;
}
}),new objj_method(sel_getUid("_setHelpAction:"),function(_a,_b,_c){
with(_a){
_helpAction=_c;
}
}),new objj_method(sel_getUid("helpTarget"),function(_d,_e){
with(_d){
return _helpTarget;
}
}),new objj_method(sel_getUid("_setHelpTarget:"),function(_f,_10,_11){
with(_f){
_helpTarget=_11;
}
}),new objj_method(sel_getUid("actions"),function(_12,_13){
with(_12){
return _actions;
}
}),new objj_method(sel_getUid("_setActions:"),function(_14,_15,_16){
with(_14){
_actions=_16;
}
}),new objj_method(sel_getUid("target"),function(_17,_18){
with(_17){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_19,_1a,_1b){
with(_19){
_target=_1b;
}
}),new objj_method(sel_getUid("userInfo"),function(_1c,_1d){
with(_1c){
return _userInfo;
}
}),new objj_method(sel_getUid("setUserInfo:"),function(_1e,_1f,_20){
with(_1e){
_userInfo=_20;
}
}),new objj_method(sel_getUid("initWithMessage:informative:target:actions:"),function(_21,_22,_23,_24,_25,_26){
with(_21){
if(_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("TNAlert").super_class},"init")){
_alert=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
_actions=_26;
_target=_25;
objj_msgSend(_alert,"setMessageText:",_23);
objj_msgSend(_alert,"setInformativeText:",_24);
objj_msgSend(_alert,"setDelegate:",_21);
objj_msgSend(_alert,"setAlertStyle:",CPInformationalAlertStyle);
for(var i=0;i<objj_msgSend(_actions,"count");i++){
objj_msgSend(_alert,"addButtonWithTitle:",objj_msgSend(objj_msgSend(_actions,"objectAtIndex:",i),"objectAtIndex:",0));
}
}
return _21;
}
}),new objj_method(sel_getUid("setHelpTarget:action:"),function(_27,_28,_29,_2a){
with(_27){
if(_29&&_2a){
_helpTarget=_29;
_helpAction=_2a;
objj_msgSend(_alert,"setShowsHelp:",YES);
}else{
_helpTarget=nil;
_helpAction=nil;
objj_msgSend(_alert,"setShowsHelp:",NO);
}
}
}),new objj_method(sel_getUid("setAlertStyle:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_alert,"setAlertStyle:",_2d);
}
}),new objj_method(sel_getUid("runModal"),function(_2e,_2f){
with(_2e){
objj_msgSend(_alert,"runModal");
}
}),new objj_method(sel_getUid("beginSheetModalForWindow:"),function(_30,_31,_32){
with(_30){
objj_msgSend(_alert,"beginSheetModalForWindow:",_32);
}
}),new objj_method(sel_getUid("alertDidEnd:returnCode:"),function(_33,_34,_35,_36){
with(_33){
var _37=objj_msgSend(objj_msgSend(_actions,"objectAtIndex:",_36),"objectAtIndex:",1);
if(objj_msgSend(_target,"respondsToSelector:",_37)){
objj_msgSend(_target,"performSelector:withObject:",_37,_userInfo);
}
}
}),new objj_method(sel_getUid("alertShowHelp:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_helpTarget,"respondsToSelector:",_helpAction)){
objj_msgSend(_helpTarget,"performSelector:withObject:",_helpAction,_3a);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("showAlertWithMessage:informative:"),function(_3b,_3c,_3d,_3e){
with(_3b){
var _3f=objj_msgSend(objj_msgSend(TNAlert,"alloc"),"initWithMessage:informative:target:actions:",_3d,_3e,nil,[["Ok",nil]]);
objj_msgSend(_3f,"runModal");
}
}),new objj_method(sel_getUid("showAlertWithMessage:informative:style:"),function(_40,_41,_42,_43,_44){
with(_40){
var _45=objj_msgSend(objj_msgSend(TNAlert,"alloc"),"initWithMessage:informative:target:actions:",_42,_43,nil,[["Ok",nil]]);
objj_msgSend(_45,"setAlertStyle:",_44);
objj_msgSend(_45,"runModal");
}
}),new objj_method(sel_getUid("alertWithMessage:informative:target:actions:"),function(_46,_47,_48,_49,_4a,_4b){
with(_46){
var _4c=objj_msgSend(objj_msgSend(TNAlert,"alloc"),"initWithMessage:informative:target:actions:",_48,_49,_4a,_4b);
return _4c;
}
})]);
p;13;TNAnimation.jt;445;@STATIC;1.0;I;23;Foundation/Foundation.jt;399;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=objj_allocateClassPair(CPAnimation,"TNAnimation"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setCurrentProgress:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("TNAnimation").super_class},"setCurrentProgress:",_5);
objj_msgSend(_3,"currentValue");
}
})]);
p;18;TNAttachedWindow.jt;13658;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;13590;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
TNAttachedWindowGravityUp=0;
TNAttachedWindowGravityDown=1;
TNAttachedWindowGravityLeft=2;
TNAttachedWindowGravityRight=3;
TNAttachedWindowGravityAuto=4;
CPClosableOnBlurWindowMask=1<<4;
TNAttachedWhiteWindowMask=1<<25;
TNAttachedBlackWindowMask=1<<26;
var _1=objj_allocateClassPair(CPWindow,"TNAttachedWindow"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_targetView"),new objj_ivar("_isClosed"),new objj_ivar("_closeOnBlur"),new objj_ivar("_closeButton")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("targetView"),function(_3,_4){
with(_3){
return _targetView;
}
}),new objj_method(sel_getUid("setTargetView:"),function(_5,_6,_7){
with(_5){
_targetView=_7;
}
}),new objj_method(sel_getUid("initWithContentRect:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSend(_8,"initWithContentRect:styleMask:",_a,TNAttachedWhiteWindowMask);
return _8;
}
}),new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_b,_c,_d,_e){
with(_b){
if(_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("TNAttachedWindow").super_class},"initWithContentRect:styleMask:",_d,_e)){
_isClosed=NO;
if(_e&TNAttachedWhiteWindowMask){
themeColor="White";
}else{
if(_e&TNAttachedBlackWindowMask){
themeColor="Black";
}
}
var _f=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_b,"class")),_10=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f,"pathForResource:","TNAttachedWindow/"+themeColor+"/attached-window-button-close.png"),CPSizeMake(15,15)),_11=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f,"pathForResource:","TNAttachedWindow/"+themeColor+"/attached-window-button-close-pressed.png"),CPSizeMake(15,15));
if(_e&CPClosableWindowMask){
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CPRectMake(5,5,14,14));
objj_msgSend(_closeButton,"setImageScaling:",CPScaleProportionally);
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_10);
objj_msgSend(_closeButton,"setValue:forThemeAttribute:",_10,"image");
objj_msgSend(_closeButton,"setValue:forThemeAttribute:inState:",_11,"image",CPThemeStateHighlighted);
objj_msgSend(_closeButton,"setTarget:",_b);
objj_msgSend(_closeButton,"setAction:",sel_getUid("close:"));
objj_msgSend(objj_msgSend(_b,"contentView"),"addSubview:",_closeButton);
}
_closeOnBlur=(_e&CPClosableOnBlurWindowMask);
objj_msgSend(_b,"setLevel:",CPStatusWindowLevel);
objj_msgSend(_b,"setMovableByWindowBackground:",YES);
objj_msgSend(_b,"setHasShadow:",NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_b,sel_getUid("_attachedWindowDidMove:"),CPWindowDidMoveNotification,_b);
}
return _b;
}
}),new objj_method(sel_getUid("resignMainWindow"),function(_12,_13){
with(_12){
if(_closeOnBlur&&!_isClosed){
_isClosed=YES;
objj_msgSend(_12,"close");
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("didAttachedWindowClose:"))){
objj_msgSend(_delegate,"didAttachedWindowClose:",_12);
}
}
}
}),new objj_method(sel_getUid("computeOrigin:gravity:"),function(_14,_15,_16,_17){
with(_14){
var _18=objj_msgSend(_16,"frame"),_19=_16,_1a=objj_msgSend(_16,"frameOrigin"),_1b=objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"mainWindow"),"platformWindow"),"nativeContentRect"),_1c;
while(_19=objj_msgSend(_19,"superview")){
_1a.x+=objj_msgSend(_19,"frameOrigin").x;
_1a.y+=objj_msgSend(_19,"frameOrigin").y;
_1c=_19;
}
_1a.x+=objj_msgSend(objj_msgSend(_1c,"window"),"frame").origin.x;
_1a.y+=objj_msgSend(objj_msgSend(_1c,"window"),"frame").origin.y;
if(objj_msgSend(_16,"enclosingScrollView")){
var _1d=objj_msgSend(objj_msgSend(objj_msgSend(_16,"enclosingScrollView"),"contentView"),"boundsOrigin");
_1a.x-=_1d.x;
_1a.y-=_1d.y;
}
var _1e=CPPointCreateCopy(_1a),_1f=CPPointCreateCopy(_1a),_20=CPPointCreateCopy(_1a),_21=CPPointCreateCopy(_1a);
_1f.x+=CPRectGetWidth(_18);
_1f.y+=(CPRectGetHeight(_18)/2)-(CPRectGetHeight(objj_msgSend(_14,"frame"))/2);
_1e.x-=CPRectGetWidth(objj_msgSend(_14,"frame"));
_1e.y+=(CPRectGetHeight(_18)/2)-(CPRectGetHeight(objj_msgSend(_14,"frame"))/2);
_21.x+=CPRectGetWidth(_18)/2-CPRectGetWidth(objj_msgSend(_14,"frame"))/2;
_21.y+=CPRectGetHeight(_18);
_20.x+=CPRectGetWidth(_18)/2-CPRectGetWidth(objj_msgSend(_14,"frame"))/2;
_20.y-=CPRectGetHeight(objj_msgSend(_14,"frame"));
if(_17===TNAttachedWindowGravityAuto){
var _22=CPRectCreateCopy(objj_msgSend(_14,"frame"));
_1b.origin.x=0;
_1b.origin.y=0;
var _23=[_1f,_1e,_20,_21];
_17=TNAttachedWindowGravityRight;
for(var i=0;i<_23.length;i++){
_22.origin=_23[i];
if(CPRectContainsRect(_1b,_22)){
if(CPPointEqualToPoint(_23[i],_1f)){
_17=TNAttachedWindowGravityRight;
break;
}else{
if(CPPointEqualToPoint(_23[i],_1e)){
_17=TNAttachedWindowGravityLeft;
break;
}else{
if(CPPointEqualToPoint(_23[i],_20)){
_17=TNAttachedWindowGravityUp;
break;
}else{
if(CPPointEqualToPoint(_23[i],_21)){
_17=TNAttachedWindowGravityDown;
break;
}
}
}
}
}
}
}
var _24;
switch(_17){
case TNAttachedWindowGravityRight:
_24=_1f;
break;
case TNAttachedWindowGravityLeft:
_24=_1e;
break;
case TNAttachedWindowGravityDown:
_24=_21;
break;
case TNAttachedWindowGravityUp:
_24=_20;
break;
}
objj_msgSend(_windowView,"setGravity:",_17);
var o=_24;
if(o.x<0){
objj_msgSend(_windowView,"setGravity:",nil);
o.x=0;
}
if(o.x+CPRectGetWidth(objj_msgSend(_14,"frame"))>_1b.size.width){
objj_msgSend(_windowView,"setGravity:",nil);
o.x=_1b.size.width-CPRectGetWidth(objj_msgSend(_14,"frame"));
}
if(o.y<0){
objj_msgSend(_windowView,"setGravity:",nil);
o.y=0;
}
if(o.y+CPRectGetHeight(objj_msgSend(_14,"frame"))>_1b.size.height){
objj_msgSend(_windowView,"setGravity:",nil);
o.y=_1b.size.height-CPRectGetHeight(objj_msgSend(_14,"frame"));
}
return _24;
}
}),new objj_method(sel_getUid("_attachedWindowDidMove:"),function(_25,_26,_27){
with(_25){
if(_leftMouseDownView){
objj_msgSend(objj_msgSend(_windowView,"cursorView"),"setHidden:",YES);
objj_msgSend(_25,"setLevel:",CPNormalWindowLevel);
}
}
}),new objj_method(sel_getUid("positionRelativeToView:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_28,"positionRelativeToView:gravity:",_2a,TNAttachedWindowGravityAuto);
}
}),new objj_method(sel_getUid("positionRelativeToView:gravity:"),function(_2b,_2c,_2d,_2e){
with(_2b){
var _2f=objj_msgSend(_2d,"frame"),_30=_2f.origin.x+CPRectGetWidth(_2f),_31=_2f.origin.y+(CPRectGetHeight(_2f)/2)-(CPRectGetHeight(objj_msgSend(_2b,"frame"))/2),_32=objj_msgSend(_2b,"computeOrigin:gravity:",_2d,_2e),_33=0;
if(_32.y<0){
_33=_32.y;
_32.y=0;
var _34=objj_msgSend(objj_msgSend(_windowView,"cursorView"),"frameOrigin");
_34.y+=_33;
objj_msgSend(objj_msgSend(_windowView,"cursorView"),"setFrameOrigin:",_34);
}
objj_msgSend(_2b,"setFrameOrigin:",_32);
objj_msgSend(_2b,"makeKeyAndOrderFront:",nil);
}
}),new objj_method(sel_getUid("attachToView:"),function(_35,_36,_37){
with(_35){
_targetView=_37;
objj_msgSend(_35,"positionRelativeToView:",_targetView);
objj_msgSend(_targetView,"addObserver:forKeyPath:options:context:",_35,"window.frame",nil,nil);
}
}),new objj_method(sel_getUid("close:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(_38,"close");
objj_msgSend(_targetView,"removeObserver:forKeyPath:",_38,"window.frame");
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("didAttachedWindowClose:"))){
objj_msgSend(_delegate,"didAttachedWindowClose:",_38);
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_3b,_3c,_3d,_3e,_3f,_40){
with(_3b){
if(objj_msgSend(_3d,"isEqual:","window.frame")){
objj_msgSend(_3b,"positionRelativeToView:",_targetView);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(_41,_42,_43){
with(_41){
return _CPAttachedWindowView;
}
}),new objj_method(sel_getUid("attachedWindowWithSize:forView:"),function(_44,_45,_46,_47){
with(_44){
var _48=objj_msgSend(objj_msgSend(TNAttachedWindow,"alloc"),"initWithContentRect:",CPRectMake(0,0,_46.width,_46.height));
objj_msgSend(_48,"attachToView:",_47);
return _48;
}
})]);
var _1=objj_allocateClassPair(_CPWindowView,"_CPAttachedWindowView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_cursorBackgroundBottom"),new objj_ivar("_cursorBackgroundLeft"),new objj_ivar("_cursorBackgroundRight"),new objj_ivar("_cursorBackgroundTop"),new objj_ivar("_cursorView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("cursorView"),function(_49,_4a){
with(_49){
return _cursorView;
}
}),new objj_method(sel_getUid("setCursorView:"),function(_4b,_4c,_4d){
with(_4b){
_cursorView=_4d;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_4e,_4f,_50,_51){
with(_4e){
_4e=objj_msgSendSuper({receiver:_4e,super_class:objj_getClass("_CPAttachedWindowView").super_class},"initWithFrame:styleMask:",_50,_51);
if(_4e){
var _52=objj_msgSend(_4e,"bounds"),_53="White";
if(_styleMask&TNAttachedWhiteWindowMask){
_53="White";
}else{
if(_styleMask&TNAttachedBlackWindowMask){
_53="Black";
}
}
var _54=objj_msgSend(CPBundle,"bundleForClass:",TNAttachedWindow);
_cursorBackgroundLeft=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-arrow-left.png"));
_cursorBackgroundRight=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-arrow-right.png"));
_cursorBackgroundTop=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-arrow-top.png"));
_cursorBackgroundBottom=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-arrow-bottom.png"));
_cursorView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CPRectMakeZero());
var _55=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-top-left.png"),CPSizeMake(20,20)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-top.png"),CPSizeMake(1,20)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-top-right.png"),CPSizeMake(20,20)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-left.png"),CPSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-center.png"),CPSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-right.png"),CPSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-bottom-left.png"),CPSizeMake(20,20)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-bottom.png"),CPSizeMake(1,20)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_54,"pathForResource:","TNAttachedWindow/"+_53+"/attached-window-bottom-right.png"),CPSizeMake(20,20))]));
objj_msgSend(_4e,"setBackgroundColor:",_55);
objj_msgSend(_4e,"addSubview:",_cursorView);
}
return _4e;
}
}),new objj_method(sel_getUid("setGravity:"),function(_56,_57,_58){
with(_56){
switch(_58){
case TNAttachedWindowGravityRight:
objj_msgSend(_cursorView,"setFrame:",CPRectMake(2,CPRectGetHeight(objj_msgSend(_56,"frame"))/2-12,10,20));
objj_msgSend(_cursorView,"setImage:",_cursorBackgroundLeft);
objj_msgSend(_cursorView,"setHidden:",NO);
break;
case TNAttachedWindowGravityLeft:
objj_msgSend(_cursorView,"setFrame:",CPRectMake(CPRectGetWidth(objj_msgSend(_56,"frame"))-11,CPRectGetHeight(objj_msgSend(_56,"frame"))/2-12,10,20));
objj_msgSend(_cursorView,"setImage:",_cursorBackgroundRight);
objj_msgSend(_cursorView,"setHidden:",NO);
break;
case TNAttachedWindowGravityDown:
objj_msgSend(_cursorView,"setFrame:",CPRectMake(CPRectGetWidth(objj_msgSend(_56,"frame"))/2-10,2,20,10));
objj_msgSend(_cursorView,"setImage:",_cursorBackgroundTop);
objj_msgSend(_cursorView,"setHidden:",NO);
break;
case TNAttachedWindowGravityUp:
objj_msgSend(_cursorView,"setFrame:",CPRectMake(CPRectGetWidth(objj_msgSend(_56,"frame"))/2-10,CPRectGetHeight(objj_msgSend(_56,"frame"))-14,20,10));
objj_msgSend(_cursorView,"setImage:",_cursorBackgroundBottom);
objj_msgSend(_cursorView,"setHidden:",NO);
break;
default:
objj_msgSend(_cursorView,"setHidden:",YES);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_59,_5a,_5b){
with(_59){
var _5c=CGRectMakeCopy(_5b);
_5c.origin.x+=13;
_5c.origin.y+=12;
_5c.size.width-=25;
_5c.size.height-=27;
return _5c;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_5d,_5e,_5f){
with(_5d){
var _60=CGRectMakeCopy(_5f);
_60.origin.x-=13;
_60.origin.y-=12;
_60.size.width+=25;
_60.size.height+=27;
return _60;
}
})]);
p;14;TNCategories.jt;2079;@STATIC;1.0;I;15;AppKit/AppKit.ji;11;TNToolTip.jt;2024;
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("TNToolTip.j",YES);
var _1,_2;
var _3=objj_getClass("CPControl");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPControl\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("setToolTip:"),function(_5,_6,_7){
with(_5){
if(_toolTip==_7){
return;
}
_toolTip=_7;
if(!_DOMElement){
return;
}
var _8=function(e){
objj_msgSend(_5,"fireToolTip");
};
fOut=function(e){
objj_msgSend(_5,"invalidateToolTip");
};
if(_toolTip){
if(_DOMElement.addEventListener){
_DOMElement.addEventListener("mouseover",_8,NO);
_DOMElement.addEventListener("keypress",fOut,NO);
_DOMElement.addEventListener("mouseout",fOut,NO);
}else{
if(_DOMElement.attachEvent){
_DOMElement.attachEvent("onmouseover",_8);
_DOMElement.attachEvent("onkeypress",fOut);
_DOMElement.attachEvent("onmouseout",fOut);
}
}
}else{
if(_DOMElement.removeEventListener){
_DOMElement.removeEventListener("mouseover",_8,NO);
_DOMElement.removeEventListener("keypress",fOut,NO);
_DOMElement.removeEventListener("mouseout",fOut,NO);
}else{
if(_DOMElement.detachEvent){
_DOMElement.detachEvent("onmouseover",_8);
_DOMElement.detachEvent("onkeypress",fOut);
_DOMElement.detachEvent("onmouseout",fOut);
}
}
}
}
}),new objj_method(sel_getUid("toolTip"),function(_9,_a){
with(_9){
return _toolTip;
}
}),new objj_method(sel_getUid("fireToolTip"),function(_b,_c){
with(_b){
if(_2){
objj_msgSend(_2,"invalidate");
if(_1){
objj_msgSend(_1,"close:",nil);
}
_1=nil;
}
if(_toolTip){
_2=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",2,_b,sel_getUid("showToolTip:"),nil,NO);
}
}
}),new objj_method(sel_getUid("invalidateToolTip"),function(_d,_e){
with(_d){
if(_2){
objj_msgSend(_2,"invalidate");
_2=nil;
}
if(_1){
objj_msgSend(_1,"close:",nil);
_1=nil;
}
}
}),new objj_method(sel_getUid("showToolTip:"),function(_f,_10,_11){
with(_f){
if(_1){
objj_msgSend(_1,"close:",nil);
}
_1=objj_msgSend(TNToolTip,"toolTipWithString:forView:",_toolTip,_f);
}
})]);
p;7;TNKit.jt;660;@STATIC;1.0;i;9;TNAlert.ji;13;TNAnimation.ji;18;TNAttachedWindow.ji;14;TNCategories.ji;22;TNLocalizationCenter.ji;25;TNOutlineViewDataSource.ji;23;TNTableViewDataSource.ji;20;TNTextFieldStepper.ji;11;TNToolbar.ji;11;TNToolTip.jt;427;
objj_executeFile("TNAlert.j",YES);
objj_executeFile("TNAnimation.j",YES);
objj_executeFile("TNAttachedWindow.j",YES);
objj_executeFile("TNCategories.j",YES);
objj_executeFile("TNLocalizationCenter.j",YES);
objj_executeFile("TNOutlineViewDataSource.j",YES);
objj_executeFile("TNTableViewDataSource.j",YES);
objj_executeFile("TNTextFieldStepper.j",YES);
objj_executeFile("TNToolbar.j",YES);
objj_executeFile("TNToolTip.j",YES);
p;22;TNLocalizationCenter.jt;2408;@STATIC;1.0;I;15;AppKit/AppKit.jt;2369;
objj_executeFile("AppKit/AppKit.j",NO);
TNLocalizationCenterGeneralLocaleDomain="TNLocalizationCenterGeneralLocaleDomain";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"TNLocalizationCenter"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_currentLanguage"),new objj_ivar("_locales"),new objj_ivar("_defaultLanguage")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("currentLanguage"),function(_4,_5){
with(_4){
return _currentLanguage;
}
}),new objj_method(sel_getUid("setCurrentLanguage:"),function(_6,_7,_8){
with(_6){
_currentLanguage=_8;
}
}),new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
if(_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("TNLocalizationCenter").super_class},"init")){
_defaultLanguage="en-us";
_currentLanguage=objj_msgSend(TNLocalizationCenter,"navigatorLocale");
_locales=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_9,"setLocale:forDomain:",GENERAL_LANGUAGE_REGISTRY,TNLocalizationCenterGeneralLocaleDomain);
}
return _9;
}
}),new objj_method(sel_getUid("setLocale:forDomain:"),function(_b,_c,_d,_e){
with(_b){
if(objj_msgSend(_locales,"objectForKey:",TNLocalizationCenterGeneralLocaleDomain)&&(_e==TNLocalizationCenterGeneralLocaleDomain)){
return;
}
objj_msgSend(_locales,"setObject:forKey:",_d,_e);
}
}),new objj_method(sel_getUid("localize:forDomain:"),function(_f,_10,_11,_12){
with(_f){
if(!objj_msgSend(_locales,"objectForKey:",_12)||!objj_msgSend(_locales,"objectForKey:",_12)[_11]){
return (_12==TNLocalizationCenterGeneralLocaleDomain)?_11:objj_msgSend(_f,"localize:forDomain:",_11,TNLocalizationCenterGeneralLocaleDomain);
}
return objj_msgSend(_locales,"objectForKey:",_12)[_11][_currentLanguage]||objj_msgSend(_locales,"objectForKey:",_12)[_11][_defaultLanguage];
}
}),new objj_method(sel_getUid("localize:"),function(_13,_14,_15){
with(_13){
return objj_msgSend(_13,"localize:forDomain:",_15,TNLocalizationCenterGeneralLocaleDomain);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultCenter"),function(_16,_17){
with(_16){
if(!_1){
_1=objj_msgSend(objj_msgSend(TNLocalizationCenter,"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("navigatorLocale"),function(_18,_19){
with(_18){
if(!navigator){
return "en-us";
}
return navigator.language||navigator.browserLanguage||navigator.systemLanguage||navigator.userLanguage;
}
})]);
p;25;TNOutlineViewDataSource.jt;4537;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;4470;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
var _1=objj_allocateClassPair(CPObject,"TNOutlineViewDataSource"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("filterInstalled"),new objj_ivar("_contents"),new objj_ivar("_searchableKeyPaths"),new objj_ivar("_childCompKeyPath"),new objj_ivar("_parentKeyPath")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isFilterInstalled"),function(_3,_4){
with(_3){
return filterInstalled;
}
}),new objj_method(sel_getUid("setFilterInstalled:"),function(_5,_6,_7){
with(_5){
filterInstalled=_7;
}
}),new objj_method(sel_getUid("contents"),function(_8,_9){
with(_8){
return _contents;
}
}),new objj_method(sel_getUid("setContents:"),function(_a,_b,_c){
with(_a){
_contents=_c;
}
}),new objj_method(sel_getUid("searchableKeyPaths"),function(_d,_e){
with(_d){
return _searchableKeyPaths;
}
}),new objj_method(sel_getUid("setSearchableKeyPaths:"),function(_f,_10,_11){
with(_f){
_searchableKeyPaths=_11;
}
}),new objj_method(sel_getUid("childCompKeyPath"),function(_12,_13){
with(_12){
return _childCompKeyPath;
}
}),new objj_method(sel_getUid("setChildCompKeyPath:"),function(_14,_15,_16){
with(_14){
_childCompKeyPath=_16;
}
}),new objj_method(sel_getUid("parentKeyPath"),function(_17,_18){
with(_17){
return _parentKeyPath;
}
}),new objj_method(sel_getUid("setParentKeyPath:"),function(_19,_1a,_1b){
with(_19){
_parentKeyPath=_1b;
}
}),new objj_method(sel_getUid("init"),function(_1c,_1d){
with(_1c){
if(_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("TNOutlineViewDataSource").super_class},"init")){
alert("you should not use TNOutlineViewDataSource. it doesn't work very well for now");
_contents=objj_msgSend(CPArray,"array");
}
return _1c;
}
}),new objj_method(sel_getUid("count"),function(_1e,_1f){
with(_1e){
return objj_msgSend(_contents,"count");
}
}),new objj_method(sel_getUid("objects"),function(_20,_21){
with(_20){
return _contents;
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_22,_23,_24){
with(_22){
return objj_msgSend(_contents,"objectAtIndex:",_24);
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_contents,"objectsAtIndexes:",_27);
}
}),new objj_method(sel_getUid("getRootObjects"),function(_28,_29){
with(_28){
var _2a=objj_msgSend(CPArray,"array");
for(var i=0;i<objj_msgSend(_contents,"count");i++){
var _2b=objj_msgSend(_contents,"objectAtIndex:",i);
if(objj_msgSend(_2b,"valueForKeyPath:",_parentKeyPath)==nil){
objj_msgSend(_2a,"addObject:",_2b);
}
}
return _2a;
}
}),new objj_method(sel_getUid("getChildrenOfObject:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(CPArray,"array");
for(var i=0;i<objj_msgSend(_contents,"count");i++){
var _30=objj_msgSend(_contents,"objectAtIndex:",i);
if(objj_msgSend(_30,"valueForKey:",_parentKeyPath)==objj_msgSend(_2e,"valueForKey:",_childCompKeyPath)){
objj_msgSend(_2f,"addObject:",_30);
}
}
return _2f;
}
}),new objj_method(sel_getUid("addObject:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_contents,"addObject:",_33);
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_34,_35){
with(_34){
objj_msgSend(_contents,"removeAllObjects");
}
}),new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"),function(_36,_37,_38,_39){
with(_36){
if(!_39){
return objj_msgSend(objj_msgSend(_36,"getRootObjects"),"count");
}else{
return objj_msgSend(objj_msgSend(_36,"getChildrenOfObject:",_39),"count");
}
}
}),new objj_method(sel_getUid("outlineView:isItemExpandable:"),function(_3a,_3b,_3c,_3d){
with(_3a){
if(!_3d){
return YES;
}
return (objj_msgSend(objj_msgSend(_3a,"getChildrenOfObject:",_3d),"count")>0)?YES:NO;
}
}),new objj_method(sel_getUid("outlineView:child:ofItem:"),function(_3e,_3f,_40,_41,_42){
with(_3e){
if(!_42){
return objj_msgSend(objj_msgSend(_3e,"getRootObjects"),"objectAtIndex:",_41);
}else{
return objj_msgSend(objj_msgSend(_3e,"getChildrenOfObject:",_42),"objectAtIndex:",_41);
}
}
}),new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"),function(_43,_44,_45,_46,_47){
with(_43){
var _48=objj_msgSend(_46,"identifier");
if(_48=="outline"){
return nil;
}
return objj_msgSend(_47,"valueForKey:",_48);
}
}),new objj_method(sel_getUid("tableView:sortDescriptorsDidChange:"),function(_49,_4a,_4b,_4c){
with(_49){
objj_msgSend(_contents,"sortUsingDescriptors:",objj_msgSend(_4b,"sortDescriptors"));
objj_msgSend(_4b,"reloadData");
}
})]);
p;23;TNTableViewDataSource.jt;6292;@STATIC;1.0;t;6273;
var _1=objj_allocateClassPair(CPObject,"TNTableViewDataSource"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_content"),new objj_ivar("_searchableKeyPaths"),new objj_ivar("_table"),new objj_ivar("_filteredContent"),new objj_ivar("_searchField"),new objj_ivar("_filter"),new objj_ivar("_needsFilter")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_3,_4){
with(_3){
return _content;
}
}),new objj_method(sel_getUid("setContent:"),function(_5,_6,_7){
with(_5){
_content=_7;
}
}),new objj_method(sel_getUid("searchableKeyPaths"),function(_8,_9){
with(_8){
return _searchableKeyPaths;
}
}),new objj_method(sel_getUid("setSearchableKeyPaths:"),function(_a,_b,_c){
with(_a){
_searchableKeyPaths=_c;
}
}),new objj_method(sel_getUid("table"),function(_d,_e){
with(_d){
return _table;
}
}),new objj_method(sel_getUid("setTable:"),function(_f,_10,_11){
with(_f){
_table=_11;
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
if(_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("TNTableViewDataSource").super_class},"init")){
_content=objj_msgSend(CPArray,"array");
_filteredContent=objj_msgSend(CPArray,"array");
_searchableKeyPaths=objj_msgSend(CPArray,"array");
_filter="";
_needsFilter=NO;
}
return _12;
}
}),new objj_method(sel_getUid("filterObjects:"),function(_14,_15,_16){
with(_14){
if(!_searchField){
_searchField=_16;
}
_filteredContent=objj_msgSend(CPArray,"array");
_filter=objj_msgSend(objj_msgSend(_16,"stringValue"),"uppercaseString");
if(!(_filter)||(_filter=="")){
_filteredContent=objj_msgSend(_content,"copy");
objj_msgSend(_table,"reloadData");
return;
}
for(var i=0;i<objj_msgSend(_content,"count");i++){
var _17=objj_msgSend(_content,"objectAtIndex:",i);
for(var j=0;j<objj_msgSend(_searchableKeyPaths,"count");j++){
var _18=objj_msgSend(_17,"valueForKeyPath:",objj_msgSend(_searchableKeyPaths,"objectAtIndex:",j));
if(objj_msgSend(_18,"uppercaseString").indexOf(_filter)!=-1){
if(!objj_msgSend(_filteredContent,"containsObject:",_17)){
objj_msgSend(_filteredContent,"addObject:",_17);
}
}
}
}
objj_msgSend(_table,"reloadData");
}
}),new objj_method(sel_getUid("setContent:"),function(_19,_1a,_1b){
with(_19){
_content=objj_msgSend(_1b,"copy");
_filteredContent=objj_msgSend(_1b,"copy");
_needsFilter=YES;
}
}),new objj_method(sel_getUid("addObject:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_content,"addObject:",_1e);
objj_msgSend(_filteredContent,"addObject:",_1e);
_needsFilter=YES;
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_1f,_20,_21,_22){
with(_1f){
objj_msgSend(_content,"insertObject:atIndex:",_21,_22);
objj_msgSend(_filteredContent,"insertObject:atIndex:",_21,_22);
_needsFilter=YES;
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_23,_24,_25){
with(_23){
return objj_msgSend(_filteredContent,"objectAtIndex:",_25);
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_filteredContent,"objectsAtIndexes:",_28);
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_29,_2a,_2b){
with(_29){
var _2c=objj_msgSend(_filteredContent,"objectAtIndex:",_2b);
objj_msgSend(_filteredContent,"removeObjectAtIndex:",_2b);
objj_msgSend(_content,"removeObject:",_2c);
_needsFilter=YES;
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(_2d,_2e,_2f){
with(_2d){
try{
var _30=objj_msgSend(_filteredContent,"objectsAtIndexes:",_2f);
objj_msgSend(_filteredContent,"removeObjectsAtIndexes:",_2f);
objj_msgSend(_content,"removeObjectsInArray:",_30);
_needsFilter=YES;
}
catch(e){
CPLog.error(e);
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_content,"removeObject:",_33);
objj_msgSend(_filteredContent,"removeObject:",_33);
_needsFilter=YES;
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_34,_35){
with(_34){
objj_msgSend(_content,"removeAllObjects");
objj_msgSend(_filteredContent,"removeAllObjects");
_needsFilter=YES;
}
}),new objj_method(sel_getUid("removeLastObject"),function(_36,_37){
with(_36){
objj_msgSend(_content,"removeLastObject");
objj_msgSend(_filteredContent,"removeLastObject");
_needsFilter=YES;
}
}),new objj_method(sel_getUid("removeFirstObject"),function(_38,_39){
with(_38){
objj_msgSend(_content,"removeFirstObject");
objj_msgSend(_filteredContent,"removeFirstObject");
_needsFilter=YES;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(_filteredContent,"indexOfObject:",_3c);
}
}),new objj_method(sel_getUid("count"),function(_3d,_3e){
with(_3d){
return objj_msgSend(_filteredContent,"count");
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_3f,_40,_41){
with(_3f){
return objj_msgSend(_filteredContent,"count");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_42,_43,_44,_45,_46){
with(_42){
if(_needsFilter&&_searchField){
objj_msgSend(_42,"filterObjects:",_searchField);
_needsFilter=NO;
}
if(_46>=objj_msgSend(_filteredContent,"count")){
return nil;
}
var _47=objj_msgSend(_45,"identifier");
return objj_msgSend(objj_msgSend(_filteredContent,"objectAtIndex:",_46),"valueForKey:",_47);
}
}),new objj_method(sel_getUid("tableView:sortDescriptorsDidChange:"),function(_48,_49,_4a,_4b){
with(_48){
var _4c=objj_msgSend(_4a,"selectedRowIndexes"),_4d=objj_msgSend(_filteredContent,"objectsAtIndexes:",_4c),_4e=objj_msgSend(objj_msgSend(CPIndexSet,"alloc"),"init");
objj_msgSend(_filteredContent,"sortUsingDescriptors:",objj_msgSend(_4a,"sortDescriptors"));
objj_msgSend(_content,"sortUsingDescriptors:",objj_msgSend(_4a,"sortDescriptors"));
objj_msgSend(_table,"reloadData");
for(var i=0;i<objj_msgSend(_4d,"count");i++){
var _4f=objj_msgSend(_4d,"objectAtIndex:",i);
objj_msgSend(_4e,"addIndex:",objj_msgSend(_filteredContent,"indexOfObject:",_4f));
}
objj_msgSend(_table,"selectRowIndexes:byExtendingSelection:",_4e,NO);
}
}),new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"),function(_50,_51,_52,_53,_54,_55){
with(_50){
if(_55>=objj_msgSend(_filteredContent,"count")){
return;
}
var _56=objj_msgSend(_54,"identifier");
objj_msgSend(objj_msgSend(_filteredContent,"objectAtIndex:",_55),"setValue:forKey:",_53,_56);
}
})]);
p;20;TNTextFieldStepper.jt;8072;@STATIC;1.0;t;8053;
var _1=CPSizeMake(19,13);
PatternColor=function(){
if(arguments.length<3){
var _2=arguments[0],_3=[],_4=objj_msgSend(CPBundle,"bundleForClass:",TNTextFieldStepper);
for(var i=0;i<_2.length;++i){
var _5=_2[i];
_3.push(_5?objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_4,"pathForResource:",_5[0]),CGSizeMake(_5[1],_5[2])):nil);
}
if(arguments.length==2){
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",_3,arguments[1]));
}else{
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",_3));
}
}else{
if(arguments.length==3){
return objj_msgSend(CPColor,"colorWithPatternImage:",PatternImage(arguments[0],arguments[1],arguments[2]));
}else{
return nil;
}
}
};
var _6=objj_allocateClassPair(CPStepper,"TNTextFieldStepper"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_textField")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("TNTextFieldStepper").super_class},"initWithFrame:",_a)){
objj_msgSend(_buttonUp,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_buttonDown,"setAutoresizingMask:",CPViewMinXMargin);
_textField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,0,_a.size.width-_1.width,_a.size.height));
objj_msgSend(_textField,"setBezeled:",YES);
objj_msgSend(_textField,"setEditable:",YES);
objj_msgSend(_textField,"setTarget:",_8);
objj_msgSend(_textField,"setSendsActionOnEndEditing:",YES);
objj_msgSend(_textField,"setAction:",sel_getUid("_didTextFieldEdit:"));
objj_msgSend(_textField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_textField,"bind:toObject:withKeyPath:options:","doubleValue",_8,"doubleValue",nil);
objj_msgSend(_textField,"setValue:forThemeAttribute:",CGInsetMake(0,0,0,0),"bezel-inset");
objj_msgSend(_textField,"setValue:forThemeAttribute:",CGInsetMake(7,7,5,8),"content-inset");
var _b=PatternColor([["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-0.png",2,3],["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-1.png",1,3],["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-2.png",2,3],["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-3.png",2,1],["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-4.png",1,1],["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-5.png",2,1],["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-6.png",2,2],["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-7.png",1,2],["TNTextFieldStepper/stepper-textfield-bezel-big-bezel-square-8.png",2,2]]),_c=PatternColor([["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-0.png",2,3],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-1.png",1,3],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-2.png",2,3],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-3.png",2,1],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-4.png",1,1],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-5.png",2,1],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-6.png",2,2],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-7.png",1,2],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-bezel-square-8.png",2,2]]);
objj_msgSend(_textField,"setValue:forThemeAttribute:",_b,"bezel-color");
objj_msgSend(_textField,"setValue:forThemeAttribute:inState:",_c,"bezel-color",CPThemeStateBezeled|CPThemeStateDisabled);
objj_msgSend(_8,"addSubview:",_textField);
}
return _8;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_d,_e){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("TNTextFieldStepper").super_class},"layoutSubviews");
var _f=PatternColor([["TNTextFieldStepper/stepper-textfield-bezel-big-up-left.png",3,13],["TNTextFieldStepper/stepper-textfield-bezel-big-up-center.png",13,13],["TNTextFieldStepper/stepper-textfield-bezel-big-up-right.png",3,13]],NO),_10=PatternColor([["TNTextFieldStepper/stepper-textfield-bezel-big-down-left.png",3,12],["TNTextFieldStepper/stepper-textfield-bezel-big-down-center.png",13,12],["TNTextFieldStepper/stepper-textfield-bezel-big-down-right.png",3,12]],NO),_11=PatternColor([["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-up-left.png",3,13],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-up-center.png",13,13],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-up-right.png",3,13]],NO),_12=PatternColor([["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-down-left.png",3,12],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-down-center.png",13,12],["TNTextFieldStepper/stepper-textfield-bezel-big-disabled-down-right.png",3,12]],NO),_13=PatternColor([["TNTextFieldStepper/stepper-textfield-bezel-big-highlighted-up-left.png",3,13],["TNTextFieldStepper/stepper-textfield-bezel-big-highlighted-up-center.png",13,13],["TNTextFieldStepper/stepper-textfield-bezel-big-highlighted-up-right.png",3,13]],NO),_14=PatternColor([["TNTextFieldStepper/stepper-textfield-bezel-big-highlighted-down-left.png",3,12],["TNTextFieldStepper/stepper-textfield-bezel-big-highlighted-down-center.png",13,12],["TNTextFieldStepper/stepper-textfield-bezel-big-highlighted-down-right.png",3,12]],NO);
objj_msgSend(_buttonUp,"setValue:forThemeAttribute:inState:",_f,"bezel-color",CPThemeStateBordered);
objj_msgSend(_buttonUp,"setValue:forThemeAttribute:inState:",_11,"bezel-color",CPThemeStateBordered|CPThemeStateDisabled);
objj_msgSend(_buttonUp,"setValue:forThemeAttribute:inState:",_13,"bezel-color",CPThemeStateBordered|CPThemeStateHighlighted);
objj_msgSend(_buttonDown,"setValue:forThemeAttribute:inState:",_10,"bezel-color",CPThemeStateBordered);
objj_msgSend(_buttonDown,"setValue:forThemeAttribute:inState:",_12,"bezel-color",CPThemeStateBordered|CPThemeStateDisabled);
objj_msgSend(_buttonDown,"setValue:forThemeAttribute:inState:",_14,"bezel-color",CPThemeStateBordered|CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("setEnabled:"),function(_15,_16,_17){
with(_15){
objj_msgSendSuper({receiver:_15,super_class:objj_getClass("TNTextFieldStepper").super_class},"setEnabled:",_17);
objj_msgSend(_textField,"setEnabled:",_17);
}
}),new objj_method(sel_getUid("_didTextFieldEdit:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(_1a,"doubleValue");
if(_1b==_value){
return;
}else{
if(_1b>_maxValue){
_1b=_maxValue;
}else{
if(_1b<_minValue){
_1b=_minValue;
}
}
}
objj_msgSend(_18,"setDoubleValue:",_1b);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("stepperWithInitialValue:minValue:maxValue:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
var _21=objj_msgSend(objj_msgSend(TNTextFieldStepper,"alloc"),"initWithFrame:",CPRectMake(0,0,100,25));
objj_msgSend(_21,"setDoubleValue:",_1e);
objj_msgSend(_21,"setMinValue:",_1f);
objj_msgSend(_21,"setMaxValue:",_20);
return _21;
}
}),new objj_method(sel_getUid("stepper"),function(_22,_23){
with(_22){
return objj_msgSend(TNTextFieldStepper,"stepperWithInitialValue:minValue:maxValue:",0,0,59);
}
})]);
var _6=objj_getClass("TNTextFieldStepper");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"TNTextFieldStepper\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_24,_25,_26){
with(_24){
if(_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("TNTextFieldStepper").super_class},"initWithCoder:",_26)){
_textField=objj_msgSend(_26,"decodeObjectForKey:","_textField");
}
return _24;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_27,_28,_29){
with(_27){
objj_msgSendSuper({receiver:_27,super_class:objj_getClass("TNTextFieldStepper").super_class},"encodeWithCoder:",_29);
objj_msgSend(_29,"encodeObject:forKey:",_textField,"_textField");
}
})]);
p;11;TNToolbar.jt;6821;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;6754;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
var _1=objj_allocateClassPair(CPToolbar,"TNToolbar"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_customSubViews"),new objj_ivar("_selectedToolbarItem"),new objj_ivar("_iconSelected"),new objj_ivar("_sortedToolbarItems"),new objj_ivar("_toolbarItems"),new objj_ivar("_toolbarItemsOrder"),new objj_ivar("_imageViewSelection")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("customSubViews"),function(_3,_4){
with(_3){
return _customSubViews;
}
}),new objj_method(sel_getUid("setCustomSubViews:"),function(_5,_6,_7){
with(_5){
_customSubViews=_7;
}
}),new objj_method(sel_getUid("selectedToolbarItem"),function(_8,_9){
with(_8){
return _selectedToolbarItem;
}
}),new objj_method(sel_getUid("_setSelectedToolbarItem:"),function(_a,_b,_c){
with(_a){
_selectedToolbarItem=_c;
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("TNToolbar").super_class},"init")){
var _f=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_d,"class"));
_toolbarItems=objj_msgSend(CPDictionary,"dictionary");
_toolbarItemsOrder=objj_msgSend(CPDictionary,"dictionary");
_imageViewSelection=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CPRectMake(0,0,60,60));
_iconSelected=NO;
_customSubViews=objj_msgSend(CPArray,"array");
var _10=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f,"pathForResource:","TNToolbar/toolbar-item-selected-left.png"),CPSizeMake(3,60)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f,"pathForResource:","TNToolbar/toolbar-item-selected-center.png"),CPSizeMake(1,60)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f,"pathForResource:","TNToolbar/toolbar-item-selected-right.png"),CPSizeMake(3,60))],NO);
objj_msgSend(_imageViewSelection,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_10));
objj_msgSend(_d,"setDelegate:",_d);
}
return _d;
}
}),new objj_method(sel_getUid("addItemWithIdentifier:label:icon:target:action:"),function(_11,_12,_13,_14,_15,_16,_17){
with(_11){
var _18=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_13);
objj_msgSend(_18,"setLabel:",_14);
objj_msgSend(_18,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",_15,CPSizeMake(32,32)));
objj_msgSend(_18,"setTarget:",_16);
objj_msgSend(_18,"setAction:",_17);
objj_msgSend(_toolbarItems,"setObject:forKey:",_18,_13);
}
}),new objj_method(sel_getUid("toolbarView"),function(_19,_1a){
with(_19){
return _toolbarView;
}
}),new objj_method(sel_getUid("addItem:withIdentifier:"),function(_1b,_1c,_1d,_1e){
with(_1b){
objj_msgSend(_toolbarItems,"setObject:forKey:",_1d,_1e);
}
}),new objj_method(sel_getUid("addItemWithIdentifier:label:view:target:action:"),function(_1f,_20,_21,_22,_23,_24,_25){
with(_1f){
var _26=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_21);
objj_msgSend(_26,"setLabel:",_22);
objj_msgSend(_26,"setView:",_23);
objj_msgSend(_26,"setTarget:",_24);
objj_msgSend(_26,"setAction:",_25);
objj_msgSend(_toolbarItems,"setObject:forKey:",_26,_21);
return _26;
}
}),new objj_method(sel_getUid("setPosition:forToolbarItemIdentifier:"),function(_27,_28,_29,_2a){
with(_27){
objj_msgSend(_toolbarItemsOrder,"setObject:forKey:",_2a,_29);
}
}),new objj_method(sel_getUid("_reloadToolbarItems"),function(_2b,_2c){
with(_2b){
var _2d=function(a,b,_2e){
var _2f=a,_30=b;
if(a<b){
return CPOrderedAscending;
}else{
if(a>b){
return CPOrderedDescending;
}else{
return CPOrderedSame;
}
}
},_31=objj_msgSend(objj_msgSend(_toolbarItemsOrder,"allKeys"),"sortedArrayUsingFunction:",_2d);
_sortedToolbarItems=objj_msgSend(CPArray,"array");
for(var i=0;i<objj_msgSend(_31,"count");i++){
var key=objj_msgSend(_31,"objectAtIndex:",i);
objj_msgSend(_sortedToolbarItems,"addObject:",objj_msgSend(_toolbarItemsOrder,"objectForKey:",key));
}
objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("TNToolbar").super_class},"_reloadToolbarItems");
if(_iconSelected){
objj_msgSend(_toolbarView,"addSubview:positioned:relativeTo:",_imageViewSelection,CPWindowBelow,nil);
}
for(var i=0;i<objj_msgSend(_customSubViews,"count");i++){
objj_msgSend(_toolbarView,"addSubview:",objj_msgSend(_customSubViews,"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("reloadToolbarItems"),function(_32,_33){
with(_32){
objj_msgSend(_32,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("selectToolbarItem:"),function(_34,_35,_36){
with(_34){
var _37;
for(var i=0;i<objj_msgSend(objj_msgSend(_toolbarView,"subviews"),"count");i++){
_37=objj_msgSend(objj_msgSend(_toolbarView,"subviews"),"objectAtIndex:",i);
if(objj_msgSend(_37._toolbarItem,"itemIdentifier")===objj_msgSend(_36,"itemIdentifier")){
break;
}
}
var _38=objj_msgSend(_37,"convertRect:toView:",objj_msgSend(_37,"bounds"),_toolbarView),_39=objj_msgSend(objj_msgSend(_36,"label"),"sizeWithFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
_iconSelected=YES;
objj_msgSend(_imageViewSelection,"setFrameSize:",CGSizeMake(MAX(_39.width+4,50),60));
objj_msgSend(_imageViewSelection,"setFrameOrigin:",CGPointMake(CGRectGetMinX(_38)+(CGRectGetWidth(_38)-CGRectGetWidth(objj_msgSend(_imageViewSelection,"frame")))/2,0));
objj_msgSend(_toolbarView,"addSubview:positioned:relativeTo:",_imageViewSelection,CPWindowBelow,nil);
_selectedToolbarItem=_36;
}
}),new objj_method(sel_getUid("deselectToolbarItem"),function(_3a,_3b){
with(_3a){
_selectedToolbarItem=nil;
_iconSelected=NO;
objj_msgSend(_imageViewSelection,"removeFromSuperview");
}
}),new objj_method(sel_getUid("itemWithIdentifier:"),function(_3c,_3d,_3e){
with(_3c){
for(var i=0;i<objj_msgSend(objj_msgSend(_3c,"visibleItems"),"count");i++){
if(objj_msgSend(objj_msgSend(objj_msgSend(_3c,"visibleItems"),"objectAtIndex:",i),"itemIdentifier")==_3e){
return objj_msgSend(objj_msgSend(_3c,"visibleItems"),"objectAtIndex:",i);
}
}
return nil;
}
}),new objj_method(sel_getUid("toolbarAllowedItemIdentifiers:"),function(_3f,_40,_41){
with(_3f){
return _sortedToolbarItems;
}
}),new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"),function(_42,_43,_44){
with(_42){
return _sortedToolbarItems;
}
}),new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_45,_46,_47,_48,_49){
with(_45){
var _4a=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_48);
return (objj_msgSend(_toolbarItems,"objectForKey:",_48))?objj_msgSend(_toolbarItems,"objectForKey:",_48):_4a;
}
})]);
p;11;TNToolTip.jt;1839;@STATIC;1.0;i;18;TNAttachedWindow.jt;1797;
objj_executeFile("TNAttachedWindow.j",YES);
var _1=objj_allocateClassPair(TNAttachedWindow,"TNToolTip"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_content")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:styleMask:"),function(_3,_4,_5,_6){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("TNToolTip").super_class},"initWithContentRect:styleMask:",CPRectMake(0,0,200,0),_6)){
_content=objj_msgSend(CPTextField,"labelWithTitle:",_5);
var _7=objj_msgSend(_5,"sizeWithFont:inWidth:",objj_msgSend(_content,"font"),200);
_7.height+=5;
objj_msgSend(_content,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_content,"setFrameSize:",_7);
objj_msgSend(_content,"setFrameOrigin:",CPPointMake(10,10));
objj_msgSend(_content,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_content,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"whiteColor"),"text-shadow-color");
_7.width+=40;
_7.height+=45;
objj_msgSend(objj_msgSend(_3,"contentView"),"addSubview:",_content);
objj_msgSend(_3,"setFrameSize:",_7);
objj_msgSend(_3,"setMovableByWindowBackground:",NO);
}
return _3;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("toolTipWithString:forView:"),function(_8,_9,_a,_b){
with(_8){
var _c=objj_msgSend(objj_msgSend(TNToolTip,"alloc"),"initWithString:styleMask:",_a,TNAttachedWhiteWindowMask);
objj_msgSend(_c,"attachToView:",_b);
objj_msgSend(_c,"resignMainWindow");
return _c;
}
}),new objj_method(sel_getUid("blackToolTipWithString:forView:"),function(_d,_e,_f,_10){
with(_d){
var _11=objj_msgSend(objj_msgSend(TNToolTip,"alloc"),"initWithString:styleMask:",_f,TNAttachedWhiteWindowMask);
objj_msgSend(_11,"attachToView:",_10);
objj_msgSend(_11,"resignMainWindow");
_oldResponder=_10;
return _11;
}
})]);
e;