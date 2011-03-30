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
p;22;LPMultiLineTextField.jt;8312;@STATIC;1.0;I;20;AppKit/CPTextField.jt;8268;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPTextField,"LPMultiLineTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_DOMTextareaElement"),new objj_ivar("_stringValue"),new objj_ivar("_hideOverflow"),new objj_ivar("_textAlignment")]);
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
_textAlignment=objj_msgSend(_6,"currentValueForThemeAttribute:","alignment");
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
}),new objj_method(sel_getUid("setTextAlignment:"),function(_14,_15,_16){
with(_14){
var _17=objj_msgSend(_14,"_DOMTextareaElement");
switch(_16){
case CPLeftTextAlignment:
_17.style.textAlign="left";
_textAlignment=CPLeftTextAlignment;
break;
case CPJustifiedTextAlignment:
_17.style.textAlign="justify";
_textAlignment=CPJustifiedTextAlignment;
break;
case CPCenterTextAlignment:
_17.style.textAlign="center";
_textAlignment=CPCenterTextAlignment;
break;
case CPRightTextAlignment:
_17.style.textAlign="right";
_textAlignment=CPRightTextAlignment;
break;
default:
_textAlignment=CPLeftTextAlignment;
_17.style.textAlign="left";
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_18,_19){
with(_18){
objj_msgSendSuper({receiver:_18,super_class:objj_getClass("LPMultiLineTextField").super_class},"layoutSubviews");
var _1a=objj_msgSend(_18,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
objj_msgSend(_1a,"setHidden:",YES);
var _1b=objj_msgSend(_18,"_DOMTextareaElement"),_1c=objj_msgSend(_18,"currentValueForThemeAttribute:","content-inset"),_1d=objj_msgSend(_18,"bounds");
_1b.style.top=_1c.top+"px";
_1b.style.bottom=_1c.bottom+"px";
_1b.style.left=_1c.left+"px";
_1b.style.right=_1c.right+"px";
_1b.style.width=(CGRectGetWidth(_1d)-_1c.left-_1c.right)+"px";
_1b.style.height=(CGRectGetHeight(_1d)-_1c.top-_1c.bottom)+"px";
_1b.style.color=objj_msgSend(objj_msgSend(_18,"currentValueForThemeAttribute:","text-color"),"cssString");
_1b.style.font=objj_msgSend(objj_msgSend(_18,"currentValueForThemeAttribute:","font"),"cssString");
objj_msgSend(_18,"setTextAlignment:",_textAlignment);
_1b.value=_stringValue||"";
if(_hideOverflow){
_1b.style.overflow="hidden";
}
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_1e,_1f,_20){
with(_1e){
var _21=objj_msgSend(_1e,"_DOMTextareaElement");
_21.scrollLeft+=_20._deltaX;
_21.scrollTop+=_20._deltaY;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_22,_23,_24){
with(_22){
if(objj_msgSend(_22,"isEditable")&&objj_msgSend(_22,"isEnabled")){
objj_msgSend(objj_msgSend(objj_msgSend(_22,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
objj_msgSendSuper({receiver:_22,super_class:objj_getClass("LPMultiLineTextField").super_class},"mouseDown:",_24);
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(objj_msgSend(objj_msgSend(_27,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("keyDown:"),function(_28,_29,_2a){
with(_28){
if(objj_msgSend(_2a,"keyCode")===CPTabKeyCode){
if(objj_msgSend(_2a,"modifierFlags")&CPShiftKeyMask){
objj_msgSend(objj_msgSend(_28,"window"),"selectPreviousKeyView:",_28);
}else{
objj_msgSend(objj_msgSend(_28,"window"),"selectNextKeyView:",_28);
}
if(objj_msgSend(objj_msgSend(objj_msgSend(_28,"window"),"firstResponder"),"respondsToSelector:",sel_getUid("selectText:"))){
objj_msgSend(objj_msgSend(objj_msgSend(_28,"window"),"firstResponder"),"selectText:",_28);
}
objj_msgSend(objj_msgSend(objj_msgSend(_28,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_28,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyUp:"),function(_2b,_2c,_2d){
with(_2b){
if(_stringValue!==objj_msgSend(_2b,"stringValue")){
_stringValue=objj_msgSend(_2b,"stringValue");
if(!_isEditing){
_isEditing=YES;
objj_msgSend(_2b,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_2b,nil));
}
objj_msgSend(_2b,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_2b,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_2b,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_2e,_2f){
with(_2e){
_stringValue=objj_msgSend(_2e,"stringValue");
objj_msgSend(_2e,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_2e,"textDidFocus:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidFocusNotification,_2e,nil));
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_30,_31){
with(_30){
objj_msgSend(_30,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_30,"setStringValue:",objj_msgSend(_30,"stringValue"));
objj_msgSend(_30,"_DOMTextareaElement").blur();
if(_isEditing){
_isEditing=NO;
objj_msgSend(_30,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_30,nil));
if(objj_msgSend(_30,"sendsActionOnEndEditing")){
objj_msgSend(_30,"sendAction:to:",objj_msgSend(_30,"action"),objj_msgSend(_30,"target"));
}
}
objj_msgSend(_30,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_30,nil));
return YES;
}
}),new objj_method(sel_getUid("stringValue"),function(_32,_33){
with(_32){
return (!!_DOMTextareaElement)?_DOMTextareaElement.value:"";
}
}),new objj_method(sel_getUid("setStringValue:"),function(_34,_35,_36){
with(_34){
_stringValue=_36;
objj_msgSend(_34,"setNeedsLayout");
}
})]);
var _37="LPMultiLineTextFieldStringValueKey",_38="LPMultiLineTextFieldScrollableKey";
var _2=objj_getClass("LPMultiLineTextField");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"LPMultiLineTextField\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_39,_3a,_3b){
with(_39){
if(_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithCoder:",_3b)){
objj_msgSend(_39,"setStringValue:",objj_msgSend(_3b,"decodeObjectForKey:",_37));
objj_msgSend(_39,"setScrollable:",objj_msgSend(_3b,"decodeBoolForKey:",_38));
}
return _39;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("LPMultiLineTextField").super_class},"encodeWithCoder:",_3e);
objj_msgSend(_3e,"encodeObject:forKey:",_stringValue,_37);
objj_msgSend(_3e,"encodeBool:forKey:",(_hideOverflow?NO:YES),_38);
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
