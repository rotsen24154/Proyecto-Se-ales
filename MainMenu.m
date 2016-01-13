function varargout = MainMenu(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @MainMenu_OutputFcn, ...
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


% --- Executes just before MainMenu is made visible.
function MainMenu_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = MainMenu_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in desplazamiento.
function desplazamiento_Callback(hObject, eventdata, handles)
    disp('Desplazamiento');

% --- Executes on button press in reflejo.
function reflejo_Callback(hObject, eventdata, handles)
    global SignalResult IndexResult
    global SignalFromUser Index Frecuencia
    [SignalResult, IndexResult] = Reflejo(SignalFromUser, Index);
    if (get(handles.radiobutton3,'Value') == 1)
        disp('Reflejo');
        disp('------------------------------------------------------------------------------------------------------');
        disp(SignalResult);
        disp(IndexResult);
    else
        sound(SignalResult, Frecuencia);
    end
    
% --- Executes on button press in atenuacion.
function atenuacion_Callback(hObject, eventdata, handles)
    global SignalResult
    global SignalFromUser Frecuencia
    Factor = inputdlg('Factor de atenuacion','Atenuacion');
    Factor = str2double(Factor{:}); 
    [SignalResult] = Atenuacion(SignalFromUser, Factor);
    if (get(handles.radiobutton3,'Value') == 1)
        disp('Atenuacion');
        disp('------------------------------------------------------------------------------------------------------');
        disp(SignalResult);
    else
        sound(SignalResult, Frecuencia);
    end

% --- Executes on button press in ampliacion.
function ampliacion_Callback(hObject, eventdata, handles)
    global SignalResult
    global SignalFromUser Frecuencia
    Factor = inputdlg('Factor de ampliacion','Ampliacion');
    Factor = str2double(Factor{:}); 
    [SignalResult] = Ampliacion(SignalFromUser, Factor);
    if (get(handles.radiobutton3,'Value') == 1)
        disp('Ampliacion');
        disp('------------------------------------------------------------------------------------------------------');
        disp(SignalResult);
    else
        sound(SignalResult, Frecuencia);
    end
% --- Executes on button press in diezmacion.
function diezmacion_Callback(hObject, eventdata, handles)
    global SignalResult
    global SignalFromUser Index Frecuencia
    Factor = inputdlg('Factor de diezmacion','Diezmacion');
    Factor = str2double(Factor{:}); 
    [SignalResult] = Decimacion(SignalFromUser', Index, Factor);
    if (get(handles.radiobutton3,'Value') == 1)
        disp('Diezmacion');
        disp('------------------------------------------------------------------------------------------------------');
        disp(SignalResult);
    else
        sound(SignalResult, Frecuencia);
    end
    
% --- Executes on button press in espectroFrecuencias.
function espectroFrecuencias_Callback(hObject, eventdata, handles)
    disp('FFT');

% --- Executes on button press in interpolacion.
function interpolacion_Callback(hObject, eventdata, handles)
    disp('Interpolacion');

% --- Executes on button press in selectFile.
function selectFile_Callback(hObject, eventdata, handles)
    global SignalFromUser Index Frecuencia
    if (get(handles.radiobutton3,'Value') == 1)
        [FileName,PathName] = uigetfile('*.csv','Selecciona el archivo con los datos de la se?al discreta');
        FullPathName = strcat(PathName,FileName); %Obtengo la ruta del archivo de entradas
        [SignalFromUser, Index, Frecuencia] = LeerArchivo(FullPathName, 'discreta');
        SignalFromUser = SignalFromUser';
        set(handles.pathFile,'String',FullPathName)
    else
        [FileName,PathName] = uigetfile('*.wav','Selecciona el archivo de audio');
        FullPathName = strcat(PathName,FileName); %Obtengo la ruta del archivo de entradas
        [SignalFromUser, Index, Frecuencia] = LeerArchivo(FullPathName, 'audio');
        set(handles.pathFile,'String',FullPathName)
    end


% --- Executes during object creation, after setting all properties.
function pathFile_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end