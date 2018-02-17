% Update the whole matavecontrol library by downloading from GitHub
% Author: Daniel Mårtensson, Februari 2018

function [retval] = updatematavecontrol(varargin)
  % Just update matavecontrol
  A = what('matavecontrol'); % Importat that it must stand 'matavecontrol'. Nothing else!
  
  % Get the information about where the files are
  path = A.path; % File path
  
  % Go to path dictionary
  cd(A.path);
  
  % Downloading listOfFunctions
  urlwrite('https://raw.githubusercontent.com/DanielMartensson/matavecontrol/master/listOfFunctions', 'listOfFunctions');
  
  % Read the listOfFunctions
  fid = fopen('listOfFunctions');
  txt = textscan(fid, '%s', 'delimiter', ','); % Importat to have the delimiter = ','
  % Remove this double struct
  fileList = txt{1,1};
  
  % Downloading all the other files
  [m, n] = size(fileList);
  for i = 1:m
    % Downloading
    nameOfFile = fileList{i, 1};
    URL = strcat('https://raw.githubusercontent.com/DanielMartensson/matavecontrol/master/sourcecode/', nameOfFile)
    [saveplace, Success] = urlwrite(URL, nameOfFile);
    saveplace
    Success
  end
  
  disp('Matavecontrol is updated!')
  
end
