function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 30-Mar-2017 00:49:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename, ...
    'gui_Singleton', gui_Singleton, ...
    'gui_OpeningFcn', @main_OpeningFcn, ...
    'gui_OutputFcn', @main_OutputFcn, ...
    'gui_LayoutFcn', [], ...
    'gui_Callback', []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Se agregan carpetas al path
PATH_DEPTH = 3;

for i = 1:PATH_DEPTH
    
    try
        path_str = '';
        if i ~= 1
            for j = 1:i - 1
                path_str = strcat(path_str, '../');
            end
        end
        path_lib = cd(cd(strcat(path_str, 'lib')));
        addpath(path_lib);
        break
        
    catch Exception
        
        % Folders could not be found
        if i == PATH_DEPTH
            fprintf(getReport(Exception));
            error('Error while setting software path.');
        end
        
    end
end

% Centra la ventana
movegui(gcf, 'center');

% Carga las configuraciones
config;

% Desactivan los mensajes de Excel
warning('off', 'MATLAB:xlswrite:AddSheet');

% Carga el idioma
lang = load_lang(lang_id);

% Guarda variables en root
setappdata(handles.root, 'lang', lang);
setappdata(handles.root, 'lasthandles_folder', '');
setappdata(handles.root, 'table', '');
setappdata(handles.root, 'fines', '');

% Establece strings de la app
set(handles.root, 'Name', lang{1});
set(handles.buttonload, 'String', lang{4});
set(handles.properties, 'Title', lang{7});
set(handles.info_peso, 'String', lang{8});
set(handles.info_grava, 'String', lang{9});
set(handles.info_arena, 'String', lang{11});
set(handles.info_fino, 'String', lang{10});
set(handles.info_cc, 'String', lang{12});
set(handles.info_cu, 'String', lang{13});
set(handles.info_d10, 'String', lang{14});
set(handles.info_d30, 'String', lang{15});
set(handles.info_d60, 'String', lang{16});
set(handles.txt_tipofino, 'String', lang{17});
set(handles.panel_classification, 'Title', lang{18});
set(handles.info_simbologrupo, 'String', lang{20});
set(handles.info_nombregrupo, 'String', lang{21});
set(handles.menu_file, 'Label', lang{34});
set(handles.menu_help, 'Label', lang{35});
set(handles.menu_open, 'Label', lang{4});
set(handles.menu_save_plot, 'Label', lang{25});
set(handles.menu_close, 'Label', lang{26});
set(handles.menu_about, 'Label', lang{27});

% Elimina el estado
clear_status(handles, lang);

% Borra los tickz del gráfico
axes(handles.grafico);
xlabel(lang{23});
ylabel(lang{24});
title(lang{22});

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.root);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonload.
function buttonload_Callback(hObject, eventdata, handles)
% hObject    handle to buttonload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openfile(handles, getappdata(handles.root, 'lang'));


function filelabel_Callback(hObject, eventdata, handles) %#ok<*DEFNU>
% hObject    handle to filelabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filelabel as text
%        str2double(get(hObject,'String')) returns contents of filelabel as a double


% --- Executes during object creation, after setting all properties.
function filelabel_CreateFcn(hObject, eventdata, handles) %#ok<*INUSD>
% hObject    handle to filelabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end


% --- Executes on selection change in tipofino.
function tipofino_Callback(hObject, eventdata, handles)
% hObject    handle to tipofino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tipofino contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tipofino
tipofinos = {'', 'ML', 'MH', 'CL-CH', 'CL-ML', 'CL-CH', 'CL-ML'};
item = get(handles.tipofino, 'Value');
fino = tipofinos{item};
if ~strcmp(fino, '')
    setappdata(handles.root, 'fines', fino);
    set_classification(handles);
end


% --- Executes during object creation, after setting all properties.
function tipofino_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tipofino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end


% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_help_Callback(hObject, eventdata, handles)
% hObject    handle to menu_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_about_Callback(hObject, eventdata, handles)
% hObject    handle to menu_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about(getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function menu_open_Callback(hObject, eventdata, handles)
% hObject    handle to menu_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openfile(handles, getappdata(handles.root, 'lang'));


% --------------------------------------------------------------------
function menu_save_plot_Callback(hObject, eventdata, handles)
% hObject    handle to menu_save_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure();
plot_granulometry_table(getappdata(handles.root, 'table'), 'mm', getappdata(handles.root, 'lang'));
axes(handles.grafico);


% --------------------------------------------------------------------
function menu_close_Callback(hObject, eventdata, handles)
% hObject    handle to menu_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
