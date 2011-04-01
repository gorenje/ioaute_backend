@STATIC;1.0;p;7;GRKit.jt;214;@STATIC;1.0;i;17;g_r_class_mixin.ji;17;g_r_rotate_view.ji;17;g_r_info_window.jt;130;
objj_executeFile("g_r_class_mixin.j",YES);
objj_executeFile("g_r_rotate_view.j",YES);
objj_executeFile("g_r_info_window.j",YES);
p;17;g_r_rotate_view.jt;2919;@STATIC;1.0;t;2900;
var _1=objj_allocateClassPair(CPView,"GRRotateView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("m_rootLayer"),new objj_ivar("m_rotationRadians"),new objj_ivar("m_vertical_flip"),new objj_ivar("m_hitTest")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("rotation"),function(_3,_4){
with(_3){
return m_rotationRadians;
}
}),new objj_method(sel_getUid("setRotation:"),function(_5,_6,_7){
with(_5){
m_rotationRadians=_7;
}
}),new objj_method(sel_getUid("verticalFlip"),function(_8,_9){
with(_8){
return m_vertical_flip;
}
}),new objj_method(sel_getUid("setVerticalFlip:"),function(_a,_b,_c){
with(_a){
m_vertical_flip=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("GRRotateView").super_class},"initWithFrame:",_f);
if(_d){
m_rootLayer=objj_msgSend(CALayer,"layer");
objj_msgSend(m_rootLayer,"setDelegate:",_d);
objj_msgSend(_d,"setWantsLayer:",YES);
objj_msgSend(_d,"setLayer:",m_rootLayer);
objj_msgSend(_d,"setClipsToBounds:",NO);
objj_msgSend(_d,"setRotation:",0);
objj_msgSend(_d,"setVerticalFlip:",0);
objj_msgSend(_d,"hitTestLayer");
}
return _d;
}
}),new objj_method(sel_getUid("hitTestLayer"),function(_10,_11){
with(_10){
m_hitTest=sel_getUid("_hitTestLayer:");
}
}),new objj_method(sel_getUid("hitTestSuper"),function(_12,_13){
with(_12){
m_hitTest=sel_getUid("_hitTestSuper:");
}
}),new objj_method(sel_getUid("hitTests"),function(_14,_15){
with(_14){
return YES;
}
}),new objj_method(sel_getUid("hitTest:"),function(_16,_17,_18){
with(_16){
return objj_msgSend(_16,"performSelector:withObject:",m_hitTest,_18);
}
}),new objj_method(sel_getUid("setRotation:"),function(_19,_1a,_1b){
with(_19){
if(m_rotationRadians==_1b){
return;
}
m_rotationRadians=_1b;
objj_msgSend(m_rootLayer,"setAffineTransform:",objj_msgSend(_19,"createAffineTransform"));
}
}),new objj_method(sel_getUid("setVerticalFlip:"),function(_1c,_1d,_1e){
with(_1c){
if(m_vertical_flip==_1e){
return;
}
m_vertical_flip=_1e>0?-1:0;
objj_msgSend(m_rootLayer,"setAffineTransform:",objj_msgSend(_1c,"createAffineTransform"));
}
}),new objj_method(sel_getUid("createAffineTransform"),function(_1f,_20){
with(_1f){
if(m_vertical_flip<0){
return CGAffineTransformScale(CGAffineTransformMakeRotation(m_rotationRadians),-1,1);
}else{
return CGAffineTransformMakeRotation(m_rotationRadians);
}
}
}),new objj_method(sel_getUid("drawLayer:inContext:"),function(_21,_22,_23,_24){
with(_21){
}
}),new objj_method(sel_getUid("_hitTestSuper:"),function(_25,_26,_27){
with(_25){
return objj_msgSendSuper({receiver:_25,super_class:objj_getClass("GRRotateView").super_class},"hitTest:",_27);
}
}),new objj_method(sel_getUid("_hitTestLayer:"),function(_28,_29,_2a){
with(_28){
return (objj_msgSend(m_rootLayer,"hitTest:",objj_msgSend(objj_msgSend(_28,"superview"),"convertPoint:toView:",_2a,_28))?_28:nil);
}
})]);
p;17;g_r_class_mixin.jt;728;@STATIC;1.0;t;710;
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
