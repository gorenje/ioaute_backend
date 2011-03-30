@STATIC;1.0;p;17;g_r_class_mixin.jt;728;@STATIC;1.0;t;710;
var _1=objj_allocateClassPair(CPObject,"GRClassMixin"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("addToClassOfObject:"),function(_3,_4,_5){
with(_3){
objj_msgSend(_3,"mixIntoClass:usingClass:",objj_msgSend(_5,"class"),_3);
}
}),new objj_method(sel_getUid("addToClass:"),function(_6,_7,_8){
with(_6){
objj_msgSend(_6,"mixIntoClass:usingClass:",_8,_6);
}
}),new objj_method(sel_getUid("mixIntoClass:usingClass:"),function(_9,_a,_b,_c){
with(_9){
class_addIvars(_b,class_copyIvarList(_c));
class_addMethods(_b,class_copyMethodList(_c));
objj_msgSend(_9,"includedInClass:",_b);
}
}),new objj_method(sel_getUid("includedInClass:"),function(_d,_e,_f){
with(_d){
}
})]);
p;17;g_r_info_window.jt;2899;@STATIC;1.0;t;2880;
var _1=objj_allocateClassPair(CPAlert,"GRInfoWindow"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_createWindowWithStyle:"),function(_3,_4,_5){
with(_3){
var _6=CGRectMakeZero();
_6.size=objj_msgSend(_3,"currentValueForThemeAttribute:","size");
_window=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",_6,_5||_defaultWindowStyle);
if(_title){
objj_msgSend(_window,"setTitle:",_title);
}
var _7=objj_msgSend(_window,"contentView"),_8=objj_msgSend(_buttons,"count");
if(_8){
while(_8--){
objj_msgSend(_7,"addSubview:",_buttons[_8]);
}
}
objj_msgSend(_7,"addSubview:",_messageLabel);
objj_msgSend(_7,"addSubview:",_alertImageView);
objj_msgSend(_7,"addSubview:",_informativeLabel);
if(_showHelp){
objj_msgSend(_7,"addSubview:",_alertHelpButton);
}
}
}),new objj_method(sel_getUid("_layoutButtonsFromView:"),function(_9,_a,_b){
with(_9){
var _c=objj_msgSend(_9,"currentValueForThemeAttribute:","content-inset"),_d=objj_msgSend(_9,"currentValueForThemeAttribute:","size"),_e=objj_msgSend(_9,"currentValueForThemeAttribute:","button-offset"),_f=objj_msgSend(_9,"currentValueForThemeAttribute:","help-image-left-offset"),_10=objj_msgSend(_9,"currentValueForThemeAttribute:","default-elements-margin"),_11=objj_msgSend(objj_msgSend(_window,"contentView"),"frame").size,_12,_13;
_11.height=CGRectGetMaxY(objj_msgSend(_b,"frame"))+_10;
if(_11.height<_d.height){
_11.height=_d.height;
}
_12=_11.height+_e;
_13=_11.width-_c.right;
for(var i=objj_msgSend(_buttons,"count")-1;i>=0;i--){
var _14=_buttons[i];
objj_msgSend(_14,"setTheme:",objj_msgSend(_9,"theme"));
objj_msgSend(_14,"sizeToFit");
var _15=objj_msgSend(_14,"frame"),_16=MAX(80,CGRectGetWidth(_15)),_17=CGRectGetHeight(_15);
_13-=_16;
objj_msgSend(_14,"setFrame:",CGRectMake(_13,_12,_16,_17));
_13-=10;
}
if(_showHelp){
var _18=objj_msgSend(_9,"currentValueForThemeAttribute:","help-image"),_19=objj_msgSend(_9,"currentValueForThemeAttribute:","help-image-pressed"),_1a=_18?objj_msgSend(_18,"size"):CGSizeMakeZero(),_1b=CGRectMake(_f,_12,_1a.width,_1a.height);
objj_msgSend(_alertHelpButton,"setImage:",_18);
objj_msgSend(_alertHelpButton,"setAlternateImage:",_19);
objj_msgSend(_alertHelpButton,"setBordered:",NO);
objj_msgSend(_alertHelpButton,"setFrame:",_1b);
}
_11.height+=_c.bottom+_e;
return _11;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_messageLabel,"setEnabled:",_1e);
}
}),new objj_method(sel_getUid("setSelectable:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_messageLabel,"setSelectable:",_21);
}
}),new objj_method(sel_getUid("setEditable:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_messageLabel,"setEditable:",_24);
}
}),new objj_method(sel_getUid("close"),function(_25,_26){
with(_25){
objj_msgSend(CPApp,"abortModal");
objj_msgSend(objj_msgSend(_25,"window"),"close");
}
})]);
p;17;g_r_rotate_view.jt;2019;@STATIC;1.0;t;2000;
var _1=objj_allocateClassPair(CPView,"GRRotateView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("m_rootLayer"),new objj_ivar("m_rotationRadians"),new objj_ivar("m_rotSelector")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("rotation"),function(_3,_4){
with(_3){
return m_rotationRadians;
}
}),new objj_method(sel_getUid("setRotation:"),function(_5,_6,_7){
with(_5){
m_rotationRadians=_7;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GRRotateView").super_class},"initWithFrame:",_a);
if(_8){
m_rootLayer=objj_msgSend(CALayer,"layer");
objj_msgSend(m_rootLayer,"setDelegate:",_8);
objj_msgSend(_8,"setWantsLayer:",YES);
objj_msgSend(_8,"setLayer:",m_rootLayer);
objj_msgSend(_8,"setClipsToBounds:",NO);
objj_msgSend(_8,"setRotation:",0);
m_rotSelector=sel_getUid("_hitTestSuper:");
}
return _8;
}
}),new objj_method(sel_getUid("hitTests"),function(_b,_c){
with(_b){
return YES;
}
}),new objj_method(sel_getUid("hitTest:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(_d,"performSelector:withObject:",m_rotSelector,_f);
}
}),new objj_method(sel_getUid("_hitTestSuper:"),function(_10,_11,_12){
with(_10){
return objj_msgSendSuper({receiver:_10,super_class:objj_getClass("GRRotateView").super_class},"hitTest:",_12);
}
}),new objj_method(sel_getUid("_hitTestLayer:"),function(_13,_14,_15){
with(_13){
return (objj_msgSend(m_rootLayer,"hitTest:",objj_msgSend(objj_msgSend(_13,"superview"),"convertPoint:toView:",_15,_13))?_13:nil);
}
}),new objj_method(sel_getUid("setRotation:"),function(_16,_17,_18){
with(_16){
if(m_rotationRadians==_18){
return;
}
m_rotationRadians=_18;
m_rotSelector=(m_rotationRadians>0?sel_getUid("_hitTestLayer:"):sel_getUid("_hitTestSuper:"));
objj_msgSend(m_rootLayer,"setAffineTransform:",CGAffineTransformMakeRotation(m_rotationRadians));
}
}),new objj_method(sel_getUid("drawLayer:inContext:"),function(_19,_1a,_1b,_1c){
with(_19){
}
})]);
p;7;GRKit.jt;214;@STATIC;1.0;i;17;g_r_class_mixin.ji;17;g_r_rotate_view.ji;17;g_r_info_window.jt;130;
objj_executeFile("g_r_class_mixin.j",YES);
objj_executeFile("g_r_rotate_view.j",YES);
objj_executeFile("g_r_info_window.j",YES);
e;