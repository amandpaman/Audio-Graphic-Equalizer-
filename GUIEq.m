function varargout = GUIEq(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIEq_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIEq_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end



function GUIEq_OpeningFcn(hObject, eventdata, handles, varargin)

global C;
C=ones(1,5);
axes(handles.axes);
xlabel('Time');
ylabel('Magnitude');
axes(handles.axes8);
title('Input Signal');
xlabel('Frequency') 
ylabel('Magnitude');
axes(handles.axes7);
title('Output Signal');
xlabel('Frequency'); 
ylabel('Magnitude');
set(handles.slider1,'min',-20);
set(handles.slider1,'max',20);
set(handles.slider1,'value',1);
set(handles.slider1,'SliderStep',[0.025,0.05]);
set(handles.edit3,'string',num2str(1));

set(handles.slider6,'min',-20);
set(handles.slider6,'max',20);
set(handles.slider6,'value',1);
set(handles.slider6,'SliderStep',[0.025,0.05]);
set(handles.edit4,'string',num2str(1));

set(handles.slider7,'min',-20);
set(handles.slider7,'max',20);
set(handles.slider7,'value',1);
set(handles.slider7,'SliderStep',[0.025,0.05]);
set(handles.edit5,'string',num2str(1));

set(handles.slider8,'min',-20);
set(handles.slider8,'max',20);
set(handles.slider8,'value',1);
set(handles.slider8,'SliderStep',[0.025,0.05]);
set(handles.edit6,'string',num2str(1));

set(handles.slider9,'min',-20);
set(handles.slider9,'max',20);
set(handles.slider9,'value',1);
set(handles.slider9,'SliderStep',[0.025,0.05]);
set(handles.edit7,'string',num2str(1));


handles.output = hObject;

guidata(hObject, handles);

function varargout = GUIEq_OutputFcn(hObject, eventdata, handles) 



varargout{1} = handles.output;



function pushbutton1_Callback(hObject, eventdata, handles)

global filename;
global y2;
global y3;
global y4;
global y5;
global y6;
global Fs;
global X;
[filename, pathname] = uigetfile({'*.wav';'*.*'},'File Selector');
set(handles.edit9,'string',filename);
[X,Fs]=audioread(filename);
h2=fir1(100,250/Fs,'low');
h3=fir1(100,[250/Fs 500/Fs],'bandpass');
h4=fir1(100,[500/Fs 2000/Fs],'bandpass');
h5=fir1(100,[2000/Fs 4000/Fs],'bandpass');
h6=fir1(100,4000/Fs,'high');
y2=filter(h2,1,X);
y3=filter(h3,1,X);
y4=filter(h4,1,X);
y5=filter(h5,1,X);
y6=filter(h6,1,X);



if isequal([filename,pathname],[0,0])
    return

else
    File = fullfile(pathname,filename) 
    handles.play=File
  
end




function pushbutton2_Callback(hObject, eventdata, handles)

global filename;
global player;
global y;
global C;
global y2;
global y3;
global y4;
global y5;
global y6;
global X;
[X,Fs]=audioread(filename);
y=y2*C(1)+y3*C(2)+y4*C(3)+y5*C(4)+y6*C(5);
player = audioplayer(y,Fs);
play(player)






% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

global player;
pause(player)


function pushbutton4_Callback(hObject, eventdata, handles)

global player;
resume(player)



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
stop(player)



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

global C;
C(1)=get(hObject,'value');
set(handles.edit3,'string',num2str(C(1)));




function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider6_Callback(hObject, eventdata, handles)

global C;
C(2)=get(hObject,'value');
set(handles.edit4,'string',num2str(C(2)));



function slider6_CreateFcn(hObject, eventdata, handles)


if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider7_Callback(hObject, eventdata, handles)


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C;
C(3)=get(hObject,'value');
set(handles.edit5,'string',num2str(C(3)));


function slider7_CreateFcn(hObject, eventdata, handles)



if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider8_Callback(hObject, eventdata, handles)

global C;
C(4)=get(hObject,'value');
set(handles.edit6,'string',num2str(C(4)));



function slider8_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider9_Callback(hObject, eventdata, handles)

global C;
C(5)=get(hObject,'value');
set(handles.edit7,'string',num2str(C(5)));



function slider9_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit3_Callback(hObject, eventdata, handles)

global C;
C(1)=str2num(get(hObject,'string'));
minn=get(handles.slider1,'min');
maxx=get(handles.slider1,'max');
if(C(1)<minn || C(1)>maxx)
    C(1)=get(handles.slider1,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.slider1,'value',C(1));
end



function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)

global C;
C(2)=str2num(get(hObject,'string'));
minn=get(handles.slider6,'min');
maxx=get(handles.slider6,'max');
if(C(2)<minn || C(2)>maxx)
    C(2)=get(handles.slider6,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.slider6,'value',C(2));
end




function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)


global C;
C(3)=str2num(get(hObject,'string'));
minn=get(handles.slider7,'min');
maxx=get(handles.slider7,'max');
if(C(3)<minn || C(3)>maxx)
    C(3)=get(handles.slider7,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.slider7,'value',C(3));
end


function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)

global C;
C(4)=str2num(get(hObject,'string'));
minn=get(handles.slider8,'min');
maxx=get(handles.slider8,'max');
if(C(4)<minn || C(4)>maxx)
    C(4)=get(handles.slider8,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.slider8,'value',C(4));
end



function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
global C;
C(5)=str2num(get(hObject,'string'));
minn=get(handles.slider9,'min');
maxx=get(handles.slider9,'max');
if(C(5)<minn || C(5)>maxx)
    C(5)=get(handles.slider9,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.slider9,'value',C(5));
end



function edit7_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton7_Callback(hObject, eventdata, handles)
global C;
global y2;
global y3;
global y4;
global y5;
global y6;
global y;
y=y2*C(1)+y3*C(2)+y4*C(3)+y5*C(4)+y6*C(5);

axes(handles.axes);
plot(y);
xlabel('Time');
ylabel('Magnitude');


function edit9_Callback(hObject, eventdata, handles)

global filename;
set(hObject,'string',filename);

function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function figure1_SizeChangedFcn(hObject, eventdata, handles)


function listbox2_Callback(hObject, eventdata, handles)

function listbox2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton8_Callback(hObject, eventdata, handles)

function listbox3_Callback(hObject, eventdata, handles)

function listbox3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu3_Callback(hObject, eventdata, handles)

function popupmenu3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu4_Callback(hObject, eventdata, handles)




function popupmenu4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu5_Callback(hObject, eventdata, handles)




function popupmenu5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton9_Callback(hObject, eventdata, handles)

global filename;

global C;
global y2;
global y3;
global y4;
global y5;
global y6;
y=y2*C(1)+y3*C(2)+y4*C(3)+y5*C(4)+y6*C(5);

v=get(handles.popupmenu5,'Value');

if v==2
    out=y2;
elseif v==3
    out=y3;
elseif v==4
    out=y4;
elseif v==5
    out=y5;
elseif v==6
    out=y6;
end



fs= 1000;
t=(0:1/fs:1);
fc=100;
sinwav1= sin(2*pi*t);
amwav=ammod(sinwav1,fc,fs);
[X,Fs]=audioread(filename);
nf=44100;
F=fft(y,nf);
f=Fs/2*linspace(0,1,nf/2+1);
axes(handles.axes8);
plot(f,abs(F(1:nf/2+1)))
title('Input Signal');
xlabel('Frequency'); 
ylabel('Magnitude');
axis tight;
zoom xon;
Z=fft(out,nf);
axes(handles.axes7);
plot(f,abs(Z(1:nf/2+1)))
title('Output Signal');
xlabel('Frequency'); 
ylabel('Magnitude');
axis tight;
zoom xon;


function figure1_CloseRequestFcn(hObject, eventdata, handles)

delete(hObject);



function pushbutton10_Callback(hObject, eventdata, handles)

run About;
