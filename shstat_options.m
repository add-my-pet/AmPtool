%% shstat_options
% Sets options for function 'shstat' one by one.

%%
function shstat_options (key, val)
  %  created at 2016/04/28 by Bas Kooijman
  
  %% Syntax
  % <../shstat_options.m *shstat_options*> (key, val)
  
  %% Description
  % A dual purpose function which :
  %
  % Allows to see which options are set.
  %    Type 'shstat_options' to print to console all of the options 
  %    (a string called key) and corresponding values (a string called val) or
  %
  % Sets options for function <shstat.html *shstat*> 
  %  Type 'shstat_options('default') to set all of the 6 options at default values
  %  and/or set the values of each option one at a time. 
  %
  % Input
  %
  % * no input: print values to screen (use this to see values of options)
  % * one input: use this to set all of the options to a default:
  %
  %   - 'default':  sets options at default values
  %
  % * two inputs: (strings key and val) use this to set one by one values for each option)
  %
  %   - key 'x_transform', val 'log10',  'none' 
  %   - key 'y_transform', val 'log10',  'none' 
  %   - key 'z_transform', val 'log10',  'none'
  %   - key 'x_label', val 'on',  'off' 
  %   - key 'y_label', val 'on',  'off'
  %   - key 'z_label', val 'on',  'off'
  %
  % Output
  %
  % * no output (however globals are set to values or values are printed to
  % screen)

%% Remarks
% The function <shstat.html *shstat*> allows making plots in 1 till three
% dimensions and the function <shstat_options.html *shstat_options*> is
% allowing the user to define whether or not the x, y and z axis are 10 log
% transform or not. Values for 'x_transform' are either '1og10' or 'none'
% (and same applies for y and z transform options). The other option is
% whether or not to show the labels of each axis on the figure. So in that
% vein the option 'x_label' is either 'on' or 'off'. The same applies for y
% and z labels. The shortest way to define all of the options is to set the
% options to 'default' (in which case log10 transform and showing the axis
% labels are the defaults) and then define only the options the user needs
% to set different from default. If the user does not first set the options
% to 'default' then the user must define values for each of the options
% before calling function  <shstat.html *shstat*>.

%% Example of use
% shstat_options('default'); shstat_options('x_transform', 'none')

    global x_transform y_transform z_transform x_label y_label z_label

    if ~exist('key', 'var')
      key = 'unknown';
    end
     
    switch key
	
      case 'default'
	    x_transform = 'log10';
	    y_transform = 'log10';
	    z_transform = 'log10';
        x_label = 'off';
        y_label = 'off';
        z_label = 'off';

      case 'x_transform'
	    if ~exist('val','var')
	      if numel(x_transform) ~= 0
	        fprintf(['x_transform = ', x_transform,' \n']);  
	      else
            fprintf('x_transform = unknown \n');
	      end	      
	    else
	      x_transform = val;
	    end

      case 'y_transform'
	    if ~exist('val','var')
	      if numel(y_transform) ~= 0
	        fprintf(['y_transform = ', y_transform,' \n']);  
	      else
            fprintf('y_transform = unknown \n');
	      end	      
	    else
	      y_transform = val;
        end

      case 'z_transform'
	    if ~exist('val','var')
	      if numel(z_transform) ~= 0
	        fprintf(['z_transform = ', z_transform,' \n']);  
	      else
            fprintf('z_transform = unknown \n');
	      end	      
	    else
	      z_transform = val;
        end

      case 'x_label'
	    if ~exist('val','var')
	      if numel(x_label) ~= 0
	        fprintf(['x_label', x_label,' \n']);  
	      else
            fprintf('x_label = unknown \n');
	      end	      
	    else
	      x_label = val;
        end

      case 'y_label'
	    if ~exist('val','var')
	      if numel(y_label) ~= 0
	        fprintf(['y_label', y_label,' \n']);  
	      else
            fprintf('y_label = unknown \n');
	      end	      
	    else
	      y_label = val;
        end

      case 'z_label'
	    if ~exist('val','var')
	      if numel(z_label) ~= 0
	        fprintf(['z_label', z_label,' \n']);  
	      else
            fprintf('z_label = unknown \n');
	      end	      
	    else
	      z_label = val;
	    end

      otherwise 
	    if numel(x_transform) ~= 0
          fprintf(['x_transform = ', x_transform,' \n']);
	    else
	      fprintf('x_transform = unknown \n');
	    end	      
	    if numel(y_transform) ~= 0
	      fprintf(['y_transform = ', y_transform,' \n']);
	    else
	      fprintf('y_transform = unknown \n');
	    end
	    if numel(z_transform) ~= 0
	      fprintf(['z_transform = ', z_transform,' \n']);
	    else
	      fprintf('z_transform = unknown \n');
	    end
 	    if numel(x_label) ~= 0
          fprintf(['x_label = ', x_label,' \n']);
	    else
	      fprintf('x_label = unknown \n');
	    end	      
	    if numel(y_label) ~= 0
	      fprintf(['y_label = ', y_label,' \n']);
	    else
	      fprintf('y_label = unknown \n');
	    end
	    if numel(z_label) ~= 0
	      fprintf(['z_label = ', z_label,' \n']);
	    else
	      fprintf('z_label = unknown \n');
	    end
    end