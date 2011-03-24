@STATIC;1.0;p;7;LPKit.jt;801;@STATIC;1.0;I;24;LPKit/LPURLPostRequest.jt;754;
/* objj_executeFile("LPKit/LPAnchorButton.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPCalendarView.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPChartView.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPCookieController.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPEmail.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPLocationController.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPPieChartView.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPSlideView.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPSparkLine.j",NO) */ (undefined);
/* objj_executeFile("LPKit/LPSwitch.j",NO) */ (undefined);
objj_executeFile("LPKit/LPURLPostRequest.j",NO);
/* objj_executeFile("LPKit/LPViewAnimation.j",NO) */ (undefined);
p;22;LPMultiLineTextField.jt;7883;@STATIC;1.0;I;20;AppKit/CPTextField.jt;7839;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPTextField,"LPMultiLineTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_DOMTextareaElement"),new objj_ivar("_stringValue"),new objj_ivar("_hideOverflow")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_DOMTextareaElement"),function(_4,_5){
with(_4){
if(!_DOMTextareaElement){
_DOMTextareaElement=document.createElement("textarea");
_DOMTextareaElement.style.position="absolute";
_DOMTextareaElement.style.background="none";
_DOMTextareaElement.style.border="0";
_DOMTextareaElement.style.outline="0";
_DOMTextareaElement.style.zIndex="100";
_DOMTextareaElement.style.resize="none";
_DOMTextareaElement.style.padding="0";
_DOMTextareaElement.style.margin="0";
_DOMTextareaElement.onblur=function(){
objj_msgSend(objj_msgSend(_1,"window"),"makeFirstResponder:",nil);
_1=nil;
};
_4._DOMElement.appendChild(_DOMTextareaElement);
}
return _DOMTextareaElement;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithFrame:",_8)){
}
return _6;
}
}),new objj_method(sel_getUid("isScrollable"),function(_9,_a){
with(_9){
return !_hideOverflow;
}
}),new objj_method(sel_getUid("setScrollable:"),function(_b,_c,_d){
with(_b){
_hideOverflow=!_d;
}
}),new objj_method(sel_getUid("setEditable:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_e,"_DOMTextareaElement").style.cursor=_10?"cursor":"default";
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEditable:",_10);
}
}),new objj_method(sel_getUid("selectText:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"_DOMTextareaElement").select();
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_14,_15){
with(_14){
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("LPMultiLineTextField").super_class},"layoutSubviews");
var _16=objj_msgSend(_14,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
objj_msgSend(_16,"setHidden:",YES);
var _17=objj_msgSend(_14,"_DOMTextareaElement"),_18=objj_msgSend(_14,"currentValueForThemeAttribute:","content-inset"),_19=objj_msgSend(_14,"bounds");
_17.style.top=_18.top+"px";
_17.style.bottom=_18.bottom+"px";
_17.style.left=_18.left+"px";
_17.style.right=_18.right+"px";
_17.style.width=(CGRectGetWidth(_19)-_18.left-_18.right)+"px";
_17.style.height=(CGRectGetHeight(_19)-_18.top-_18.bottom)+"px";
_17.style.color=objj_msgSend(objj_msgSend(_14,"currentValueForThemeAttribute:","text-color"),"cssString");
_17.style.font=objj_msgSend(objj_msgSend(_14,"currentValueForThemeAttribute:","font"),"cssString");
switch(objj_msgSend(_14,"currentValueForThemeAttribute:","alignment")){
case CPLeftTextAlignment:
_17.style.textAlign="left";
break;
case CPJustifiedTextAlignment:
_17.style.textAlign="justify";
break;
case CPCenterTextAlignment:
_17.style.textAlign="center";
break;
case CPRightTextAlignment:
_17.style.textAlign="right";
break;
default:
_17.style.textAlign="left";
}
_17.value=_stringValue||"";
if(_hideOverflow){
_17.style.overflow="hidden";
}
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(_1a,"_DOMTextareaElement");
_1d.scrollLeft+=_1c._deltaX;
_1d.scrollTop+=_1c._deltaY;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_1e,"isEditable")&&objj_msgSend(_1e,"isEnabled")){
objj_msgSend(objj_msgSend(objj_msgSend(_1e,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("LPMultiLineTextField").super_class},"mouseDown:",_20);
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(objj_msgSend(objj_msgSend(_23,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("keyDown:"),function(_24,_25,_26){
with(_24){
if(objj_msgSend(_26,"keyCode")===CPTabKeyCode){
if(objj_msgSend(_26,"modifierFlags")&CPShiftKeyMask){
objj_msgSend(objj_msgSend(_24,"window"),"selectPreviousKeyView:",_24);
}else{
objj_msgSend(objj_msgSend(_24,"window"),"selectNextKeyView:",_24);
}
if(objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"firstResponder"),"respondsToSelector:",sel_getUid("selectText:"))){
objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"firstResponder"),"selectText:",_24);
}
objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyUp:"),function(_27,_28,_29){
with(_27){
if(_stringValue!==objj_msgSend(_27,"stringValue")){
_stringValue=objj_msgSend(_27,"stringValue");
if(!_isEditing){
_isEditing=YES;
objj_msgSend(_27,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_27,nil));
}
objj_msgSend(_27,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_27,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_27,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_2a,_2b){
with(_2a){
_stringValue=objj_msgSend(_2a,"stringValue");
objj_msgSend(_2a,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_2a,"textDidFocus:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidFocusNotification,_2a,nil));
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_2c,_2d){
with(_2c){
objj_msgSend(_2c,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_2c,"setStringValue:",objj_msgSend(_2c,"stringValue"));
objj_msgSend(_2c,"_DOMTextareaElement").blur();
if(_isEditing){
_isEditing=NO;
objj_msgSend(_2c,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_2c,nil));
if(objj_msgSend(_2c,"sendsActionOnEndEditing")){
objj_msgSend(_2c,"sendAction:to:",objj_msgSend(_2c,"action"),objj_msgSend(_2c,"target"));
}
}
objj_msgSend(_2c,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_2c,nil));
return YES;
}
}),new objj_method(sel_getUid("stringValue"),function(_2e,_2f){
with(_2e){
return (!!_DOMTextareaElement)?_DOMTextareaElement.value:"";
}
}),new objj_method(sel_getUid("setStringValue:"),function(_30,_31,_32){
with(_30){
_stringValue=_32;
objj_msgSend(_30,"setNeedsLayout");
}
})]);
var _33="LPMultiLineTextFieldStringValueKey",_34="LPMultiLineTextFieldScrollableKey";
var _2=objj_getClass("LPMultiLineTextField");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"LPMultiLineTextField\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_35,_36,_37){
with(_35){
if(_35=objj_msgSendSuper({receiver:_35,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithCoder:",_37)){
objj_msgSend(_35,"setStringValue:",objj_msgSend(_37,"decodeObjectForKey:",_33));
objj_msgSend(_35,"setScrollable:",objj_msgSend(_37,"decodeBoolForKey:",_34));
}
return _35;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_38,_39,_3a){
with(_38){
objj_msgSendSuper({receiver:_38,super_class:objj_getClass("LPMultiLineTextField").super_class},"encodeWithCoder:",_3a);
objj_msgSend(_3a,"encodeObject:forKey:",_stringValue,_33);
objj_msgSend(_3a,"encodeBool:forKey:",(_hideOverflow?NO:YES),_34);
}
})]);
p;18;LPURLPostRequest.jt;1235;@STATIC;1.0;I;25;Foundation/CPURLRequest.jt;1186;
objj_executeFile("Foundation/CPURLRequest.j",NO);
var _1=objj_allocateClassPair(CPURLRequest,"LPURLPostRequest"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithURL:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("LPURLPostRequest").super_class},"initWithURL:",_5)){
objj_msgSend(_3,"setHTTPMethod:","POST");
objj_msgSend(_3,"setValue:forHTTPHeaderField:","application/x-www-form-urlencoded","Content-Type");
}
return _3;
}
}),new objj_method(sel_getUid("setContent:"),function(_6,_7,_8){
with(_6){
objj_msgSend(_6,"setContent:escape:",_8,YES);
}
}),new objj_method(sel_getUid("setContent:escape:"),function(_9,_a,_b,_c){
with(_9){
var _d="";
for(key in _b){
_d=objj_msgSend(_d,"stringByAppendingString:",objj_msgSend(CPString,"stringWithFormat:","%s=%s&",key,_c?encodeURIComponent(_b[key]):_b[key]));
}
_d=objj_msgSend(_d,"substringToIndex:",objj_msgSend(_d,"length")-1);
objj_msgSend(_9,"setHTTPBody:",_d);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("requestWithURL:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(objj_msgSend(_e,"alloc"),"initWithURL:",_10);
}
})]);
