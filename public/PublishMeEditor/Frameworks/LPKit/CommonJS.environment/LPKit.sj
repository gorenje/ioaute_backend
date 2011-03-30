@STATIC;1.0;p;16;LPAnchorButton.jt;5735;@STATIC;1.0;t;5716;
LPAnchorButtonNoUnderline=0;
LPAnchorButtonNormalUnderline=1;
LPAnchorButtonHoverUnderline=2;
var _1=objj_allocateClassPair(CPControl,"LPAnchorButton"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_underlineMask"),new objj_ivar("_title"),new objj_ivar("_URL"),new objj_ivar("_DOMAnchorElement")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("underlineMask"),function(_3,_4){
with(_3){
return _underlineMask;
}
}),new objj_method(sel_getUid("setUnderlineMask:"),function(_5,_6,_7){
with(_5){
_underlineMask=_7;
}
}),new objj_method(sel_getUid("title"),function(_8,_9){
with(_8){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_a,_b,_c){
with(_a){
_title=_c;
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("LPAnchorButton").super_class},"init")){
_underlineMask=LPAnchorButtonNormalUnderline|LPAnchorButtonHoverUnderline;
}
return _d;
}
}),new objj_method(sel_getUid("setTitle:"),function(_f,_10,_11){
with(_f){
_title=_11;
objj_msgSend(_f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("openURLOnClick:"),function(_12,_13,_14){
with(_12){
_URL=_14;
objj_msgSend(_12,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setValue:forThemeAttribute:",_17,"text-color");
}
}),new objj_method(sel_getUid("setTextHoverColor:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_18,"setValue:forThemeAttribute:inState:",_1a,"text-color",CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"setThemeState:",CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_1e,"unsetThemeState:",CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_21,_22,_23){
with(_21){
if(_URL){
objj_msgSend(objj_msgSend(objj_msgSend(_21,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("LPAnchorButton").super_class},"mouseDown:",_23);
}
}
}),new objj_method(sel_getUid("sizeToFit"),function(_24,_25){
with(_24){
objj_msgSend(_24,"setFrameSize:",objj_msgSend((_title||" "),"sizeWithFont:",objj_msgSend(_24,"currentValueForThemeAttribute:","font")));
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_26,"bounds");
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_29,_2a,_2b){
with(_29){
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_2c,_2d){
with(_2c){
if(_URL){
if(!_DOMAnchorElement){
_DOMAnchorElement=document.createElement("a");
_DOMAnchorElement.target="_blank";
_DOMAnchorElement.style.position="absolute";
_DOMAnchorElement.style.zIndex="100";
_2c._DOMElement.appendChild(_DOMAnchorElement);
}
_DOMAnchorElement.href=typeof _URL=="string"?_URL:objj_msgSend(_URL,"absoluteString");
var _2e=objj_msgSend(_2c,"bounds");
_DOMAnchorElement.style.width=CGRectGetWidth(_2e)+"px";
_DOMAnchorElement.style.height=CGRectGetHeight(_2e)+"px";
}
var _2f="none";
if(((_themeState===CPThemeStateNormal||_themeState===CPThemeStateSelected)&&(_underlineMask&LPAnchorButtonNormalUnderline))||((_themeState&CPThemeStateHighlighted)&&(_underlineMask&LPAnchorButtonHoverUnderline))){
_2f="underline";
}
var _30=objj_msgSend(_2c,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,nil);
if(_30){
objj_msgSend(_30,"setText:",_title);
objj_msgSend(_30,"setTextColor:",objj_msgSend(_2c,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_30,"setFont:",objj_msgSend(_2c,"currentValueForThemeAttribute:","font"));
objj_msgSend(_30,"setAlignment:",objj_msgSend(_2c,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_30,"setVerticalAlignment:",objj_msgSend(_2c,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_30,"setLineBreakMode:",objj_msgSend(_2c,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_30,"setTextShadowColor:",objj_msgSend(_2c,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_30,"setTextShadowOffset:",objj_msgSend(_2c,"currentValueForThemeAttribute:","text-shadow-offset"));
if(_30._DOMTextElement){
_30._DOMTextElement.style.setProperty("text-decoration",_2f,null);
}
if(_30._DOMTextShadowElement){
_30._DOMTextShadowElement.style.setProperty("text-decoration",_2f,null);
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("buttonWithTitle:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(objj_msgSend(_31,"alloc"),"init");
objj_msgSend(_34,"setTitle:",_33);
objj_msgSend(_34,"sizeToFit");
return _34;
}
})]);
var _35="LPAnchorButtonUnderlineMaskKey";
var _1=objj_getClass("LPAnchorButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"LPAnchorButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_36,_37,_38){
with(_36){
if(_36=objj_msgSendSuper({receiver:_36,super_class:objj_getClass("LPAnchorButton").super_class},"initWithCoder:",_38)){
_underlineMask=objj_msgSend(_38,"decodeIntForKey:",_35)||LPAnchorButtonNoUnderline;
}
return _36;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_39,_3a,_3b){
with(_39){
objj_msgSendSuper({receiver:_39,super_class:objj_getClass("LPAnchorButton").super_class},"encodeWithCoder:",_3b);
if(_underlineMask!==LPAnchorButtonNoUnderline){
objj_msgSend(_3b,"encodeInt:forKey:",_underlineMask,_35);
}
}
})]);
p;22;LPCalendarHeaderView.jt;7947;@STATIC;1.0;I;17;AppKit/CPButton.jI;18;AppKit/CPControl.jt;7883;
objj_executeFile("AppKit/CPButton.j",NO);
objj_executeFile("AppKit/CPControl.j",NO);
var _1=["January","February","March","April","May","June","July","August","September","October","November","December"],_2=["mon","tue","wed","thu","fri","sat","sun"],_3=["sun","mon","tue","wed","thu","fri","sat"];
var _4=objj_allocateClassPair(CPControl,"LPCalendarHeaderView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("representedDate"),new objj_ivar("monthLabel"),new objj_ivar("prevButton"),new objj_ivar("nextButton"),new objj_ivar("dayLabels"),new objj_ivar("weekStartsOnMonday")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("prevButton"),function(_6,_7){
with(_6){
return prevButton;
}
}),new objj_method(sel_getUid("nextButton"),function(_8,_9){
with(_8){
return nextButton;
}
}),new objj_method(sel_getUid("weekStartsOnMonday"),function(_a,_b){
with(_a){
return weekStartsOnMonday;
}
}),new objj_method(sel_getUid("setWeekStartsOnMonday:"),function(_c,_d,_e){
with(_c){
weekStartsOnMonday=_e;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_f,_10,_11){
with(_f){
if(_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("LPCalendarHeaderView").super_class},"initWithFrame:",_11)){
monthLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(monthLabel,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_f,"addSubview:",monthLabel);
prevButton=objj_msgSend(objj_msgSend(LPCalendarHeaderArrowButton,"alloc"),"initWithFrame:",CGRectMake(6,9,0,0));
objj_msgSend(prevButton,"sizeToFit");
objj_msgSend(_f,"addSubview:",prevButton);
nextButton=objj_msgSend(objj_msgSend(LPCalendarHeaderArrowButton,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_f,"bounds"))-21,9,0,0));
objj_msgSend(nextButton,"sizeToFit");
objj_msgSend(nextButton,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_f,"addSubview:",nextButton);
dayLabels=objj_msgSend(CPArray,"array");
for(var i=0;i<objj_msgSend(_2,"count");i++){
var _12=objj_msgSend(LPCalendarLabel,"labelWithTitle:",objj_msgSend(_2,"objectAtIndex:",i));
objj_msgSend(dayLabels,"addObject:",_12);
objj_msgSend(_f,"addSubview:",_12);
}
objj_msgSend(_f,"setBackgroundColor:",objj_msgSend(CPColor,"lightGrayColor"));
}
return _f;
}
}),new objj_method(sel_getUid("setDate:"),function(_13,_14,_15){
with(_13){
if(objj_msgSend(representedDate,"isEqualToDate:",_15)){
return;
}
representedDate=objj_msgSend(_15,"copy");
objj_msgSend(monthLabel,"setStringValue:",objj_msgSend(CPString,"stringWithFormat:","%s %i",_1[representedDate.getUTCMonth()],representedDate.getUTCFullYear()));
objj_msgSend(monthLabel,"sizeToFit");
objj_msgSend(monthLabel,"setCenter:",CGPointMake(CGRectGetMidX(objj_msgSend(_13,"bounds")),16));
}
}),new objj_method(sel_getUid("setWeekStartsOnMonday:"),function(_16,_17,_18){
with(_16){
weekStartsOnMonday=_18;
var _19=(_18)?_2:_3;
for(var i=0;i<objj_msgSend(dayLabels,"count");i++){
objj_msgSend(objj_msgSend(dayLabels,"objectAtIndex:",i),"setTitle:",objj_msgSend(_19,"objectAtIndex:",i));
}
objj_msgSend(_16,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_1a,_1b){
with(_1a){
var _1c=objj_msgSend(_1a,"bounds"),_1d=CGRectGetWidth(_1c),_1e=objj_msgSend(_1a,"superview"),_1f=objj_msgSend(_1a,"themeState");
objj_msgSend(_1a,"setBackgroundColor:",objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-background-color",_1f));
objj_msgSend(monthLabel,"setFont:",objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-font",_1f));
objj_msgSend(monthLabel,"setTextColor:",objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-text-color",_1f));
objj_msgSend(monthLabel,"setTextShadowColor:",objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-text-shadow-color",_1f));
objj_msgSend(monthLabel,"setTextShadowOffset:",objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-text-shadow-offset",_1f));
var _20=objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-button-offset",_1f);
objj_msgSend(prevButton,"setFrameOrigin:",CGPointMake(_20.width,_20.height));
objj_msgSend(prevButton,"setValue:forThemeAttribute:inState:",objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-prev-button-image",_1f),"bezel-color",CPThemeStateBordered);
objj_msgSend(nextButton,"setFrameOrigin:",CGPointMake(_1d-16-_20.width,_20.height));
objj_msgSend(nextButton,"setValue:forThemeAttribute:inState:",objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-next-button-image",_1f),"bezel-color",CPThemeStateBordered);
var _21=objj_msgSend(dayLabels,"count"),_22=_1d/_21,_23=CGRectGetHeight(objj_msgSend(objj_msgSend(objj_msgSend(_1a,"subviews"),"objectAtIndex:",3),"bounds")),_24=objj_msgSend(_1e,"valueForThemeAttribute:inState:","header-weekday-offset",_1f),_25=CGRectGetHeight(_1c);
for(var i=0;i<_21;i++){
objj_msgSend(dayLabels[i],"setFrame:",CGRectMake(i*_22,_24,_22,_23));
}
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("themeClass"),function(_26,_27){
with(_26){
return "lp-calendar-header-view";
}
})]);
var _4=objj_allocateClassPair(CPTextField,"LPCalendarLabel"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_28,_29,_2a){
with(_28){
if(_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("LPCalendarLabel").super_class},"initWithFrame:",_2a)){
objj_msgSend(_28,"setValue:forThemeAttribute:",CPCenterTextAlignment,"alignment");
}
return _28;
}
}),new objj_method(sel_getUid("setTitle:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2b,"setStringValue:",_2d);
objj_msgSend(_2b,"sizeToFit");
}
}),new objj_method(sel_getUid("didMoveToSuperview"),function(_2e,_2f){
with(_2e){
objj_msgSend(_2e,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_30,_31){
with(_30){
var _32=objj_msgSend(objj_msgSend(_30,"superview"),"superview"),_33=objj_msgSend(_30,"themeState");
objj_msgSend(_30,"setFont:",objj_msgSend(_32,"valueForThemeAttribute:inState:","header-weekday-label-font",_33));
objj_msgSend(_30,"setTextColor:",objj_msgSend(_32,"valueForThemeAttribute:inState:","header-weekday-label-color",_33));
objj_msgSend(_30,"setTextShadowColor:",objj_msgSend(_32,"valueForThemeAttribute:inState:","header-weekday-label-shadow-color",_33));
objj_msgSend(_30,"setTextShadowOffset:",objj_msgSend(_32,"valueForThemeAttribute:inState:","header-weekday-label-shadow-offset",_33));
objj_msgSendSuper({receiver:_30,super_class:objj_getClass("LPCalendarLabel").super_class},"layoutSubviews");
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("labelWithTitle:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(objj_msgSend(LPCalendarLabel,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_37,"setTitle:",_36);
return _37;
}
})]);
var _4=objj_allocateClassPair(CPButton,"LPCalendarHeaderArrowButton"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_38,_39,_3a){
with(_38){
if(_38=objj_msgSendSuper({receiver:_38,super_class:objj_getClass("LPCalendarHeaderArrowButton").super_class},"initWithFrame:",_3a)){
objj_msgSend(_38,"setValue:forThemeAttribute:",CGSizeMake(16,16),"min-size");
objj_msgSend(_38,"setValue:forThemeAttribute:",CGSizeMake(16,16),"max-size");
}
return _38;
}
}),new objj_method(sel_getUid("incrementOriginBy:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(_3b,"frame").origin;
_3e.y+=_3d;
objj_msgSend(_3b,"setFrameOrigin:",_3e);
}
}),new objj_method(sel_getUid("trackMouse:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(_41,"type");
if(_42===CPLeftMouseDown){
objj_msgSend(_3f,"incrementOriginBy:",1);
}else{
if(_42===CPLeftMouseUp){
objj_msgSend(_3f,"incrementOriginBy:",-1);
}
}
objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("LPCalendarHeaderArrowButton").super_class},"trackMouse:",_41);
}
})]);
p;21;LPCalendarMonthView.jt;16417;@STATIC;1.0;I;18;AppKit/CPControl.jI;15;AppKit/CPView.jI;19;Foundation/CPDate.jt;16330;
objj_executeFile("AppKit/CPControl.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("Foundation/CPDate.j",NO);
var _1=objj_msgSend(CPDate,"distantFuture");
var _2=objj_getClass("CPDate");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("daysInMonth"),function(_4,_5){
with(_4){
return 32-new Date(_4.getFullYear(),_4.getMonth(),32).getDate();
}
}),new objj_method(sel_getUid("resetToMidnight"),function(_6,_7){
with(_6){
_6.setHours(0);
_6.setMinutes(0);
_6.setSeconds(0);
_6.setMilliseconds(0);
}
})]);
LPCalendarDayLength=1;
LPCalendarWeekLength=2;
var _8={};
var _2=objj_allocateClassPair(CPView,"LPCalendarMonthView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("dayTiles"),new objj_ivar("date"),new objj_ivar("previousMonth"),new objj_ivar("nextMonth"),new objj_ivar("_dataIsDirty"),new objj_ivar("allowsMultipleSelection"),new objj_ivar("startSelectionIndex"),new objj_ivar("currentSelectionIndex"),new objj_ivar("selectionLengthType"),new objj_ivar("selection"),new objj_ivar("highlightCurrentPeriod"),new objj_ivar("weekStartsOnMonday"),new objj_ivar("_delegate"),new objj_ivar("calendarView"),new objj_ivar("hiddenRows")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("date"),function(_9,_a){
with(_9){
return date;
}
}),new objj_method(sel_getUid("setDate:"),function(_b,_c,_d){
with(_b){
date=_d;
}
}),new objj_method(sel_getUid("previousMonth"),function(_e,_f){
with(_e){
return previousMonth;
}
}),new objj_method(sel_getUid("nextMonth"),function(_10,_11){
with(_10){
return nextMonth;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_12,_13){
with(_12){
return allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_14,_15,_16){
with(_14){
allowsMultipleSelection=_16;
}
}),new objj_method(sel_getUid("selectionLengthType"),function(_17,_18){
with(_17){
return selectionLengthType;
}
}),new objj_method(sel_getUid("setSelectionLengthType:"),function(_19,_1a,_1b){
with(_19){
selectionLengthType=_1b;
}
}),new objj_method(sel_getUid("highlightCurrentPeriod"),function(_1c,_1d){
with(_1c){
return highlightCurrentPeriod;
}
}),new objj_method(sel_getUid("setHighlightCurrentPeriod:"),function(_1e,_1f,_20){
with(_1e){
highlightCurrentPeriod=_20;
}
}),new objj_method(sel_getUid("weekStartsOnMonday"),function(_21,_22){
with(_21){
return weekStartsOnMonday;
}
}),new objj_method(sel_getUid("setWeekStartsOnMonday:"),function(_23,_24,_25){
with(_23){
weekStartsOnMonday=_25;
}
}),new objj_method(sel_getUid("delegate"),function(_26,_27){
with(_26){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_28,_29,_2a){
with(_28){
_delegate=_2a;
}
}),new objj_method(sel_getUid("calendarView"),function(_2b,_2c){
with(_2b){
return calendarView;
}
}),new objj_method(sel_getUid("setCalendarView:"),function(_2d,_2e,_2f){
with(_2d){
calendarView=_2f;
}
}),new objj_method(sel_getUid("hiddenRows"),function(_30,_31){
with(_30){
return hiddenRows;
}
}),new objj_method(sel_getUid("setHiddenRows:"),function(_32,_33,_34){
with(_32){
hiddenRows=_34;
}
}),new objj_method(sel_getUid("initWithFrame:calendarView:"),function(_35,_36,_37,_38){
with(_35){
if(_35=objj_msgSendSuper({receiver:_35,super_class:objj_getClass("LPCalendarMonthView").super_class},"initWithFrame:",_37)){
calendarView=_38;
selectionLengthType=LPCalendarDayLength;
selection=objj_msgSend(CPArray,"array");
weekStartsOnMonday=YES;
hiddenRows=[];
for(var i=0;i<42;i++){
objj_msgSend(_35,"addSubview:",objj_msgSend(LPCalendarDayView,"dayViewWithCalendarView:",_38));
}
}
return _35;
}
}),new objj_method(sel_getUid("setAllTilesAsFiller"),function(_39,_3a){
with(_39){
objj_msgSend(_39,"setDate:",objj_msgSend(CPDate,"distantFuture"));
}
}),new objj_method(sel_getUid("setDate:"),function(_3b,_3c,_3d){
with(_3b){
if(date&&date.getFullYear()===_3d.getFullYear()&&date.getMonth()===_3d.getMonth()){
return;
}
date=objj_msgSend(_3d,"copy");
if(!objj_msgSend(_3d,"isEqualToDate:",_1)){
date.setDate(1);
objj_msgSend(date,"resetToMidnight");
_firstDay=objj_msgSend(date,"copy");
_firstDay.setDate(1);
previousMonth=new Date(_firstDay.getTime()-86400000);
nextMonth=new Date(_firstDay.getTime()+((objj_msgSend(date,"daysInMonth")+1)*86400000));
}
objj_msgSend(_3b,"reloadData");
}
}),new objj_method(sel_getUid("setSelectionLengthType:"),function(_3e,_3f,_40){
with(_3e){
if(selectionLengthType===_40){
return;
}
selectionLengthType=_40;
objj_msgSend(_3e,"reloadData");
}
}),new objj_method(sel_getUid("tileSize"),function(_41,_42){
with(_41){
var _43=objj_msgSend(calendarView,"currentValueForThemeAttribute:","tile-size");
if(_43){
return _43;
}else{
var _44=objj_msgSend(_41,"bounds");
return CGSizeMake(CGRectGetWidth(_44)/7,CGRectGetHeight(_44)/6);
}
}
}),new objj_method(sel_getUid("startOfWeekForDate:"),function(_45,_46,_47){
with(_45){
var day=_47.getDay();
if(weekStartsOnMonday){
if(day==0){
day=6;
}else{
if(day>0){
day-=1;
}
}
}
return day;
}
}),new objj_method(sel_getUid("startAndEndOfWeekForDate:"),function(_48,_49,_4a){
with(_48){
_cached=_8[_4a.toString()];
if(_cached){
return _cached;
}
var _4b=new Date(_4a.getTime()-(objj_msgSend(_48,"startOfWeekForDate:",_4a)*86400000)),_4c=new Date(_4b.getTime()+(6*86400000));
_8[_4a.toString()]=[_4b,_4c];
return [_4b,_4c];
}
}),new objj_method(sel_getUid("dateIsWithinCurrentPeriod:"),function(_4d,_4e,_4f){
with(_4d){
var _50=objj_msgSend(CPDate,"date");
objj_msgSend(_50,"resetToMidnight");
if(selectionLengthType===LPCalendarDayLength){
return (_50.getDate()===_4f.getDate()&&_50.getMonth()===_4f.getMonth()&&_50.getFullYear()===_4f.getFullYear());
}
if(selectionLengthType===LPCalendarWeekLength){
var _51=objj_msgSend(_4d,"startAndEndOfWeekForDate:",_50);
return ((objj_msgSend(_51,"objectAtIndex:",0)<=_4f)&&(objj_msgSend(_51,"objectAtIndex:",1)>=_4f));
}
return NO;
}
}),new objj_method(sel_getUid("setHiddenRows:"),function(_52,_53,_54){
with(_52){
if(objj_msgSend(hiddenRows,"isEqualToArray:",_54)){
return;
}
hiddenRows=_54;
var _55=objj_msgSend(_52,"subviews"),_56=0,_57=!_54;
for(var _58=0;_58<6;_58++){
var _59=_57||objj_msgSend(hiddenRows,"indexOfObject:",_58)>-1;
for(var _5a=0;_5a<7;_5a++){
objj_msgSend(_55[_56],"setHidden:",_59);
_56+=1;
}
}
}
}),new objj_method(sel_getUid("reloadData"),function(_5b,_5c){
with(_5b){
if(!date){
return;
}
var _5d=date.getTime()==_1.getTime(),_5e=date,_5f=objj_msgSend(_5b,"startOfWeekForDate:",_5e),_60=objj_msgSend(_5e,"daysInMonth");
var _61=objj_msgSend(previousMonth,"daysInMonth"),_62=_61-_5f;
var _63=objj_msgSend(_5b,"subviews"),_64=0;
var _65=new Date(previousMonth.getFullYear(),previousMonth.getMonth(),_62);
for(var _66=0;_66<6;_66++){
for(var _67=0;_67<7;_67++){
var _68=_63[_64];
_65.setTime(_65.getTime()+90000000);
objj_msgSend(_65,"resetToMidnight");
if(!_68._isHidden){
objj_msgSend(_68,"setIsFillerTile:",(_5d)?YES:_65.getMonth()!=_5e.getMonth());
objj_msgSend(_68,"setDate:",_65);
if(!_5d){
objj_msgSend(_68,"setHighlighted:",objj_msgSend(_5b,"dateIsWithinCurrentPeriod:",_65));
}
}
_64+=1;
}
}
}
}),new objj_method(sel_getUid("tile"),function(_69,_6a){
with(_69){
var _6b=objj_msgSend(_69,"subviews"),_6c=objj_msgSend(_69,"tileSize"),_6d=0;
if(objj_msgSend(_6b,"count")>0){
for(var _6e=0;_6e<6;_6e++){
for(var _6f=0;_6f<7;_6f++){
var _70=CGRectMake((_6f*_6c.width)+_6f,_6e*_6c.height,_6c.width,_6c.height-1);
objj_msgSend(_6b[_6d],"setFrame:",_70);
_6d+=1;
}
}
}
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(_71,_72){
with(_71){
objj_msgSend(_71,"tile");
}
}),new objj_method(sel_getUid("locationInViewForEvent:"),function(_73,_74,_75){
with(_73){
return objj_msgSend(_73,"convertPoint:fromView:",objj_msgSend(_75,"locationInWindow"),nil);
}
}),new objj_method(sel_getUid("indexOfTileAtPoint:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_76,"tileSize");
var _7a=FLOOR(_78.y/_79.height),_7b=FLOOR(_78.x/_79.width);
if(_7b>6){
_7b=6;
}else{
if(_7b<0){
_7b=0;
}
}
if(_7a>5){
_7a=5;
}else{
if(_7a<0){
_7a=0;
}
}
var _7c=(_7a*7)+_7b;
if(_7c>41){
return 41;
}
return _7c;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_7d,_7e,_7f){
with(_7d){
var _80=objj_msgSend(_7d,"locationInViewForEvent:",_7f),_81=objj_msgSend(_7d,"indexOfTileAtPoint:",_80),_82=objj_msgSend(objj_msgSend(_7d,"subviews"),"objectAtIndex:",_81);
startSelectionIndex=_81;
objj_msgSend(_7d,"makeSelectionWithIndex:end:",startSelectionIndex,nil);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_83,_84,_85){
with(_83){
var _86=objj_msgSend(_83,"locationInViewForEvent:",_85),_87=objj_msgSend(_83,"indexOfTileAtPoint:",_86);
if(currentSelectionIndex==_87){
return;
}
currentSelectionIndex=_87;
if(!allowsMultipleSelection){
startSelectionIndex=currentSelectionIndex;
}
objj_msgSend(_83,"makeSelectionWithIndex:end:",startSelectionIndex,currentSelectionIndex);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_88,_89,_8a){
with(_88){
if(!currentSelectionIndex||startSelectionIndex==currentSelectionIndex){
var _8b=objj_msgSend(objj_msgSend(_88,"superview"),"superview"),_8c=objj_msgSend(objj_msgSend(_88,"subviews"),"objectAtIndex:",startSelectionIndex),_8d=objj_msgSend(_8c,"date"),_8e=_8d.getMonth();
if(_8e==date.getMonth()&&objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"clickCount")===2&&objj_msgSend(_8b,"doubleAction")){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_8b,"doubleAction"),objj_msgSend(_8b,"target"),_8b);
}
if(_8e==previousMonth.getMonth()){
objj_msgSend(_8b,"changeToMonth:",previousMonth);
}
if(_8e==nextMonth.getMonth()){
objj_msgSend(_8b,"changeToMonth:",nextMonth);
}
}else{
currentSelectionIndex=nil;
}
}
}),new objj_method(sel_getUid("makeSelectionWithDate:end:"),function(_8f,_90,_91,_92){
with(_8f){
_91=objj_msgSend(_91,"copy");
_92=objj_msgSend(_92,"copy");
if(!allowsMultipleSelection||_92===nil){
_92=_91;
}
if(selectionLengthType===LPCalendarWeekLength){
var _93=objj_msgSend(_8f,"startAndEndOfWeekForDate:",_91);
_91=_93[0];
_92=_93[1];
}
var _94=[_91,_92];
for(var i=0;i<2;i++){
if(_94[i]){
objj_msgSend(_94[i],"resetToMidnight");
}
}
if(_91>_92){
var _95=_91;
_91=_92;
_92=_95;
}
objj_msgSend(selection,"removeAllObjects");
var _96=objj_msgSend(_8f,"subviews"),_97=objj_msgSend(_96,"count");
for(var i=0;i<_97;i++){
var _98=_96[i],_99=objj_msgSend(_98,"date");
objj_msgSend(_99,"resetToMidnight");
if(_91&&_99>=_91&&_99<=_92){
objj_msgSend(selection,"addObject:",objj_msgSend(objj_msgSend(_98,"date"),"copy"));
objj_msgSend(_98,"setSelected:",YES);
}else{
objj_msgSend(_98,"setSelected:",NO);
}
}
if(objj_msgSend(selection,"count")>0&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("didMakeSelection:"))){
objj_msgSend(_delegate,"didMakeSelection:",selection);
}
}
}),new objj_method(sel_getUid("makeSelectionWithIndex:end:"),function(_9a,_9b,_9c,_9d){
with(_9a){
var _9e=objj_msgSend(_9a,"subviews");
objj_msgSend(_9a,"makeSelectionWithDate:end:",(_9c>-1)?objj_msgSend(objj_msgSend(_9e,"objectAtIndex:",_9c),"date"):nil,(_9d>-1)?objj_msgSend(objj_msgSend(_9e,"objectAtIndex:",_9d),"date"):nil);
}
}),new objj_method(sel_getUid("drawRect:"),function(_9f,_a0,_a1){
with(_9f){
var _a2=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_a3=objj_msgSend(_9f,"bounds"),_a4=CGRectGetWidth(_a3),_a5=CGRectGetHeight(_a3),_a6=objj_msgSend(_9f,"tileSize");
CGContextSetFillColor(_a2,objj_msgSend(calendarView,"currentValueForThemeAttribute:","grid-color"));
for(var i=1;i<6;i++){
CGContextFillRect(_a2,CGRectMake(0,i*_a6.height-1,_a4,1));
}
for(var i=0;i<7;i++){
CGContextFillRect(_a2,CGRectMake((i-1)+(i*_a6.width),0,1,_a5));
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeClass"),function(_a7,_a8){
with(_a7){
return "lp-calendar-month-view";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_a9,_aa){
with(_a9){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil],["grid-color"]);
}
})]);
var _2=objj_allocateClassPair(CPControl,"LPCalendarDayView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("date"),new objj_ivar("textField"),new objj_ivar("isFillerTile"),new objj_ivar("isSelected"),new objj_ivar("isHighlighted"),new objj_ivar("calendarView")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("date"),function(_ab,_ac){
with(_ab){
return date;
}
}),new objj_method(sel_getUid("setDate:"),function(_ad,_ae,_af){
with(_ad){
date=_af;
}
}),new objj_method(sel_getUid("isFillerTile"),function(_b0,_b1){
with(_b0){
return isFillerTile;
}
}),new objj_method(sel_getUid("setIsFillerTile:"),function(_b2,_b3,_b4){
with(_b2){
isFillerTile=_b4;
}
}),new objj_method(sel_getUid("isSelected"),function(_b5,_b6){
with(_b5){
return isSelected;
}
}),new objj_method(sel_getUid("setSelected:"),function(_b7,_b8,_b9){
with(_b7){
isSelected=_b9;
}
}),new objj_method(sel_getUid("isHighlighted"),function(_ba,_bb){
with(_ba){
return isHighlighted;
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_bc,_bd,_be){
with(_bc){
isHighlighted=_be;
}
}),new objj_method(sel_getUid("calendarView"),function(_bf,_c0){
with(_bf){
return calendarView;
}
}),new objj_method(sel_getUid("setCalendarView:"),function(_c1,_c2,_c3){
with(_c1){
calendarView=_c3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_c4,_c5,_c6){
with(_c4){
if(_c4=objj_msgSendSuper({receiver:_c4,super_class:objj_getClass("LPCalendarDayView").super_class},"initWithFrame:",_c6)){
objj_msgSend(_c4,"setHitTests:",NO);
date=objj_msgSend(CPDate,"date");
textField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(textField,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_c4,"addSubview:",textField);
}
return _c4;
}
}),new objj_method(sel_getUid("setSelected:"),function(_c7,_c8,_c9){
with(_c7){
if(isSelected===_c9){
return;
}
isSelected=_c9;
if(_c9){
objj_msgSend(_c7,"setThemeState:",CPThemeStateSelected);
}else{
objj_msgSend(_c7,"unsetThemeState:",CPThemeStateSelected);
}
}
}),new objj_method(sel_getUid("setIsFillerTile:"),function(_ca,_cb,_cc){
with(_ca){
if(isFillerTile===_cc){
return;
}
isFillerTile=_cc;
if(isFillerTile){
objj_msgSend(_ca,"setThemeState:",CPThemeStateDisabled);
}else{
objj_msgSend(_ca,"unsetThemeState:",CPThemeStateDisabled);
}
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_cd,_ce,_cf){
with(_cd){
if(isHighlighted===_cf){
return;
}
isHighlighted=_cf;
if(_cf){
objj_msgSend(_cd,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_cd,"unsetThemeState:",CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("setDate:"),function(_d0,_d1,_d2){
with(_d0){
if(date.getTime()===_d2.getTime()){
return;
}
date.setTime(_d2.getTime());
objj_msgSend(textField,"setStringValue:",objj_msgSend(date.getDate(),"stringValue"));
objj_msgSend(textField,"sizeToFit");
var _d3=objj_msgSend(_d0,"bounds");
objj_msgSend(textField,"setCenter:",CGPointMake(CGRectGetMidX(_d3),CGRectGetMidY(_d3)));
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_d4,_d5){
with(_d4){
var _d6=objj_msgSend(_d4,"themeState");
objj_msgSend(_d4,"setBackgroundColor:",objj_msgSend(calendarView,"valueForThemeAttribute:inState:","tile-bezel-color",_d6));
objj_msgSend(textField,"setFont:",objj_msgSend(calendarView,"valueForThemeAttribute:inState:","tile-font",_d6));
objj_msgSend(textField,"setTextColor:",objj_msgSend(calendarView,"valueForThemeAttribute:inState:","tile-text-color",_d6));
objj_msgSend(textField,"setTextShadowColor:",objj_msgSend(calendarView,"valueForThemeAttribute:inState:","tile-text-shadow-color",_d6));
objj_msgSend(textField,"setTextShadowOffset:",objj_msgSend(calendarView,"valueForThemeAttribute:inState:","tile-text-shadow-offset",_d6));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeClass"),function(_d7,_d8){
with(_d7){
return "lp-calendar-day-view";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_d9,_da){
with(_d9){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,nil],["background-color","bezel-color"]);
}
}),new objj_method(sel_getUid("dayViewWithCalendarView:"),function(_db,_dc,_dd){
with(_db){
var _de=objj_msgSend(objj_msgSend(_db,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_de,"setCalendarView:",_dd);
return _de;
}
})]);
p;16;LPCalendarView.jt;8704;@STATIC;1.0;I;18;AppKit/CPControl.jI;28;LPKit/LPCalendarHeaderView.jI;27;LPKit/LPCalendarMonthView.jI;19;LPKit/LPSlideView.jt;8573;
objj_executeFile("AppKit/CPControl.j",NO);
objj_executeFile("LPKit/LPCalendarHeaderView.j",NO);
objj_executeFile("LPKit/LPCalendarMonthView.j",NO);
objj_executeFile("LPKit/LPSlideView.j",NO);
var _1=objj_allocateClassPair(CPView,"LPCalendarView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("headerView"),new objj_ivar("slideView"),new objj_ivar("currentMonthView"),new objj_ivar("firstMonthView"),new objj_ivar("secondMonthView"),new objj_ivar("fullSelection"),new objj_ivar("_delegate"),new objj_ivar("_target"),new objj_ivar("_doubleAction")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("headerView"),function(_3,_4){
with(_3){
return headerView;
}
}),new objj_method(sel_getUid("fullSelection"),function(_5,_6){
with(_5){
return fullSelection;
}
}),new objj_method(sel_getUid("delegate"),function(_7,_8){
with(_7){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_9,_a,_b){
with(_9){
_delegate=_b;
}
}),new objj_method(sel_getUid("target"),function(_c,_d){
with(_c){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_e,_f,_10){
with(_e){
_target=_10;
}
}),new objj_method(sel_getUid("doubleAction"),function(_11,_12){
with(_11){
return _doubleAction;
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_13,_14,_15){
with(_13){
_doubleAction=_15;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_16,_17,_18){
with(_16){
if(_16=objj_msgSendSuper({receiver:_16,super_class:objj_getClass("LPCalendarView").super_class},"initWithFrame:",_18)){
fullSelection=[nil,nil];
var _19=objj_msgSend(_16,"bounds");
headerView=objj_msgSend(objj_msgSend(LPCalendarHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_19),40));
objj_msgSend(objj_msgSend(headerView,"prevButton"),"setTarget:",_16);
objj_msgSend(objj_msgSend(headerView,"prevButton"),"setAction:",sel_getUid("didClickPrevButton:"));
objj_msgSend(objj_msgSend(headerView,"nextButton"),"setTarget:",_16);
objj_msgSend(objj_msgSend(headerView,"nextButton"),"setAction:",sel_getUid("didClickNextButton:"));
objj_msgSend(_16,"addSubview:",headerView);
slideView=objj_msgSend(objj_msgSend(LPSlideView,"alloc"),"initWithFrame:",CGRectMake(0,40,CGRectGetWidth(_19),CGRectGetHeight(_19)-40));
objj_msgSend(slideView,"setSlideDirection:",LPSlideViewVerticalDirection);
objj_msgSend(slideView,"setDelegate:",_16);
objj_msgSend(slideView,"setAnimationCurve:",CPAnimationEaseOut);
objj_msgSend(slideView,"setAnimationDuration:",0.2);
objj_msgSend(_16,"addSubview:",slideView);
firstMonthView=objj_msgSend(objj_msgSend(LPCalendarMonthView,"alloc"),"initWithFrame:calendarView:",objj_msgSend(slideView,"bounds"),_16);
objj_msgSend(firstMonthView,"setDelegate:",_16);
objj_msgSend(slideView,"addSubview:",firstMonthView);
secondMonthView=objj_msgSend(objj_msgSend(LPCalendarMonthView,"alloc"),"initWithFrame:calendarView:",objj_msgSend(slideView,"bounds"),_16);
objj_msgSend(secondMonthView,"setDelegate:",_16);
objj_msgSend(slideView,"addSubview:",secondMonthView);
currentMonthView=firstMonthView;
objj_msgSend(_16,"setMonth:",objj_msgSend(CPDate,"date"));
objj_msgSend(_16,"setNeedsLayout");
}
return _16;
}
}),new objj_method(sel_getUid("selectDate:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"setMonth:",_1c);
objj_msgSend(_1a,"makeSelectionWithDate:end:",_1c,_1c);
}
}),new objj_method(sel_getUid("setMonth:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(currentMonthView,"setDate:",_1f);
objj_msgSend(headerView,"setDate:",_1f);
}
}),new objj_method(sel_getUid("monthViewForMonth:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(firstMonthView,"isHidden")?firstMonthView:secondMonthView;
objj_msgSend(_23,"setHiddenRows:",[]);
objj_msgSend(_23,"setDate:",_22);
objj_msgSend(_23,"makeSelectionWithDate:end:",fullSelection[0],objj_msgSend(fullSelection,"lastObject"));
return _23;
}
}),new objj_method(sel_getUid("changeToMonth:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(_24,"monthViewForMonth:",_26),_28=currentMonthView;
if(objj_msgSend(currentMonthView,"date").getTime()>_26.getTime()){
var _29=LPSlideViewPositiveDirection,_2a=0.335,_2b=[0,1];
}else{
var _29=LPSlideViewNegativeDirection,_2a=0.34,_2b=[4,5];
}
currentMonthView=_27;
objj_msgSend(currentMonthView,"setFrameOrigin:",CGPointMake(-500,-500));
objj_msgSend(currentMonthView,"setHidden:",NO);
objj_msgSend(currentMonthView,"setNeedsDisplay:",YES);
objj_msgSend(headerView,"setDate:",_26);
setTimeout(function(){
objj_msgSend(_28,"setHiddenRows:",_2b);
objj_msgSend(slideView,"slideToView:direction:animationProgress:",_27,_29,_2a);
},10);
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(firstMonthView,"setAllowsMultipleSelection:",_2e);
objj_msgSend(secondMonthView,"setAllowsMultipleSelection:",_2e);
}
}),new objj_method(sel_getUid("setHighlightCurrentPeriod:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(firstMonthView,"setHighlightCurrentPeriod:",_31);
objj_msgSend(secondMonthView,"setHighlightCurrentPeriod:",_31);
}
}),new objj_method(sel_getUid("setSelectionLengthType:"),function(_32,_33,_34){
with(_32){
objj_msgSend(firstMonthView,"setSelectionLengthType:",_34);
objj_msgSend(secondMonthView,"setSelectionLengthType:",_34);
}
}),new objj_method(sel_getUid("setWeekStartsOnMonday:"),function(_35,_36,_37){
with(_35){
objj_msgSend(headerView,"setWeekStartsOnMonday:",_37);
objj_msgSend(firstMonthView,"setWeekStartsOnMonday:",_37);
objj_msgSend(secondMonthView,"setWeekStartsOnMonday:",_37);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_38,_39){
with(_38){
var _3a=CGRectGetWidth(objj_msgSend(_38,"bounds")),_3b=objj_msgSend(_38,"currentValueForThemeAttribute:","header-height");
objj_msgSend(headerView,"setFrameSize:",CGSizeMake(_3a,_3b));
objj_msgSend(slideView,"setFrame:",CGRectMake(0,_3b,_3a,CGRectGetHeight(objj_msgSend(_38,"bounds"))-_3b));
objj_msgSend(slideView,"setBackgroundColor:",objj_msgSend(_38,"currentValueForThemeAttribute:","background-color"));
}
}),new objj_method(sel_getUid("didClickPrevButton:"),function(_3c,_3d,_3e){
with(_3c){
if(objj_msgSend(slideView,"isSliding")){
return;
}
objj_msgSend(_3c,"changeToMonth:",objj_msgSend(currentMonthView,"previousMonth"));
}
}),new objj_method(sel_getUid("didClickNextButton:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(slideView,"isSliding")){
return;
}
objj_msgSend(_3f,"changeToMonth:",objj_msgSend(currentMonthView,"nextMonth"));
}
}),new objj_method(sel_getUid("makeSelectionWithDate:end:"),function(_42,_43,_44,_45){
with(_42){
objj_msgSend(currentMonthView,"makeSelectionWithDate:end:",_44,_45);
}
}),new objj_method(sel_getUid("didMakeSelection:"),function(_46,_47,_48){
with(_46){
if(objj_msgSend(_48,"count")<=1){
objj_msgSend(_48,"addObject:",nil);
}
if(objj_msgSend(fullSelection,"isEqualToArray:",_48)){
return;
}
fullSelection=objj_msgSend(CPArray,"arrayWithArray:",_48);
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("calendarView:didMakeSelection:end:"))){
objj_msgSend(_delegate,"calendarView:didMakeSelection:end:",_46,objj_msgSend(fullSelection,"objectAtIndex:",0),objj_msgSend(fullSelection,"lastObject"));
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_49,_4a){
with(_49){
return "lp-calendar-view";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_4b,_4c){
with(_4b){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),CGSizeMake(0,0),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),40,objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),30,objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null")],["background-color","grid-color","tile-size","tile-font","tile-text-color","tile-text-shadow-color","tile-text-shadow-offset","tile-bezel-color","header-button-offset","header-prev-button-image","header-next-button-image","header-height","header-background-color","header-font","header-text-color","header-text-shadow-color","header-text-shadow-offset","header-alignment","header-weekday-offset","header-weekday-label-font","header-weekday-label-color","header-weekday-label-shadow-color","header-weekday-label-shadow-offset"]);
}
})]);
p;13;LPChartView.jt;17894;@STATIC;1.0;I;15;AppKit/CPView.jt;17854;
objj_executeFile("AppKit/CPView.j",NO);
var _1=20,_2=5;
var _3=objj_allocateClassPair(CPView,"LPChartView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("dataSource"),new objj_ivar("delegate"),new objj_ivar("drawView"),new objj_ivar("gridView"),new objj_ivar("labelView"),new objj_ivar("displayLabels"),new objj_ivar("_data"),new objj_ivar("_maxValue"),new objj_ivar("_framesSet"),new objj_ivar("_currentSize"),new objj_ivar("_maxValuePosition"),new objj_ivar("_minValuePosition")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("dataSource"),function(_5,_6){
with(_5){
return dataSource;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_7,_8,_9){
with(_7){
dataSource=_9;
}
}),new objj_method(sel_getUid("delegate"),function(_a,_b){
with(_a){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_c,_d,_e){
with(_c){
delegate=_e;
}
}),new objj_method(sel_getUid("drawView"),function(_f,_10){
with(_f){
return drawView;
}
}),new objj_method(sel_getUid("setDrawView:"),function(_11,_12,_13){
with(_11){
drawView=_13;
}
}),new objj_method(sel_getUid("gridView"),function(_14,_15){
with(_14){
return gridView;
}
}),new objj_method(sel_getUid("setGridView:"),function(_16,_17,_18){
with(_16){
gridView=_18;
}
}),new objj_method(sel_getUid("labelView"),function(_19,_1a){
with(_19){
return labelView;
}
}),new objj_method(sel_getUid("displayLabels"),function(_1b,_1c){
with(_1b){
return displayLabels;
}
}),new objj_method(sel_getUid("setDisplayLabels:"),function(_1d,_1e,_1f){
with(_1d){
displayLabels=_1f;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_20,_21,_22){
with(_20){
if(_20=objj_msgSendSuper({receiver:_20,super_class:objj_getClass("LPChartView").super_class},"initWithFrame:",_22)){
objj_msgSend(_20,"_setup");
}
return _20;
}
}),new objj_method(sel_getUid("_setup"),function(_23,_24){
with(_23){
_maxValuePosition=1;
_minValuePosition=0;
gridView=objj_msgSend(objj_msgSend(LPChartGridView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(gridView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_23,"addSubview:",gridView);
var _25=objj_msgSend(_23,"bounds");
labelView=objj_msgSend(objj_msgSend(LPChartLabelView,"alloc"),"initWithFrame:",CGRectMake(_2,CGRectGetHeight(_25)-_1,CGRectGetWidth(_25)-(2*_2),_1));
objj_msgSend(_23,"addSubview:",labelView);
_currentSize=CGSizeMake(0,0);
}
}),new objj_method(sel_getUid("setDataSource:"),function(_26,_27,_28){
with(_26){
dataSource=_28;
}
}),new objj_method(sel_getUid("setDrawView:"),function(_29,_2a,_2b){
with(_29){
if(_2b===drawView){
return;
}
if(drawView){
objj_msgSend(drawView,"removeFromSuperview");
}
objj_msgSend(_29,"addSubview:positioned:relativeTo:",_2b,CPWindowAbove,gridView);
drawView=_2b;
var _2c=CGRectInset(objj_msgSend(_29,"bounds"),_2,_2);
if(labelView){
_2c.size.height-=CGRectGetHeight(objj_msgSend(labelView,"bounds"));
}
objj_msgSend(drawView,"setFrame:",_2c);
objj_msgSend(drawView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_2c.size.height+=1;
objj_msgSend(gridView,"setFrame:",_2c);
if(objj_msgSend(_29,"window")){
objj_msgSend(_29,"reloadData");
}
}
}),new objj_method(sel_getUid("setGridView:"),function(_2d,_2e,_2f){
with(_2d){
if(gridView===_2f){
return;
}
objj_msgSend(_2f,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_2d,"replaceSubview:with:",gridView,_2f);
gridView=_2f;
}
}),new objj_method(sel_getUid("setDisplayLabels:"),function(_30,_31,_32){
with(_30){
if(!displayLabels&&labelView){
var _33=objj_msgSend(drawView,"frame");
_33.size.height+=CGRectGetHeight(objj_msgSend(labelView,"bounds"));
objj_msgSend(drawView,"setFrame:",_33);
objj_msgSend(labelView,"removeFromSuperview");
}else{
labelView=objj_msgSend(objj_msgSend(LPChartLabelView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetHeight(aFrame)-_1,CGRectGetWidth(aFrame),_1));
objj_msgSend(_30,"addSubview:",labelView);
}
displayLabels=_32;
}
}),new objj_method(sel_getUid("setDisplayGrid:"),function(_34,_35,_36){
with(_34){
objj_msgSend(gridView,"setHidden:",!_36);
}
}),new objj_method(sel_getUid("setMaxValuePosition:minValuePosition:"),function(_37,_38,_39,_3a){
with(_37){
_maxValuePosition=_39;
_minValuePosition=_3a;
objj_msgSend(objj_msgSend(_37,"drawView"),"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("itemFrames"),function(_3b,_3c){
with(_3b){
return (dataSource&&drawView&&_data)?objj_msgSend(_3b,"calculateItemFramesWithSets:maxValue:",_data,_maxValue):objj_msgSend(CPArray,"array");
}
}),new objj_method(sel_getUid("reloadData"),function(_3d,_3e){
with(_3d){
if(!dataSource||!drawView){
return;
}
_data=objj_msgSend(CPArray,"array");
_maxValue=0;
var _3f=objj_msgSend(dataSource,"numberOfSetsInChart:",_3d);
for(var _40=0;_40<_3f;_40++){
var row=[],_41=objj_msgSend(dataSource,"chart:numberOfValuesInSet:",_3d,_40);
for(var _42=0;_42<_41;_42++){
var _43=objj_msgSend(dataSource,"chart:valueForIndex:set:",_3d,_42,_40);
if(_43>_maxValue){
_maxValue=_43;
}
row.push(_43);
}
_data.push(row);
}
_currentSize=nil;
objj_msgSend(gridView,"setNeedsDisplay:",YES);
objj_msgSend(labelView,"reloadData");
objj_msgSend(drawView,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("calculateItemFramesWithSets:maxValue:"),function(_44,_45,_46,_47){
with(_44){
var _48=objj_msgSend(drawView,"bounds").size,_49=(1-_maxValuePosition)*_48.height;
if(_minValuePosition!==0){
_48.height-=_minValuePosition*_48.height;
}
if(_maxValuePosition!==1){
_48.height-=_49;
}
if(_currentSize&&CGSizeEqualToSize(_currentSize,_48)){
return _framesSet;
}
_currentSize=_48;
_framesSet=objj_msgSend(CPArray,"array");
if(!_46.length){
return _framesSet;
}
if(_47===0){
_47=1;
}
var _4a=_48.width,_4b=_48.height-(2*_2),_4c=_46[0].length,_4d=_4a/_4c,_4e=_4a-(_4c*_4d);
for(var _4f=0;_4f<_46.length;_4f++){
var _50=_46[_4f],_51=0,row=[];
for(var _52=0;_52<_50.length;_52++){
var _53=_50[_52],_54=CGRectMake(_51,0,_4d,0);
if(_4e>0){
_54.size.width++;
_4e--;
}
_54.size.height=ROUND((_53/_47)*_4b);
_54.origin.y=_4b-CGRectGetHeight(_54)+_2;
if(_maxValuePosition!==1){
_54.origin.y+=_49;
}
row.push(_54);
_51+=CGRectGetWidth(_54);
}
_framesSet.push(row);
}
return _framesSet;
}
}),new objj_method(sel_getUid("horizontalLabelForIndex:"),function(_55,_56,_57){
with(_55){
return objj_msgSend(dataSource,"chart:labelValueForIndex:",_55,_57);
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_58,_59,_5a){
with(_58){
if(delegate&&objj_msgSend(delegate,"respondsToSelector:",sel_getUid("chart:didMouseOverItemAtIndex:"))){
var _5b=objj_msgSend(_58,"itemFrames");
if(!_5b.length){
return;
}
var _5c=_5b[0],_5d=objj_msgSend(drawView,"convertPoint:fromView:",objj_msgSend(_5a,"locationInWindow"),nil);
for(var i=0;i<_5c.length;i++){
var _5e=_5c[i];
if(_5e.origin.x<=_5d.x&&(_5e.origin.x+_5e.size.width)>_5d.x){
objj_msgSend(delegate,"chart:didMouseOverItemAtIndex:",_58,i);
return;
}
}
}
}
}),new objj_method(sel_getUid("mouseExited:"),function(_5f,_60,_61){
with(_5f){
if(delegate&&objj_msgSend(delegate,"respondsToSelector:",sel_getUid("chart:didMouseOverItemAtIndex:"))){
objj_msgSend(delegate,"chart:didMouseOverItemAtIndex:",_5f,-1);
}
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_62,_63){
with(_62){
objj_msgSend(_62,"reloadData");
}
})]);
var _64="LPChartViewDataSourceKey",_65="LPChartViewDrawViewKey",_66="LPChartViewGridViewKey",_67="LPChartViewDisplayLabelsKey",_68="LPChartViewLabelViewKey",_69="LPChartViewDataKey",_6a="LPChartViewMaxValueKey",_6b="LPChartViewFramesSetKey",_6c="LPChartViewCurrentSizeKey",_6d="LPChartViewMaxValuePositionKey",_6e="LPChartViewMinValuePositionKey";
var _3=objj_getClass("LPChartView");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"LPChartView\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_6f,_70,_71){
with(_6f){
if(_6f=objj_msgSendSuper({receiver:_6f,super_class:objj_getClass("LPChartView").super_class},"initWithCoder:",_71)){
dataSource=objj_msgSend(_71,"decodeObjectForKey:",_64);
gridView=objj_msgSend(_71,"decodeObjectForKey:",_66);
drawView=objj_msgSend(_71,"decodeObjectForKey:",_65);
displayLabels=!objj_msgSend(_71,"containsValueForKey:",_67)||objj_msgSend(_71,"decodeObjectForKey:",_67);
labelView=objj_msgSend(_71,"decodeObjectForKey:",_68);
_data=objj_msgSend(_71,"decodeObjectForKey:",_69);
_maxValue=objj_msgSend(_71,"decodeIntForKey:",_6a);
_framesSet=objj_msgSend(_71,"decodeObjectForKey:",_6b);
_currentSize=objj_msgSend(_71,"decodeSizeForKey:",_6c);
_maxValuePosition=objj_msgSend(_71,"decodeIntForKey:",_6d);
_minValuePosition=objj_msgSend(_71,"decodeFloatForKey:",_6e);
objj_msgSend(_6f,"_setup");
}
return _6f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_72,_73,_74){
with(_72){
objj_msgSendSuper({receiver:_72,super_class:objj_getClass("LPChartView").super_class},"encodeWithCoder:",_74);
objj_msgSend(_74,"encodeObject:forKey:",dataSource,_64);
objj_msgSend(_74,"encodeObject:forKey:",drawView,_65);
objj_msgSend(_74,"encodeObject:forKey:",gridView,_66);
objj_msgSend(_74,"encodeBool:forKey:",displayLabels,_67);
objj_msgSend(_74,"encodeObject:forKey:",labelView,_68);
objj_msgSend(_74,"encodeObject:forKey:",_data,_69);
objj_msgSend(_74,"encodeInt:forKey:",_maxValue,_6a);
objj_msgSend(_74,"encodeObject:forKey:",_framesSet,_6b);
if(_currentSize){
objj_msgSend(_74,"encodeSize:forKey:",_currentSize,_6c);
}
objj_msgSend(_74,"encodeFloat:forKey:",_maxValuePosition,_6d);
objj_msgSend(_74,"encodeFloat:forKey:",_minValuePosition,_6e);
}
})]);
var _3=objj_allocateClassPair(CPView,"LPChartGridView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("gridColor")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("gridColor"),function(_75,_76){
with(_75){
return gridColor;
}
}),new objj_method(sel_getUid("setGridColor:"),function(_77,_78,_79){
with(_77){
gridColor=_79;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7a,_7b,_7c){
with(_7a){
if(_7a=objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("LPChartGridView").super_class},"initWithFrame:",_7c)){
gridColor=objj_msgSend(CPColor,"colorWithWhite:alpha:",0,0.05);
objj_msgSend(_7a,"setHitTests:",NO);
}
return _7a;
}
}),new objj_method(sel_getUid("setGridColor:"),function(_7d,_7e,_7f){
with(_7d){
gridColor=_7f;
objj_msgSend(_7d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_80,_81,_82){
with(_80){
if(itemFrames=objj_msgSend(objj_msgSend(_80,"superview"),"itemFrames")){
var _83=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_84=objj_msgSend(_80,"bounds"),_85=CGRectGetWidth(_84),_86=CGRectGetHeight(_84),_87=1;
CGContextSetFillColor(_83,gridColor);
if(itemFrames.length){
for(var i=0;i<itemFrames[0].length;i++){
CGContextFillRect(_83,CGRectMake(FLOOR(itemFrames[0][i].origin.x),0,_87,_86));
}
}else{
CGContextFillRect(_83,CGRectMake(0,0,_87,_86));
}
CGContextFillRect(_83,CGRectMake(_85-_87,0,_87,_86));
CGContextFillRect(_83,CGRectMake(0,_86-_87,_85,_87));
CGContextFillRect(_83,CGRectMake(0,FLOOR(_86/2),_85,_87));
}
}
})]);
var _3=objj_allocateClassPair(CPView,"LPChartDrawView"),_4=_3.isa;
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_88,_89,_8a){
with(_88){
if(_88=objj_msgSendSuper({receiver:_88,super_class:objj_getClass("LPChartDrawView").super_class},"initWithFrame:",_8a)){
objj_msgSend(_88,"setHitTests:",NO);
}
return _88;
}
}),new objj_method(sel_getUid("drawRect:"),function(_8b,_8c,_8d){
with(_8b){
if(itemFrames=objj_msgSend(objj_msgSend(_8b,"superview"),"itemFrames")){
var _8e=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
objj_msgSend(_8b,"drawSetWithFrames:inContext:",itemFrames,_8e);
}
}
}),new objj_method(sel_getUid("drawSetWithFrames:inContext:"),function(_8f,_90,_91,_92){
with(_8f){
CGContextSetStrokeColor(_92,objj_msgSend(CPColor,"colorWithHexString:","4379ca"));
CGContextSetLineWidth(_92,2);
for(var _93=0;_93<_91.length;_93++){
var _94=_91[_93];
CGContextBeginPath(_92);
for(var _95=0;_95<_94.length;_95++){
var _96=_94[_95],_97=CGPointMake(CGRectGetMidX(_96),CGRectGetMinY(_96));
if(_95==0){
CGContextMoveToPoint(_92,_97.x,_97.y);
}else{
CGContextAddLineToPoint(_92,_97.x,_97.y);
}
}
CGContextStrokePath(_92);
CGContextClosePath(_92);
}
}
})]);
var _3=objj_allocateClassPair(CPView,"LPChartLabelView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("chart"),new objj_ivar("_labelPrototype"),new objj_ivar("_labelData"),new objj_ivar("_cachedLabels")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_98,_99,_9a){
with(_98){
if(_98=objj_msgSendSuper({receiver:_98,super_class:objj_getClass("LPChartLabelView").super_class},"initWithFrame:",_9a)){
objj_msgSend(_98,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
objj_msgSend(_98,"setHitTests:",NO);
objj_msgSend(_98,"setLabelPrototype:",objj_msgSend(LPChartLabel,"labelWithItemIndex:",-1));
}
return _98;
}
}),new objj_method(sel_getUid("setLabelPrototype:"),function(_9b,_9c,_9d){
with(_9b){
_labelPrototype=_9d;
_labelData=nil;
_cachedLabels=objj_msgSend(CPArray,"array");
objj_msgSend(_9b,"reloadData");
}
}),new objj_method(sel_getUid("newLabelWithItemIndex:"),function(_9e,_9f,_a0){
with(_9e){
if(_cachedLabels.length){
var _a1=_cachedLabels.pop();
}else{
if(!_labelData){
if(_labelPrototype){
_labelData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_labelPrototype);
}
}
var _a1=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_labelData);
}
objj_msgSend(_a1,"setItemIndex:",_a0);
return _a1;
}
}),new objj_method(sel_getUid("reloadData"),function(_a2,_a3){
with(_a2){
if(chart){
var _a4=objj_msgSend(_a2,"subviews");
if(numberOfSubviews=_a4.length){
while(numberOfSubviews--){
objj_msgSend(_a4[numberOfSubviews],"removeFromSuperview");
if(_labelData){
_cachedLabels.push(_a4[numberOfSubviews]);
}
}
}
var _a5=objj_msgSend(chart,"itemFrames");
if(_a5&&_a5.length){
_a5=_a5[0];
for(var i=0,_a6=_a5.length;i<_a6;i++){
var _a7=objj_msgSend(_a2,"newLabelWithItemIndex:",i);
objj_msgSend(_a7,"setLabel:",objj_msgSend(chart,"horizontalLabelForIndex:",i));
objj_msgSend(_a2,"addSubview:",_a7);
}
}
objj_msgSend(_a2,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_a8,_a9){
with(_a8){
chart=objj_msgSend(_a8,"superview");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_aa,_ab){
with(_aa){
var _ac=objj_msgSend(chart,"itemFrames");
if(!_ac){
return;
}
var _ad=objj_msgSend(_aa,"subviews"),_ae=_ad.length,_af=objj_msgSend(_aa,"bounds"),_ac=_ac[0],_2=CGRectGetMinX(objj_msgSend(objj_msgSend(chart,"drawView"),"frame")),_b0=CGRectGetMidY(_af);
while(_ae--){
var _b1=_ad[_ae];
objj_msgSend(_b1,"setCenter:",CGPointMake(CGRectGetMidX(_ac[_ae])+_2,_b0));
var _b2=objj_msgSend(_b1,"frame");
if(_b2.origin.x<0){
frameIsDirty=YES;
_b2.origin.x=0;
objj_msgSend(_b1,"setFrame:",_b2);
}else{
if(CGRectGetMaxX(_b2)>_af.size.width){
frameIsDirty=YES;
_b2.origin.x-=CGRectGetMaxX(_b2)-_af.size.width;
objj_msgSend(_b1,"setFrame:",_b2);
}
}
}
}
})]);
var _b3="LPChartLabelViewChartKey",_b4="LPChartLabelViewLabelPrototypeKey";
var _3=objj_getClass("LPChartLabelView");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"LPChartLabelView\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_b5,_b6,_b7){
with(_b5){
if(_b5=objj_msgSendSuper({receiver:_b5,super_class:objj_getClass("LPChartLabelView").super_class},"initWithCoder:",_b7)){
chart=objj_msgSend(_b7,"decodeObjectForKey:",_b3);
_labelPrototype=objj_msgSend(_b7,"decodeObjectForKey:",_b4);
_cachedLabels=objj_msgSend(CPArray,"array");
}
return _b5;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b8,_b9,_ba){
with(_b8){
objj_msgSendSuper({receiver:_b8,super_class:objj_getClass("LPChartLabelView").super_class},"encodeWithCoder:",_ba);
objj_msgSend(_ba,"encodeObject:forKey:",chart,_b3);
objj_msgSend(_ba,"encodeObject:forKey:",_labelPrototype,_b4);
}
})]);
var _3=objj_allocateClassPair(CPTextField,"LPChartLabel"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_itemIndex")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("itemIndex"),function(_bb,_bc){
with(_bb){
return _itemIndex;
}
}),new objj_method(sel_getUid("setItemIndex:"),function(_bd,_be,_bf){
with(_bd){
_itemIndex=_bf;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_c0,_c1,_c2){
with(_c0){
if(_c0=objj_msgSendSuper({receiver:_c0,super_class:objj_getClass("LPChartLabel").super_class},"initWithFrame:",_c2)){
objj_msgSend(_c0,"setHitTests:",NO);
}
return _c0;
}
}),new objj_method(sel_getUid("setLabel:"),function(_c3,_c4,_c5){
with(_c3){
if(_c5!==objj_msgSend(_c3,"stringValue")){
objj_msgSend(_c3,"setStringValue:",_c5);
objj_msgSend(_c3,"sizeToFit");
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("labelWithItemIndex:"),function(_c6,_c7,_c8){
with(_c6){
var _c9=objj_msgSend(objj_msgSend(_c6,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_c9,"setItemIndex:",_c8);
return _c9;
}
})]);
var _ca="LPChartLabelItemIndexKey";
var _3=objj_getClass("LPChartLabel");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"LPChartLabel\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_cb,_cc,_cd){
with(_cb){
if(_cb=objj_msgSendSuper({receiver:_cb,super_class:objj_getClass("LPChartLabel").super_class},"initWithCoder:",_cd)){
_itemIndex=objj_msgSend(_cd,"decodeIntForKey:",_ca);
}
return _cb;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ce,_cf,_d0){
with(_ce){
objj_msgSendSuper({receiver:_ce,super_class:objj_getClass("LPChartLabel").super_class},"encodeWithCoder:",_d0);
objj_msgSend(_d0,"encodeInt:forKey:",_itemIndex,_ca);
}
})]);
p;20;LPCookieController.jt;2475;@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPRange.jt;2405;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPRange.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"LPCookieController"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("setValue:forKey:"),function(_4,_5,_6,_7){
with(_4){
return objj_msgSend(_4,"setValue:forKey:expirationDate:",_6,_7,nil);
}
}),new objj_method(sel_getUid("setValue:forKey:expirationDate:"),function(_8,_9,_a,_b,_c){
with(_8){
return objj_msgSend(_8,"setValue:forKey:expirationDate:path:",_a,_b,_c,nil);
}
}),new objj_method(sel_getUid("setValue:forKey:expirationDate:path:"),function(_d,_e,_f,_10,_11,_12){
with(_d){
return objj_msgSend(_d,"setValue:forKey:expirationDate:path:domain:",_f,_10,_11,_12,nil);
}
}),new objj_method(sel_getUid("setValue:forKey:expirationDate:path:domain:"),function(_13,_14,_15,_16,_17,_18,_19){
with(_13){
return objj_msgSend(_13,"setValue:forKey:expirationDate:path:domain:escape:",_15,_16,_17,_18,nil,YES);
}
}),new objj_method(sel_getUid("setValue:forKey:expirationDate:path:domain:escape:"),function(_1a,_1b,_1c,_1d,_1e,_1f,_20,_21){
with(_1a){
var _22="";
_22+=objj_msgSend(CPString,"stringWithFormat:","%s=%s; ",_1d,_21?escape(_1c):_1c);
if(_1e){
_22+=objj_msgSend(CPString,"stringWithFormat:","expires=%s; ",_1e.toUTCString());
}
_22+=objj_msgSend(CPString,"stringWithFormat:","path=%s; ",_1f||"/");
if(_20){
_22+=objj_msgSend(CPString,"stringWithFormat:","domain=%s; ",_20);
}
_22=objj_msgSend(_22,"substringToIndex:",objj_msgSend(_22,"length")-2);
document.cookie=_22;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(document.cookie,"componentsSeparatedByString:",";");
for(var i=0;i<objj_msgSend(_26,"count");i++){
var _27=objj_msgSend(_26,"objectAtIndex:",i),_28=objj_msgSend(_27,"rangeOfString:options:",objj_msgSend(CPString,"stringWithFormat:","%s=",_25),CPCaseInsensitiveSearch);
if(_28.length>0){
return objj_msgSend(_27,"substringFromIndex:",CPMaxRange(_28));
}
}
return nil;
}
}),new objj_method(sel_getUid("removeValueForKey:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_29,"setValue:forKey:expirationDate:","",_2b,objj_msgSend(CPDate,"distantPast"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedCookieController"),function(_2c,_2d){
with(_2c){
if(!_1){
_1=objj_msgSend(objj_msgSend(_2c,"alloc"),"init");
}
return _1;
}
})]);
p;17;LPCrashReporter.jt;9120;@STATIC;1.0;I;21;Foundation/CPObject.jI;16;AppKit/CPAlert.jI;24;LPKit/LPURLPostRequest.jI;28;LPKit/LPMultiLineTextField.jt;8992;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPAlert.j",NO);
objj_executeFile("LPKit/LPURLPostRequest.j",NO);
objj_executeFile("LPKit/LPMultiLineTextField.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"LPCrashReporter"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_exception")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("exception"),function(_4,_5){
with(_4){
return _exception;
}
}),new objj_method(sel_getUid("setException:"),function(_6,_7,_8){
with(_6){
_exception=_8;
}
}),new objj_method(sel_getUid("didCatchException:"),function(_9,_a,_b){
with(_9){
if(objj_msgSend(_9,"shouldInterceptException")){
if(_exception){
return;
}
_exception=_b;
var _c=objj_msgSend(objj_msgSend(LPCrashReporterOverlayWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask);
objj_msgSend(_c,"setLevel:",CPNormalWindowLevel);
objj_msgSend(_c,"makeKeyAndOrderFront:",nil);
var _d=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_d,"setDelegate:",_9);
objj_msgSend(_d,"setAlertStyle:",CPCriticalAlertStyle);
objj_msgSend(_d,"addButtonWithTitle:","Reload");
objj_msgSend(_d,"addButtonWithTitle:","Report...");
objj_msgSend(_d,"setMessageText:",objj_msgSend(CPString,"stringWithFormat:","The application %@ crashed unexpectedly. Click Reload to load the application again or click Report to send a report to the developer.",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPBundleName")));
objj_msgSend(_d,"runModal");
}else{
_e=NO;
objj_msgSend(_b,"raise");
}
}
}),new objj_method(sel_getUid("shouldInterceptException"),function(_f,_10){
with(_f){
return YES;
}
}),new objj_method(sel_getUid("alertDidEnd:returnCode:"),function(_11,_12,_13,_14){
with(_11){
switch(_14){
case 0:
location.reload();
break;
case 1:
var _15=objj_msgSend(objj_msgSend(LPCrashReporterReportWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,460,309),CPTitledWindowMask|CPResizableWindowMask);
objj_msgSend(CPApp,"runModalForWindow:",_15);
break;
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedErrorLogger"),function(_16,_17){
with(_16){
if(!_1){
_1=objj_msgSend(objj_msgSend(LPCrashReporter,"alloc"),"init");
}
return _1;
}
})]);
var _2=objj_allocateClassPair(CPWindow,"LPCrashReporterOverlayWindow"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_18,_19,_1a,_1b){
with(_18){
if(_18=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("LPCrashReporterOverlayWindow").super_class},"initWithContentRect:styleMask:",_1a,_1b)){
objj_msgSend(objj_msgSend(_18,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0,0.4));
}
return _18;
}
})]);
var _2=objj_allocateClassPair(CPWindow,"LPCrashReporterReportWindow"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("informationLabel"),new objj_ivar("informationTextField"),new objj_ivar("descriptionLabel"),new objj_ivar("descriptionTextField"),new objj_ivar("sendButton"),new objj_ivar("cancelButton"),new objj_ivar("sendingLabel")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_1c,_1d,_1e,_1f){
with(_1c){
if(_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("LPCrashReporterReportWindow").super_class},"initWithContentRect:styleMask:",_1e,_1f)){
var _20=objj_msgSend(_1c,"contentView"),_21=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPBundleName");
objj_msgSend(_1c,"setMinSize:",_1e.size);
objj_msgSend(_1c,"setTitle:",objj_msgSend(CPString,"stringWithFormat:","Problem Report for %@",_21));
informationLabel=objj_msgSend(CPTextField,"labelWithTitle:","Problem and system information:");
objj_msgSend(informationLabel,"setFrameOrigin:",CGPointMake(12,12));
objj_msgSend(_20,"addSubview:",informationLabel);
var _22=objj_msgSend(CPString,"stringWithFormat:","User-Agent: %@\n\nException: %@",navigator.userAgent,objj_msgSend(objj_msgSend(LPCrashReporter,"sharedErrorLogger"),"exception"));
informationTextField=objj_msgSend(LPMultiLineTextField,"textFieldWithStringValue:placeholder:width:",_22,"",0);
objj_msgSend(informationTextField,"setEditable:",NO);
objj_msgSend(informationTextField,"setFrame:",CGRectMake(12,31,CGRectGetWidth(_1e)-24,100));
objj_msgSend(informationTextField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_20,"addSubview:",informationTextField);
descriptionLabel=objj_msgSend(CPTextField,"labelWithTitle:","Please describe what you were doing when the problem happened:");
objj_msgSend(descriptionLabel,"setFrameOrigin:",CGPointMake(12,141));
objj_msgSend(_20,"addSubview:",descriptionLabel);
descriptionTextField=objj_msgSend(LPMultiLineTextField,"textFieldWithStringValue:placeholder:width:","","",0);
objj_msgSend(descriptionTextField,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(informationTextField,"frame")),CGRectGetMaxY(objj_msgSend(descriptionLabel,"frame"))+1,CGRectGetWidth(objj_msgSend(informationTextField,"frame")),100));
objj_msgSend(descriptionTextField,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_20,"addSubview:",descriptionTextField);
sendButton=objj_msgSend(CPButton,"buttonWithTitle:",objj_msgSend(CPString,"stringWithFormat:","Send to %@",_21));
objj_msgSend(sendButton,"setFrameOrigin:",CGPointMake(CGRectGetWidth(_1e)-CGRectGetWidth(objj_msgSend(sendButton,"frame"))-15,270));
objj_msgSend(sendButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(sendButton,"setTarget:",_1c);
objj_msgSend(sendButton,"setAction:",sel_getUid("didClickSendButton:"));
objj_msgSend(_20,"addSubview:",sendButton);
objj_msgSend(_1c,"setDefaultButton:",sendButton);
cancelButton=objj_msgSend(CPButton,"buttonWithTitle:","Cancel");
objj_msgSend(cancelButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(sendButton,"frame"))-CGRectGetWidth(objj_msgSend(cancelButton,"frame"))-12,CGRectGetMinY(objj_msgSend(sendButton,"frame"))));
objj_msgSend(cancelButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(cancelButton,"setTarget:",_1c);
objj_msgSend(cancelButton,"setAction:",sel_getUid("didClickCancelButton:"));
objj_msgSend(_20,"addSubview:",cancelButton);
sendingLabel=objj_msgSend(CPTextField,"labelWithTitle:","Sending Report...");
objj_msgSend(sendingLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",11));
objj_msgSend(sendingLabel,"sizeToFit");
objj_msgSend(sendingLabel,"setFrameOrigin:",CGPointMake(12,CGRectGetMaxY(_1e)-35));
objj_msgSend(sendingLabel,"setHidden:",YES);
objj_msgSend(_20,"addSubview:",sendingLabel);
}
return _1c;
}
}),new objj_method(sel_getUid("orderFront:"),function(_23,_24,_25){
with(_23){
objj_msgSendSuper({receiver:_23,super_class:objj_getClass("LPCrashReporterReportWindow").super_class},"orderFront:",_25);
objj_msgSend(_23,"makeFirstResponder:",descriptionTextField);
}
}),new objj_method(sel_getUid("didClickSendButton:"),function(_26,_27,_28){
with(_26){
objj_msgSend(informationTextField,"setEnabled:",NO);
objj_msgSend(descriptionTextField,"setEnabled:",NO);
objj_msgSend(sendButton,"setEnabled:",NO);
objj_msgSend(cancelButton,"setEnabled:",NO);
objj_msgSend(informationLabel,"setAlphaValue:",0.5);
objj_msgSend(descriptionLabel,"setAlphaValue:",0.5);
objj_msgSend(sendingLabel,"setHidden:",NO);
var _29=objj_msgSend(CPURL,"URLWithString:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","LPCrashReporterLoggingURL")||"/"),_2a=objj_msgSend(LPURLPostRequest,"requestWithURL:",_29),_2b=objj_msgSend(objj_msgSend(LPCrashReporter,"sharedErrorLogger"),"exception"),_2c={"name":objj_msgSend(_2b,"name"),"reason":objj_msgSend(_2b,"reason"),"userAgent":navigator.userAgent,"description":objj_msgSend(descriptionTextField,"stringValue")};
objj_msgSend(_2a,"setContent:",_2c);
objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_2a,_26);
}
}),new objj_method(sel_getUid("didClickCancelButton:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(objj_msgSend(LPCrashReporter,"sharedErrorLogger"),"alertDidEnd:returnCode:",nil,0);
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_30,_31,_32,_33){
with(_30){
objj_msgSend(CPApp,"stopModal");
objj_msgSend(_30,"orderOut:",nil);
var _34=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_34,"setDelegate:",objj_msgSend(LPCrashReporter,"sharedErrorLogger"));
objj_msgSend(_34,"setAlertStyle:",CPInformationalAlertStyle);
objj_msgSend(_34,"addButtonWithTitle:","Thanks!");
objj_msgSend(_34,"setMessageText:","Your report has been sent.");
objj_msgSend(_34,"runModal");
}
})]);
var _35=objj_msgSend,_e=YES;
objj_msgSend=function(){
if(!_e){
return _35.apply(this,arguments);
}
try{
return _35.apply(this,arguments);
}
catch(anException){
objj_msgSend(objj_msgSend(LPCrashReporter,"sharedErrorLogger"),"didCatchException:",anException);
return nil;
}
};
p;9;LPEmail.jt;1698;@STATIC;1.0;I;21;Foundation/CPObject.jt;1653;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=new RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$");
var _2=objj_allocateClassPair(CPObject,"LPEmail"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("email")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithString:"),function(_4,_5,_6){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("LPEmail").super_class},"init")){
email=_6;
}
return _4;
}
}),new objj_method(sel_getUid("stringValue"),function(_7,_8){
with(_7){
return email;
}
}),new objj_method(sel_getUid("isValidEmail"),function(_9,_a){
with(_9){
return objj_msgSend(LPEmail,"emailWithStringIsValid:",email);
}
}),new objj_method(sel_getUid("isEqualToEmail:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(objj_msgSend(_b,"stringValue"),"isEqualToString:",objj_msgSend(_d,"stringValue"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("emailWithString:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(objj_msgSend(_e,"alloc"),"initWithString:",_10);
}
}),new objj_method(sel_getUid("emailWithStringIsValid:"),function(_11,_12,_13){
with(_11){
return _1.test(_13);
}
})]);
var _14="LPEmailKey";
var _2=objj_getClass("LPEmail");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"LPEmail\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_15,_16,_17){
with(_15){
if(_15){
email=objj_msgSend(_17,"decodeObjectForKey:",_14);
}
return _15;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_1a,"encodeObject:forKey:",email,_14);
}
})]);
p;7;LPKit.jt;889;@STATIC;1.0;I;22;LPKit/LPAnchorButton.jI;22;LPKit/LPCalendarView.jI;19;LPKit/LPChartView.jI;26;LPKit/LPCookieController.jI;15;LPKit/LPEmail.jI;28;LPKit/LPLocationController.jI;22;LPKit/LPPieChartView.jI;19;LPKit/LPSlideView.jI;19;LPKit/LPSparkLine.jI;16;LPKit/LPSwitch.jI;24;LPKit/LPURLPostRequest.jI;23;LPKit/LPViewAnimation.jt;556;
objj_executeFile("LPKit/LPAnchorButton.j",NO);
objj_executeFile("LPKit/LPCalendarView.j",NO);
objj_executeFile("LPKit/LPChartView.j",NO);
objj_executeFile("LPKit/LPCookieController.j",NO);
objj_executeFile("LPKit/LPEmail.j",NO);
objj_executeFile("LPKit/LPLocationController.j",NO);
objj_executeFile("LPKit/LPPieChartView.j",NO);
objj_executeFile("LPKit/LPSlideView.j",NO);
objj_executeFile("LPKit/LPSparkLine.j",NO);
objj_executeFile("LPKit/LPSwitch.j",NO);
objj_executeFile("LPKit/LPURLPostRequest.j",NO);
objj_executeFile("LPKit/LPViewAnimation.j",NO);
p;22;LPLocationController.jt;1864;@STATIC;1.0;I;21;Foundation/CPObject.jt;1819;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"LPLocationController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("currentHash"),new objj_ivar("observers")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("LPLocationController").super_class},"init")){
observers=objj_msgSend(CPArray,"array");
currentHash=window.location.hash;
if(typeof window.onhashchange!=="undefined"){
window.onhashchange=function(){
objj_msgSend(_4,"updateLocation:",nil);
};
}else{
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.1,_4,sel_getUid("updateLocation:"),nil,YES);
}
}
return _4;
}
}),new objj_method(sel_getUid("formattedHash"),function(_6,_7){
with(_6){
return objj_msgSend(window.location.hash,"substringFromIndex:",1);
}
}),new objj_method(sel_getUid("setLocation:"),function(_8,_9,_a){
with(_8){
window.location.hash=_a;
objj_msgSend(_8,"updateLocation:",nil);
}
}),new objj_method(sel_getUid("updateLocation:"),function(_b,_c,_d){
with(_b){
if(currentHash!==window.location.hash){
currentHash=window.location.hash;
var _e=objj_msgSend(_b,"formattedHash");
for(var i=0,_f=observers.length;i<_f;i++){
objj_msgSend(observers[i][0],"performSelector:withObject:",observers[i][1],_e);
}
}
}
}),new objj_method(sel_getUid("addObserver:selector:"),function(_10,_11,_12,_13){
with(_10){
objj_msgSend(observers,"addObject:",[_12,_13]);
objj_msgSend(_12,"performSelector:withObject:",_13,objj_msgSend(_10,"formattedHash"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedLocationController"),function(_14,_15){
with(_14){
if(!_1){
_1=objj_msgSend(objj_msgSend(_14,"alloc"),"init");
}
return _1;
}
})]);
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
p;16;LPPieChartView.jt;6418;@STATIC;1.0;I;15;AppKit/CPView.jt;6379;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"LPPieChartView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("dataSource"),new objj_ivar("delegate"),new objj_ivar("drawView"),new objj_ivar("values"),new objj_ivar("sum"),new objj_ivar("paths")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("dataSource"),function(_3,_4){
with(_3){
return dataSource;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_5,_6,_7){
with(_5){
dataSource=_7;
}
}),new objj_method(sel_getUid("delegate"),function(_8,_9){
with(_8){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_a,_b,_c){
with(_a){
delegate=_c;
}
}),new objj_method(sel_getUid("drawView"),function(_d,_e){
with(_d){
return drawView;
}
}),new objj_method(sel_getUid("setDrawView:"),function(_f,_10,_11){
with(_f){
drawView=_11;
}
}),new objj_method(sel_getUid("paths"),function(_12,_13){
with(_12){
return paths;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
if(_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("LPPieChartView").super_class},"initWithFrame:",_16)){
objj_msgSend(_14,"setDrawView:",objj_msgSend(objj_msgSend(LPPieChartDrawView,"alloc"),"initWithFrame:",CGRectMakeZero()));
paths=objj_msgSend(CPArray,"array");
}
return _14;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_17,_18,_19){
with(_17){
dataSource=_19;
objj_msgSend(_17,"reloadData");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1a,_1b,_1c){
with(_1a){
delegate=_1c;
objj_msgSend(_1a,"reloadData");
}
}),new objj_method(sel_getUid("setDrawView:"),function(_1d,_1e,_1f){
with(_1d){
var _20=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_1f));
if(!drawView){
objj_msgSend(_1d,"addSubview:",_20);
}else{
objj_msgSend(_1d,"replaceSubview:with:",drawView,_20);
}
drawView=_20;
objj_msgSend(drawView,"setFrame:",objj_msgSend(_1d,"bounds"));
objj_msgSend(drawView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_1d,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_21,_22){
with(_21){
if(delegate&&dataSource&&drawView){
var _23=objj_msgSend(dataSource,"numberOfItemsInPieChartView:",_21),_24=objj_msgSend(CPArray,"array");
values=objj_msgSend(CPArray,"array");
sum=0;
for(var i=0;i<_23;i++){
var _25=objj_msgSend(dataSource,"pieChartView:floatValueForIndex:",_21,i);
objj_msgSend(values,"addObject:",_25);
sum+=_25;
}
objj_msgSend(_21,"setNeedsLayout");
objj_msgSend(drawView,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_26,_27){
with(_26){
var _28=objj_msgSend(drawView,"bounds"),_29=MIN(CGRectGetWidth(_28),CGRectGetHeight(_28))/2,_2a=CGRectGetMidX(_28),_2b=CGRectGetMidY(_28),_2c=0;
paths=objj_msgSend(CPArray,"array");
for(var i=0;i<values.length;i++){
var _2d=values[i],_2e=(_2d/sum)*360;
var _2f=CGPathCreateMutable();
CGPathMoveToPoint(_2f,nil,_2a,_2b);
CGPathAddArc(_2f,nil,_2a,_2b,_29,_2c/(180/PI),(_2c+_2e)/(180/PI),YES);
CGPathAddLineToPoint(_2f,nil,_2a,_2b);
paths.push(_2f);
_2c+=_2e;
}
}
}),new objj_method(sel_getUid("indexOfValueAtPoint:"),function(_30,_31,_32){
with(_30){
var _33=CGBitmapGraphicsContextCreate();
if(_33.isPointInPath){
for(var i=0;i<paths.length;i++){
CGContextBeginPath(_33);
CGContextAddPath(_33,paths[i]);
CGContextClosePath(_33);
if(_33.isPointInPath(_32.x,_32.y)){
return i;
}
}
}
return -1;
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_34,_35,_36){
with(_34){
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("pieChartView:mouseMovedOverIndex:"))){
var _37=objj_msgSend(_34,"convertPoint:fromView:",objj_msgSend(_36,"locationInWindow"),nil);
objj_msgSend(delegate,"pieChartView:mouseMovedOverIndex:",_34,objj_msgSend(_34,"indexOfValueAtPoint:",_37));
}
}
}),new objj_method(sel_getUid("mouseExited:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("pieChartView:mouseMovedOverIndex:"))){
objj_msgSend(delegate,"pieChartView:mouseMovedOverIndex:",_38,-1);
}
}
})]);
var _3b="LPPieChartViewDrawView",_3c="LPPieChartViewValues",_3d="LPPieChartViewSum",_3e="LPPieChartViewPaths";
var _1=objj_getClass("LPPieChartView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"LPPieChartView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3f,_40,_41){
with(_3f){
if(_3f){
drawView=objj_msgSend(_41,"decodeObjectForKey:",_3b);
values=objj_msgSend(_41,"decodeObjectForKey:",_3c);
sum=objj_msgSend(_41,"decodeFloatForKey:",_3d);
paths=objj_msgSend(_41,"decodeObjectForKey:",_3e);
}
return _3f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_42,_43,_44){
with(_42){
objj_msgSend(_44,"encodeObject:forKey:",drawView,_3b);
objj_msgSend(_44,"encodeObject:forKey:",values,_3c);
objj_msgSend(_44,"encodeFloat:forKey:",sum,_3d);
objj_msgSend(_44,"encodeObject:forKey:",paths,_3e);
}
})]);
var _1=objj_allocateClassPair(CPView,"LPPieChartDrawView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("drawRect:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_45,"superview")){
objj_msgSend(_45,"drawInContext:paths:",objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),objj_msgSend(objj_msgSend(_45,"superview"),"paths"));
}
}
}),new objj_method(sel_getUid("drawInContext:paths:"),function(_48,_49,_4a,_4b){
with(_48){
CGContextSetLineWidth(_4a,objj_msgSend(_48,"currentValueForThemeAttribute:","line-width"));
CGContextSetStrokeColor(_4a,objj_msgSend(_48,"currentValueForThemeAttribute:","stroke-color"));
var _4c=objj_msgSend(_48,"currentValueForThemeAttribute:","fill-colors");
for(var i=0;i<_4b.length;i++){
CGContextBeginPath(_4a);
CGContextAddPath(_4a,_4b[i]);
CGContextClosePath(_4a);
CGContextSetFillColor(_4a,_4c[i]);
CGContextFillPath(_4a);
CGContextStrokePath(_4a);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_4d,_4e){
with(_4d){
return "lp-piechart-drawview";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_4f,_50){
with(_4f){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[[objj_msgSend(CPColor,"grayColor")],1,objj_msgSend(CPColor,"whiteColor")],["fill-colors","line-width","stroke-color"]);
}
})]);
p;13;LPSlideView.jt;5266;@STATIC;1.0;I;15;AppKit/CPView.jI;23;LPKit/LPViewAnimation.jt;5199;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("LPKit/LPViewAnimation.j",NO);
LPSlideViewHorizontalDirection=0;
LPSlideViewVerticalDirection=1;
LPSlideViewPositiveDirection=2;
LPSlideViewNegativeDirection=4;
var _1=objj_allocateClassPair(CPView,"LPSlideView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("slideDirection"),new objj_ivar("currentView"),new objj_ivar("previousView"),new objj_ivar("animationDuration"),new objj_ivar("animationCurve"),new objj_ivar("isSliding"),new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("slideDirection"),function(_3,_4){
with(_3){
return slideDirection;
}
}),new objj_method(sel_getUid("setSlideDirection:"),function(_5,_6,_7){
with(_5){
slideDirection=_7;
}
}),new objj_method(sel_getUid("currentView"),function(_8,_9){
with(_8){
return currentView;
}
}),new objj_method(sel_getUid("setCurrentView:"),function(_a,_b,_c){
with(_a){
currentView=_c;
}
}),new objj_method(sel_getUid("previousView"),function(_d,_e){
with(_d){
return previousView;
}
}),new objj_method(sel_getUid("setPreviousView:"),function(_f,_10,_11){
with(_f){
previousView=_11;
}
}),new objj_method(sel_getUid("animationDuration"),function(_12,_13){
with(_12){
return animationDuration;
}
}),new objj_method(sel_getUid("setAnimationDuration:"),function(_14,_15,_16){
with(_14){
animationDuration=_16;
}
}),new objj_method(sel_getUid("animationCurve"),function(_17,_18){
with(_17){
return animationCurve;
}
}),new objj_method(sel_getUid("setAnimationCurve:"),function(_19,_1a,_1b){
with(_19){
animationCurve=_1b;
}
}),new objj_method(sel_getUid("isSliding"),function(_1c,_1d){
with(_1c){
return isSliding;
}
}),new objj_method(sel_getUid("delegate"),function(_1e,_1f){
with(_1e){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_20,_21,_22){
with(_20){
_delegate=_22;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_23,_24,_25){
with(_23){
if(_23=objj_msgSendSuper({receiver:_23,super_class:objj_getClass("LPSlideView").super_class},"initWithFrame:",_25)){
animationCurve=CPAnimationEaseOut;
slideDirection=LPSlideViewHorizontalDirection;
animationDuration=0.2;
isSliding=NO;
}
return _23;
}
}),new objj_method(sel_getUid("addSubview:"),function(_26,_27,_28){
with(_26){
if(!currentView){
currentView=_28;
}else{
objj_msgSend(_28,"setHidden:",YES);
}
objj_msgSend(_28,"setFrame:",objj_msgSend(_26,"bounds"));
objj_msgSend(_28,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSendSuper({receiver:_26,super_class:objj_getClass("LPSlideView").super_class},"addSubview:",_28);
}
}),new objj_method(sel_getUid("slideToView:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_29,"slideToView:direction:animationProgress:",_2b,nil,nil);
}
}),new objj_method(sel_getUid("slideToView:direction:"),function(_2c,_2d,_2e,_2f){
with(_2c){
objj_msgSend(_2c,"slideToView:direction:animationProgress:",_2e,_2f,nil);
}
}),new objj_method(sel_getUid("slideToView:direction:animationProgress:"),function(_30,_31,_32,_33,_34){
with(_30){
if(_32==currentView||isSliding){
return;
}
isSliding=YES;
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("slideView:willMoveToView:"))){
objj_msgSend(_delegate,"slideView:willMoveToView:",_30,_32);
}
var _35=objj_msgSend(objj_msgSend(_30,"subviews"),"indexOfObject:",_32),_36=objj_msgSend(objj_msgSend(_30,"subviews"),"indexOfObject:",currentView),_37=objj_msgSend(_30,"frame").size;
objj_msgSend(_32,"setHidden:",NO);
var _38=CGPointMake(0,0),_39=CGPointMake(0,0);
if(slideDirection==LPSlideViewHorizontalDirection){
var _3a,_3b;
if((_33&&_33==LPSlideViewNegativeDirection)||(!_33&&_35<_36)){
_3a=-_37.width;
_3b=_37.width;
}
if((_33&&_33==LPSlideViewPositiveDirection)||(!_33&&_35>_36)){
_3a=_37.width;
_3b=-_37.width;
}
_38.x=_3a;
_39.x=_3b;
}else{
if(slideDirection==LPSlideViewVerticalDirection){
var _3c,_3d;
if((_33&&_33==LPSlideViewNegativeDirection)||(!_33&&_35>_36)){
_3c=_37.height;
_3d=-_37.height;
}
if((_33&&_33==LPSlideViewPositiveDirection)||(!_33&&_35<_36)){
_3c=-_37.height;
_3d=_37.height;
}
_38.y=_3c;
_39.y=_3d;
if(_34){
_38.y-=(_34*_38.y);
_39.y-=(_34*_39.y);
}
}
}
var _3e=objj_msgSend(objj_msgSend(LPViewAnimation,"alloc"),"initWithViewAnimations:",[{"target":_32,"animations":[[LPOriginAnimationKey,_38,CGPointMake(0,0)]]},{"target":currentView,"animations":[[LPOriginAnimationKey,CGPointMakeZero(),_39]]}]);
objj_msgSend(_3e,"setAnimationCurve:",animationCurve);
objj_msgSend(_3e,"setDuration:",animationDuration);
objj_msgSend(_3e,"setDelegate:",_30);
objj_msgSend(_3e,"startAnimation");
previousView=currentView;
currentView=_32;
}
}),new objj_method(sel_getUid("animationDidEnd"),function(_3f,_40){
with(_3f){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("slideView:didMoveToView:"))){
objj_msgSend(_delegate,"slideView:didMoveToView:",_3f,currentView);
}
objj_msgSend(previousView,"setHidden:",YES);
isSliding=NO;
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_41,"animationDidEnd");
}
}),new objj_method(sel_getUid("animationDidStop:"),function(_44,_45,_46){
with(_44){
objj_msgSend(_44,"animationDidEnd");
}
})]);
p;13;LPSparkLine.jt;4018;@STATIC;1.0;I;21;Foundation/CPObject.jt;3973;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPView,"LPSparkLine"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("data"),new objj_ivar("lineColor"),new objj_ivar("lineWeight"),new objj_ivar("shadowColor"),new objj_ivar("shadowOffset"),new objj_ivar("isEmpty")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("data"),function(_3,_4){
with(_3){
return data;
}
}),new objj_method(sel_getUid("setData:"),function(_5,_6,_7){
with(_5){
data=_7;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("LPSparkLine").super_class},"initWithFrame:",_a);
if(_8){
lineWeight=1;
lineColor=objj_msgSend(CPColor,"blackColor");
shadowColor=nil;
shadowOffset=CGSizeMake(0,1);
}
return _8;
}
}),new objj_method(sel_getUid("drawRect:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_f=objj_msgSend(_b,"bounds"),_10=CGRectGetHeight(_f)-(2*lineWeight),_11=CGRectGetWidth(_f)/(objj_msgSend(data,"count")-1),_12=Math.max.apply(Math,data);
CGContextBeginPath(_e);
if(isEmpty){
CGContextMoveToPoint(_e,0,_10/2);
CGContextAddLineToPoint(_e,CGRectGetWidth(_f),_10/2);
}else{
for(var i=0;i<objj_msgSend(data,"count");i++){
var x=i*_11,y=lineWeight+(_10-((objj_msgSend(data,"objectAtIndex:",i)/_12)*_10));
if(i===0){
CGContextMoveToPoint(_e,0,y);
}else{
CGContextAddLineToPoint(_e,x,y);
}
}
}
CGContextSetLineJoin(_e,kCGLineJoinRound);
CGContextSetLineWidth(_e,lineWeight);
CGContextSetStrokeColor(_e,lineColor);
CGContextSetShadowWithColor(_e,shadowOffset,0,shadowColor);
CGContextStrokePath(_e);
CGContextClosePath(_e);
}
}),new objj_method(sel_getUid("setData:"),function(_13,_14,_15){
with(_13){
isEmpty=YES;
for(var i=0;i<_15.length;i++){
if((_15[i]>0)&&(isEmpty)){
isEmpty=NO;
}
}
data=_15;
objj_msgSend(_13,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setLineColor:"),function(_16,_17,_18){
with(_16){
lineColor=_18;
objj_msgSend(_16,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setLineWeight:"),function(_19,_1a,_1b){
with(_19){
lineWeight=_1b;
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setShadowColor:"),function(_1c,_1d,_1e){
with(_1c){
shadowColor=_1e;
objj_msgSend(_1c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setShadowOffset:"),function(_1f,_20,_21){
with(_1f){
shadowOffset=_21;
objj_msgSend(_1f,"setNeedsDisplay:",YES);
}
})]);
var _22="LPSparkLineDataKey",_23="LPSparkLineLineColorKey",_24="LPSparkLineLineWeightKey",_25="LPSparkLineShadowColorKey",_26="LPSparkLineShadowOffsetKey",_27="LPSparkLineIsEmptyKey";
var _1=objj_getClass("LPSparkLine");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"LPSparkLine\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_28,_29,_2a){
with(_28){
if(_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("LPSparkLine").super_class},"initWithCoder:",_2a)){
data=objj_msgSend(_2a,"decodeObjectForKey:",_22);
lineColor=objj_msgSend(_2a,"decodeObjectForKey:",_23);
lineWeight=objj_msgSend(_2a,"decodeFloatForKey:",_24);
shadowColor=objj_msgSend(_2a,"decodeObjectForKey:",_25);
shadowOffset=objj_msgSend(_2a,"decodeSizeForKey:",_26);
isEmpty=!objj_msgSend(_2a,"containsValueForKey:",_27)||objj_msgSend(_2a,"decodeObjectForKey:",_27);
}
return _28;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("LPSparkLine").super_class},"encodeWithCoder:",_2d);
objj_msgSend(_2d,"encodeObject:forKey:",data,_22);
objj_msgSend(_2d,"encodeObject:forKey:",lineColor,_23);
objj_msgSend(_2d,"encodeFloat:forKey:",lineWeight,_24);
objj_msgSend(_2d,"encodeObject:forKey:",shadowColor,_25);
objj_msgSend(_2d,"encodeSize:forKey:",shadowOffset,_26);
objj_msgSend(_2d,"encodeBool:forKey:",isEmpty,_27);
}
})]);
p;10;LPSwitch.jt;9340;@STATIC;1.0;I;18;AppKit/CPControl.jI;23;LPKit/LPViewAnimation.jt;9270;
objj_executeFile("AppKit/CPControl.j",NO);
objj_executeFile("LPKit/LPViewAnimation.j",NO);
var _1=objj_allocateClassPair(CPControl,"LPSwitch"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("on"),new objj_ivar("dragStartPoint"),new objj_ivar("knob"),new objj_ivar("knobDragStartPoint"),new objj_ivar("isDragging"),new objj_ivar("animationDuration"),new objj_ivar("animationCurve"),new objj_ivar("offBackgroundView"),new objj_ivar("onBackgroundView"),new objj_ivar("offLabel"),new objj_ivar("onLabel"),new objj_ivar("animation")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isOn"),function(_3,_4){
with(_3){
return on;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("LPSwitch").super_class},"initWithFrame:",_7)){
offBackgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_5,"bounds"));
objj_msgSend(offBackgroundView,"setHitTests:",NO);
objj_msgSend(_5,"addSubview:",offBackgroundView);
onBackgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,0,CGRectGetHeight(objj_msgSend(_5,"bounds"))));
objj_msgSend(onBackgroundView,"setHitTests:",NO);
objj_msgSend(_5,"addSubview:",onBackgroundView);
knob=objj_msgSend(objj_msgSend(LPSwitchKnob,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_5,"addSubview:",knob);
offLabel=objj_msgSend(CPTextField,"labelWithTitle:","Off");
objj_msgSend(_5,"addSubview:",offLabel);
onLabel=objj_msgSend(CPTextField,"labelWithTitle:","On");
objj_msgSend(_5,"addSubview:",onLabel);
animationDuration=0.2;
animationCurve=CPAnimationEaseOut;
objj_msgSend(_5,"layoutSubviews");
objj_msgSend(_5,"setNeedsLayout");
}
return _5;
}
}),new objj_method(sel_getUid("setOn:animated:"),function(_8,_9,_a,_b){
with(_8){
objj_msgSend(_8,"setOn:animated:sendAction:",_a,_b,YES);
}
}),new objj_method(sel_getUid("setOn:animated:sendAction:"),function(_c,_d,_e,_f,_10){
with(_c){
if(_10&&on!==_e){
on=_e;
objj_msgSend(_c,"sendAction:to:",_action,_target);
}else{
on=_e;
}
var _11=CGRectGetMinY(objj_msgSend(knob,"frame")),_12=CGRectMake((on)?objj_msgSend(knob,"maxX"):objj_msgSend(knob,"minX"),_11,CGRectGetWidth(objj_msgSend(knob,"frame")),CGRectGetHeight(objj_msgSend(knob,"frame"))),_13=CGRectMake(0,0,CGRectGetMinX(_12)+CGRectGetMidX(objj_msgSend(knob,"bounds")),CGRectGetHeight(objj_msgSend(onBackgroundView,"bounds"))),_14=objj_msgSend(_c,"labelOffset"),_15=CGRectMake(CGRectGetMaxX(_12)+_14.width,_14.height,CGRectGetWidth(objj_msgSend(offLabel,"bounds")),CGRectGetHeight(objj_msgSend(offLabel,"bounds"))),_16=CGRectMake(CGRectGetMinX(_12)-_14.width-CGRectGetWidth(objj_msgSend(onLabel,"bounds")),_14.height,CGRectGetWidth(objj_msgSend(onLabel,"bounds")),CGRectGetHeight(objj_msgSend(onLabel,"bounds")));
if(objj_msgSend(animation,"isAnimating")){
objj_msgSend(animation,"stopAnimation");
}
if(_f){
animation=objj_msgSend(objj_msgSend(LPViewAnimation,"alloc"),"initWithViewAnimations:",[{"target":knob,"animations":[[LPOriginAnimationKey,objj_msgSend(knob,"frame").origin,_12.origin]]},{"target":onBackgroundView,"animations":[[LPFrameAnimationKey,objj_msgSend(onBackgroundView,"frame"),_13]]},{"target":offLabel,"animations":[[LPOriginAnimationKey,objj_msgSend(offLabel,"frame").origin,_15.origin]]},{"target":onLabel,"animations":[[LPOriginAnimationKey,objj_msgSend(onLabel,"frame").origin,_16.origin]]}]);
objj_msgSend(animation,"setAnimationCurve:",animationCurve);
objj_msgSend(animation,"setDuration:",animationDuration);
objj_msgSend(animation,"setDelegate:",_c);
objj_msgSend(animation,"startAnimation");
}else{
objj_msgSend(knob,"setFrame:",_12);
objj_msgSend(onBackgroundView,"setFrame:",_13);
objj_msgSend(offLabel,"setFrame:",_15);
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_17,_18,_19){
with(_17){
if(!objj_msgSend(_17,"isEnabled")){
return;
}
dragStartPoint=objj_msgSend(_17,"convertPoint:fromView:",objj_msgSend(_19,"locationInWindow"),nil);
knobDragStartPoint=objj_msgSend(knob,"frame").origin;
isDragging=NO;
var _1a=objj_msgSend(knob,"convertPoint:fromView:",dragStartPoint,_17).x;
if(_1a>0&&_1a<CGRectGetWidth(objj_msgSend(knob,"bounds"))){
objj_msgSend(knob,"setHighlighted:",YES);
objj_msgSend(_17,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_1b,_1c,_1d){
with(_1b){
if(!objj_msgSend(_1b,"isEnabled")){
return;
}
isDragging=YES;
var _1e=objj_msgSend(_1b,"convertPoint:fromView:",objj_msgSend(_1d,"locationInWindow"),nil),_1f=knobDragStartPoint.x+(_1e.x-dragStartPoint.x),_20=objj_msgSend(knob,"minX"),_21=objj_msgSend(knob,"maxX"),_22=CGRectGetHeight(objj_msgSend(_1b,"bounds"));
if(_1f<_20){
_1f=_20;
}else{
if(_1f>_21){
_1f=_21;
}
}
objj_msgSend(onBackgroundView,"setFrameSize:",CGSizeMake(_1f+CGRectGetMidX(objj_msgSend(knob,"bounds")),_22));
objj_msgSend(knob,"setFrameOrigin:",CGPointMake(_1f,CGRectGetMinY(objj_msgSend(knob,"frame"))));
objj_msgSend(_1b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("mouseUp:"),function(_23,_24,_25){
with(_23){
if(!objj_msgSend(_23,"isEnabled")){
return;
}
objj_msgSend(_23,"setOn:animated:",isDragging?CGRectGetMidX(objj_msgSend(_23,"bounds"))<CGRectGetMidX(objj_msgSend(knob,"frame")):!on,YES);
objj_msgSend(knob,"setHighlighted:",NO);
objj_msgSend(_23,"setNeedsLayout");
}
}),new objj_method(sel_getUid("labelOffset"),function(_26,_27){
with(_26){
var _28=objj_msgSend(_26,"currentValueForThemeAttribute:","label-offset");
return (_28)?_28:CGSizeMake(0,0);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_29,_2a){
with(_29){
objj_msgSend(offBackgroundView,"setBackgroundColor:",objj_msgSend(_29,"currentValueForThemeAttribute:","off-background-color"));
objj_msgSend(onBackgroundView,"setBackgroundColor:",objj_msgSend(_29,"currentValueForThemeAttribute:","on-background-color"));
objj_msgSend(knob,"setBackgroundColor:",objj_msgSend(_29,"valueForThemeAttribute:inState:","knob-background-color",objj_msgSend(knob,"themeState")));
objj_msgSend(knob,"setFrameSize:",objj_msgSend(_29,"currentValueForThemeAttribute:","knob-size"));
var _2b=objj_msgSend(_29,"labelOffset");
objj_msgSend(offLabel,"setFont:",objj_msgSend(_29,"currentValueForThemeAttribute:","off-label-font"));
objj_msgSend(offLabel,"setTextColor:",objj_msgSend(_29,"currentValueForThemeAttribute:","off-label-text-color"));
objj_msgSend(offLabel,"setTextShadowColor:",objj_msgSend(_29,"currentValueForThemeAttribute:","off-label-text-shadow-color"));
objj_msgSend(offLabel,"setTextShadowOffset:",objj_msgSend(_29,"currentValueForThemeAttribute:","off-label-text-shadow-offset"));
objj_msgSend(offLabel,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(knob,"frame"))+_2b.width,_2b.height));
objj_msgSend(offLabel,"sizeToFit");
objj_msgSend(onLabel,"setFont:",objj_msgSend(_29,"currentValueForThemeAttribute:","on-label-font"));
objj_msgSend(onLabel,"setTextColor:",objj_msgSend(_29,"currentValueForThemeAttribute:","on-label-text-color"));
objj_msgSend(onLabel,"setTextShadowColor:",objj_msgSend(_29,"currentValueForThemeAttribute:","on-label-text-shadow-color"));
objj_msgSend(onLabel,"setTextShadowOffset:",objj_msgSend(_29,"currentValueForThemeAttribute:","on-label-text-shadow-offset"));
objj_msgSend(onLabel,"sizeToFit");
objj_msgSend(onLabel,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(knob,"frame"))-_2b.width-CGRectGetWidth(objj_msgSend(onLabel,"bounds")),CGRectGetMinY(objj_msgSend(offLabel,"frame"))));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_2c,_2d){
with(_2c){
return "lp-switch";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_2e,_2f){
with(_2e){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null")],["off-background-color","on-background-color","knob-background-color","knob-size","label-offset","off-label-font","off-label-text-color","off-label-text-shadow-color","off-label-text-shadow-offset","on-label-font","on-label-text-color","on-label-text-shadow-color","on-label-text-shadow-offset"]);
}
})]);
var _1=objj_allocateClassPair(CPView,"LPSwitchKnob"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_30,_31,_32){
with(_30){
if(_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("LPSwitchKnob").super_class},"initWithFrame:",_32)){
objj_msgSend(_30,"setHitTests:",NO);
}
return _30;
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_33,_34,_35){
with(_33){
isHighlighted=_35;
if(_35){
objj_msgSend(_33,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_33,"unsetThemeState:",CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("minX"),function(_36,_37){
with(_36){
return 0;
}
}),new objj_method(sel_getUid("maxX"),function(_38,_39){
with(_38){
return CGRectGetWidth(objj_msgSend(objj_msgSend(_38,"superview"),"bounds"))-CGRectGetWidth(objj_msgSend(_38,"bounds"));
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
p;17;LPViewAnimation.jt;8134;@STATIC;1.0;I;21;Foundation/CPObject.jt;8089;
objj_executeFile("Foundation/CPObject.j",NO);
LPCSSAnimationsAreAvailable=NO;
var _1=["webkit","Moz","moz","o","ms"],_2=nil;
LPFadeAnimationKey="LPFadeAnimation";
LPFrameAnimationKey="LPFrameAnimation";
LPOriginAnimationKey="LPOriginAnimation";
LPTestCSSFeature=function(_3){
if(typeof document==="undefined"){
return NO;
}
if(!_2){
_2=document.createElement("div");
}
var _4=[_3];
for(var i=0;i<_1.length;i++){
_4.push(_1[i]+_3);
}
for(var i=0;i<_4.length;i++){
if(typeof _2.style[_4[i]]!=="undefined"){
return YES;
}
}
return NO;
};
LPCSSAnimationsAreAvailable=LPTestCSSFeature("AnimationName");
var _5=function(_6,_7,_8,_9){
if(_9){
_6.style[_8]=_6.style[_8]+", "+_7;
}else{
_6.style[_8]=_7;
}
};
var _a=objj_allocateClassPair(CPAnimation,"LPViewAnimation"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_isAnimating"),new objj_ivar("_viewAnimations"),new objj_ivar("_animationDidEndTimeout"),new objj_ivar("_shouldUseCSSAnimations"),new objj_ivar("_c1"),new objj_ivar("_c2")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("viewAnimations"),function(_c,_d){
with(_c){
return _viewAnimations;
}
}),new objj_method(sel_getUid("setViewAnimations:"),function(_e,_f,_10){
with(_e){
_viewAnimations=_10;
}
}),new objj_method(sel_getUid("shouldUseCSSAnimations"),function(_11,_12){
with(_11){
return _shouldUseCSSAnimations;
}
}),new objj_method(sel_getUid("setShouldUseCSSAnimations:"),function(_13,_14,_15){
with(_13){
_shouldUseCSSAnimations=_15;
}
}),new objj_method(sel_getUid("initWithViewAnimations:"),function(_16,_17,_18){
with(_16){
if(_16=objj_msgSend(_16,"initWithDuration:animationCurve:",1,CPAnimationLinear)){
_isAnimating=NO;
_viewAnimations=_18;
_shouldUseCSSAnimations=NO;
}
return _16;
}
}),new objj_method(sel_getUid("setAnimationCurve:"),function(_19,_1a,_1b){
with(_19){
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("LPViewAnimation").super_class},"setAnimationCurve:",_1b);
_c1=[];
_c2=[];
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",1,_c1);
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",2,_c2);
}
}),new objj_method(sel_getUid("startAnimation"),function(_1c,_1d){
with(_1c){
if(LPCSSAnimationsAreAvailable&&_shouldUseCSSAnimations){
if(_isAnimating){
return;
}
_isAnimating=YES;
var i=_viewAnimations.length;
while(i--){
var _1e=_viewAnimations[i],_1f=_1e["target"];
objj_msgSend(_1c,"target:setCSSAnimationDuration:",_1f,_duration);
objj_msgSend(_1c,"target:setCSSAnimationCurve:",_1f,_animationCurve);
var x=_1e["animations"].length;
while(x--){
var _20=_1e["animations"][x],_21=_20[0],_22=_20[1],end=_20[2];
if(_21===LPFadeAnimationKey){
objj_msgSend(_1f,"setAlphaValue:",_22);
objj_msgSend(_1c,"target:addCSSAnimationPropertyForKey:append:",_1f,_21,x!==0);
setTimeout(function(_23,_24){
_23._DOMElement.style["-webkit-transform"]="translate3d(0px, 0px, 0px)";
objj_msgSend(_23,"setAlphaValue:",_24);
},0,_1f,end);
}else{
if(_21===LPOriginAnimationKey){
if(!CGPointEqualToPoint(_22,end)){
objj_msgSend(_1f,"setFrameOrigin:",_22);
objj_msgSend(_1c,"target:addCSSAnimationPropertyForKey:append:",_1f,_21,x!==0);
setTimeout(function(_25,_26,_27){
var x=_27.x-_26.x,y=_27.y-_26.y;
_25._DOMElement.style["-webkit-transform"]="translate3d("+x+"px, "+y+"px, 0px)";
setTimeout(function(){
objj_msgSend(_1c,"_clearCSS");
_25._DOMElement.style["-webkit-transform"]="translate3d(0px, 0px, 0px)";
objj_msgSend(_25,"setFrameOrigin:",_27);
},(1000*_duration)+100);
},0,_1f,_22,end);
}
}else{
if(_21===LPFrameAnimationKey){
CPLog.error("LPViewAnimation does not currently support CSS frame animations. This should fall back to the regular javascript animation.");
}
}
}
}
}
if(_animationDidEndTimeout){
clearTimeout(_animationDidEndTimeout);
}
_animationDidEndTimeout=setTimeout(function(_28){
_isAnimating=NO;
objj_msgSend(_28,"_clearCSS");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidEnd:"))){
objj_msgSend(_delegate,"animationDidEnd:",_28);
}
},(1000*_duration)+100,_1c);
}else{
var i=_viewAnimations.length;
while(i--){
var _1e=_viewAnimations[i],_1f=_1e["target"];
var x=_1e["animations"].length;
while(x--){
var _20=_1e["animations"][x],_21=_20[0],_22=_20[1],end=_20[2];
switch(_21){
case LPFadeAnimationKey:
objj_msgSend(_1f,"setAlphaValue:",_22);
break;
case LPOriginAnimationKey:
objj_msgSend(_1f,"setFrameOrigin:",_22);
break;
case LPFrameAnimationKey:
objj_msgSend(_1f,"setFrame:",_22);
break;
}
}
}
objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("LPViewAnimation").super_class},"startAnimation");
}
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_29,_2a,_2b){
with(_29){
_progress=_2b;
var _2c=_2d(_progress,_c1[0],_c1[1],_c2[0],_c2[1],_duration),i=_viewAnimations.length;
while(i--){
var _2e=_viewAnimations[i],_2f=_2e["target"],x=_2e["animations"].length;
while(x--){
var _30=_2e["animations"][x],_31=_30[0],_32=_30[1],end=_30[2];
switch(_31){
case LPFadeAnimationKey:
objj_msgSend(_2f,"setAlphaValue:",(_2c*(end-_32))+_32);
break;
case LPOriginAnimationKey:
objj_msgSend(_2f,"setFrameOrigin:",CGPointMake(_32.x+(_2c*(end.x-_32.x)),_32.y+(_2c*(end.y-_32.y))));
break;
case LPFrameAnimationKey:
objj_msgSend(_2f,"setFrame:",CGRectMake(_32.origin.x+(_2c*(end.origin.x-_32.origin.x)),_32.origin.y+(_2c*(end.origin.y-_32.origin.y)),_32.size.width+(_2c*(end.size.width-_32.size.width)),_32.size.height+(_2c*(end.size.height-_32.size.height))));
}
}
}
}
}),new objj_method(sel_getUid("isAnimating"),function(_33,_34){
with(_33){
if(LPCSSAnimationsAreAvailable&&_shouldUseCSSAnimations){
return _isAnimating;
}else{
return objj_msgSendSuper({receiver:_33,super_class:objj_getClass("LPViewAnimation").super_class},"isAnimating");
}
}
}),new objj_method(sel_getUid("stopAnimation"),function(_35,_36){
with(_35){
if(LPCSSAnimationsAreAvailable&&_shouldUseCSSAnimations){
}else{
objj_msgSendSuper({receiver:_35,super_class:objj_getClass("LPViewAnimation").super_class},"stopAnimation");
}
}
}),new objj_method(sel_getUid("_clearCSS"),function(_37,_38){
with(_37){
for(var i=0;i<_viewAnimations.length;i++){
_viewAnimations[i]["target"]._DOMElement.style["-webkit-transition-property"]="none";
}
}
}),new objj_method(sel_getUid("target:setCSSAnimationDuration:"),function(_39,_3a,_3b,_3c){
with(_39){
_3b._DOMElement.style["-webkit-transition-duration"]=_3c+"s";
}
}),new objj_method(sel_getUid("target:setCSSAnimationCurve:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41=nil;
switch(_40){
case CPAnimationLinear:
_41="linear";
break;
case CPAnimationEaseIn:
_41="ease-in";
break;
case CPAnimationEaseOut:
_41="ease-out";
break;
case CPAnimationEaseInOut:
_41="ease-in-out";
break;
}
_3f._DOMElement.style["-webkit-transition-timing-function"]=_41;
}
}),new objj_method(sel_getUid("target:addCSSAnimationPropertyForKey:append:"),function(_42,_43,_44,_45,_46){
with(_42){
var _47=nil;
switch(_45){
case LPFadeAnimationKey:
_47="-webkit-transform, opacity";
break;
case LPOriginAnimationKey:
_47="-webkit-transform";
break;
case LPFrameAnimationKey:
_47="top, left, width, height";
break;
default:
_47="none";
}
_5(_44._DOMElement,_47,"-webkit-transition-property",_46);
}
})]);
var _2d=_2d=function(t,p1x,p1y,p2x,p2y,_48){
var ax=0,bx=0,cx=0,ay=0,by=0,cy=0;
sampleCurveX=function(t){
return ((ax*t+bx)*t+cx)*t;
};
sampleCurveY=function(t){
return ((ay*t+by)*t+cy)*t;
};
sampleCurveDerivativeX=function(t){
return (3*ax*t+2*bx)*t+cx;
};
solveEpsilon=function(_49){
return 1/(200*_49);
};
solve=function(x,_4a){
return sampleCurveY(solveCurveX(x,_4a));
};
solveCurveX=function(x,_4b){
var t0,t1,t2,x2,d2,i;
fabs=function(n){
if(n>=0){
return n;
}else{
return 0-n;
}
};
for(t2=x,i=0;i<8;i++){
x2=sampleCurveX(t2)-x;
if(fabs(x2)<_4b){
return t2;
}
d2=sampleCurveDerivativeX(t2);
if(fabs(d2)<0.000001){
break;
}
t2=t2-x2/d2;
}
t0=0;
t1=1;
t2=x;
if(t2<t0){
return t0;
}
if(t2>t1){
return t1;
}
while(t0<t1){
x2=sampleCurveX(t2);
if(fabs(x2-x)<_4b){
return t2;
}
if(x>x2){
t0=t2;
}else{
t1=t2;
}
t2=(t1-t0)*0.5+t0;
}
return t2;
};
cx=3*p1x;
bx=3*(p2x-p1x)-cx;
ax=1-cx-bx;
cy=3*p1y;
by=3*(p2y-p1y)-cy;
ay=1-cy-by;
return solve(t,solveEpsilon(_48));
};
e;