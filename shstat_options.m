%% shstat_options
% Sets options for function 'shstat' one by one.

%%
function shstat_options (key, val)
  %  created at 2016/04/28 by Bas Kooijman
  
  %% Syntax
  % <../shstat_options.m *shstat_options*> (key, val)
  
  %% Description
  % Sets options for function <shstat.html *shstat*> one by one.
  % Type 'shstat_options' to see values or
  %  type 'shstat_options('default') to set options at default values
  % 
  % Input
  %
  % * no input: print values to screen
  % * one input:
  %
  %   'default': sets options at default values
  %   any other key (see below): print value to screen
  %
  % * two inputs
  %
  %   'x_transform', default: 'log10'
  %   'y_transform', default: 'log10'
  %   'z_transform', default: 'log10'
  %
  % Output
  %
  % * no output, but globals are set to values or values are printed to screen

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