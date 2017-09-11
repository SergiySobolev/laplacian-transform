function varargout = LaplacianView(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LaplacianView_OpeningFcn, ...
                   'gui_OutputFcn',  @LaplacianView_OutputFcn, ...
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

function LaplacianView_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);

function varargout = LaplacianView_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;

function btnSelectImage_Callback(hObject, eventdata, handles)
    [FileName,PathName] = uigetfile('*.*', 'Select image to transform');
    path = strcat(PathName, FileName);
    set(handles.imagePath, 'String', path);
    orginalImage = imread(path);
    axes(handles.originalAxes);
    imshow(orginalImage);
    lObj = Laplacian(orginalImage);
    transformedImage = unsharpMasking(lObj, 8);
    axes(handles.transformedAxes);   
    imshow(transformedImage);
   
   
