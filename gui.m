%% gui initialize
function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 09-Apr-2018 21:08:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


%%
function loadimage_Callback(hObject, eventdata, handles)
global img_ori;
global filename;
global line_xaxes;
global line_yaxes;
global line_zaxes;
img_ori = imread(['image/', filename, '.png']);
figure(2);
imshow(img_ori);
hold on;
mat_name = [filename, '_line_xyz.mat'];
if exist(mat_name,'file') ~= 0
    load(mat_name);
end

%%
function addlinex_Callback(hObject, eventdata, handles)
global line_xaxes;
figure(2);
pos = addnewline('r-', 3, 'x');
line_xaxes = [line_xaxes; pos];

function addliney_Callback(hObject, eventdata, handles)
global line_yaxes;
figure(2);
pos = addnewline('g-', 3, 'y');
line_yaxes = [line_yaxes; pos];

function addlinez_Callback(hObject, eventdata, handles)
global line_zaxes;
figure(2);
pos = addnewline('b-', 3, 'z');
line_zaxes = [line_zaxes; pos];

%%
function deletelinex_Callback(hObject, eventdata, handles)
global line_xaxes;
global line_yaxes; 
global line_zaxes;
if isempty(line_xaxes)
    return;
end
global img_ori;
figure(2);
hold off;
imshow(img_ori);
hold on;
line_xaxes(end, :) = [];
drawallline(line_xaxes, line_yaxes, line_zaxes);

function deleteliney_Callback(hObject, eventdata, handles)
global line_xaxes;
global line_yaxes; 
global line_zaxes;
if isempty(line_yaxes)
    return;
end
global img_ori;
figure(2);
hold off;
imshow(img_ori);
hold on;
line_yaxes(end, :) = [];
drawallline(line_xaxes, line_yaxes, line_zaxes);

function deletelinez_Callback(hObject, eventdata, handles)
global line_xaxes;
global line_yaxes; 
global line_zaxes;
if isempty(line_zaxes)
    return;
end
global img_ori;
figure(2);
hold off;
imshow(img_ori);
hold on;
line_zaxes(end, :) = [];
drawallline(line_xaxes, line_yaxes, line_zaxes);

%%
function save_Callback(hObject, eventdata, handles)
global line_xaxes;
global line_yaxes;
global line_zaxes;
save('line_xyz_0410.mat', 'line_xaxes', 'line_yaxes', 'line_zaxes');

%%
function computevanishpoint_Callback(hObject, eventdata, handles)
% hObject    handle to computevanishpoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%
function computeH_Callback(hObject, eventdata, handles)
% hObject    handle to computeH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%
function create3dmodel_Callback(hObject, eventdata, handles)
% hObject    handle to create3dmodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%
function outputVRML_Callback(hObject, eventdata, handles)
% hObject    handle to outputVRML (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%
function reset_Callback(hObject, eventdata, handles)
global line_xaxes;
global line_yaxes;
global line_zaxes;
global img_ori;
global filename;
line_xaxes = [];
line_yaxes = [];
line_zaxes = [];
img_ori = [];
filename = 'box_small';
figure(2);
hold off;
clf;

%%
function exit_Callback(hObject, eventdata, handles)
    close;
%%