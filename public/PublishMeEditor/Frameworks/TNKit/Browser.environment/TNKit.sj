@STATIC;1.0;p;7;TNKit.jt;629;@STATIC;1.0;i;18;TNAttachedWindow.ji;14;TNCategories.ji;11;TNToolTip.jt;553;
/* objj_executeFile("TNAlert.j",YES) */ (undefined);
/* objj_executeFile("TNAnimation.j",YES) */ (undefined);
objj_executeFile("TNAttachedWindow.j",YES);
objj_executeFile("TNCategories.j",YES);
/* objj_executeFile("TNLocalizationCenter.j",YES) */ (undefined);
/* objj_executeFile("TNOutlineViewDataSource.j",YES) */ (undefined);
/* objj_executeFile("TNTableViewDataSource.j",YES) */ (undefined);
/* objj_executeFile("TNTextFieldStepper.j",YES) */ (undefined);
/* objj_executeFile("TNToolbar.j",YES) */ (undefined);
objj_executeFile("TNToolTip.j",YES);
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
