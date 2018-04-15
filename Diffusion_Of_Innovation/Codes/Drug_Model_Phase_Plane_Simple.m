% A demonstration to show the solution to the system
%    x1' = -(k1 + k2) x1
%    x2' = k1 x1 - k3 x2,
% with initial condition x1(0) = I0 and x2(0) = 0.
%
% by Gavin LaRose, 10/22/2012
% 
% (c)2012 Regents of the University of Michigan
% This work is licensed under the
% Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
% To view a copy of this license, visit
% http://creativecommons.org/licenses/by-nc-sa/3.0/
% or send a letter to
% Creative Commons,
% 444 Castro Street, Suite 900,
% Mountain View, CA, 94041, USA.

function Drug_Model_Phase_Plane_Simple()
%-------------------------------------------------------------------------------
% configuration variables

    k1 = 0.128;
    k2 = 0.383;
    k3 = 0.0385;
    I0 = 25;

    % the initial conditions: the amount of the drug in each
    %    compartment initially
    x0 = [ I0; 0 ];
    
    % should we show a point on the curve and the resulting point
    %    and trajectory in the phase plane as well as the solutions?
    %    (set to 0 for no, 1 for yes)
    show_phase_plane = 1;
    
    % if we show the phase plane, should we give it its own window,
    %    or graph it next to the solution?  (set to 1 for yes, 0 to
    %    graph next to the phase plane)
    use_two_windows = 0;
    
    % if we show the phase plane, should we insert pauses between the 
    %    graph of the solution, the point on trajectory that we graph,
    %    and the graph of the phase plane?  (set to 1 for yes, 0 for no)
    include_pauses = 1;
    
    % the time to which to graph the solution
    t_max = 50;
    
    % colors
    x1_color = 'b';
    x2_color = 'r';
    pp_color = 'k';  % phase plane trajectory, point
    
    background_grey = [ 0.6 0.6 0.6 ];

%-------------------------------------------------------------------------------
% system definition: a function for the right-hand side of the system

    function out = rhs( t, x )
        out = [ -(k1+k2)*x(1); k1*x(1) - k3*x(2) ];
    end 
    
%-------------------------------------------------------------------------------
% initialization

    t_range = [ 0 t_max ];
    
% plot the point on the trajectory at this value of t
    t0 = 2;
    
% set up the graphics window
    scrsz    = get(0,'ScreenSize');
    scrsz(3) = min(1500, scrsz(3));
    scrsz(4) = min(900, scrsz(4));
    
    if use_two_windows
        hsc = 2.5;
    else
        hsc = 1.5;
    end
    
    fig1 = figure( 'OuterPosition', ...
                   [50 scrsz(4)/2 scrsz(3)/hsc scrsz(4)/2], ...
                   'Name', 'Model Solution' );
    
    if show_phase_plane == 0 | use_two_windows == 1
        fig1_axes = axes( 'Parent', fig1, 'Color', background_grey );

        % this ensures we have a toolbar
        set( fig1, 'Toolbar', 'figure' );
        fig_soln_axes = fig1_axes;
        
    else
        % then we're showing two figures, side by side
        fig_soln_axes = subplot( 1,2,1, 'Parent', fig1, ...
                                 'Color', background_grey );
        fig_ppln_axes = subplot( 1,2,2, 'Parent', fig1, ...
                                 'Color', background_grey );        
    end
    
    hold( fig_soln_axes );
    xlabel( fig_soln_axes, 't', 'FontSize', 15 );
    ylabel( fig_soln_axes, 'x1, x2', 'FontSize', 15 );
    title( fig_soln_axes, 'Solution curves', 'FontSize', 15 );

% similarly set up the ppln axes if they're in the same window
    if show_phase_plane == 1 & use_two_windows == 0
        hold( fig_ppln_axes );
        xlabel( fig_ppln_axes, 'x1', 'FontSize', 15 );
        ylabel( fig_ppln_axes, 'x2', 'FontSize', 15 );
        title( fig_ppln_axes, 'Phase plane and trajectory', ...
               'FontSize', 15 );
    end
    
%-------------------------------------------------------------------------------
% solution

    [t_sol, x_sol] = ode45( @rhs, linspace(t_range(1),t_range(2),100), x0 );

    t0ind = round((t0*100)/t_max)+1;
    
%-------------------------------------------------------------------------------
% plot the solution

    xplots = plot( fig_soln_axes, ...
                   t_sol, x_sol(:,1), [ x1_color '-' ], ...
                   t_sol, x_sol(:,2), [ x2_color '-' ], ...
                   'LineWidth', 2 );
    legend( xplots, { 'x1(t)', 'x2(t)' } );

% then, are we graphing more than this?
    if show_phase_plane == 1
        if include_pauses == 1
            pause on;
            disp( 'Press any key to continue' );
            pause
        end
        
% plot a point on the solution, and, if we already have the phase
%    plane axes set up, there as well
	plot( fig_soln_axes, ...
              [t0], [x_sol(t0ind,1)], [ x1_color '.' ], ...
              [t0], [x_sol(t0ind,2)], [ x2_color '.' ], ...
              'MarkerSize', 30 );
        
        text( 5,I0/2, ['(' num2str(t0) ', x_1(' num2str(t0) '))'], ...
              'FontSize', 15, 'Color', x1_color, 'Parent', fig_soln_axes );
        text( 6,I0/4, ['(' num2str(t0) ', x_2(' num2str(t0) '))'], ...
              'FontSize', 15, 'Color', x2_color, 'Parent', fig_soln_axes );
        axes( fig_soln_axes );
        arrow( [4.9,I0/2-.1], [t0+.1,x_sol(t0ind,1)+.1] );
        arrow( [5.9,I0/4-.1], [t0+.1,x_sol(t0ind,2)+.1] );
    
        if use_two_windows == 0
            plot( fig_ppln_axes, ...
                  [x_sol(t0ind,1)], [x_sol(t0ind,2)], [ pp_color '.' ], ...
                  'MarkerSize', 30 );
            axis( fig_ppln_axes, [ 0 I0 0 I0/2 ] );
            text(I0/2,I0/4, ...
                 [ '(x_1(' num2str(t0) '), x_2(' num2str(t0) '))' ], ...
                 'FontSize', 15, 'Parent', fig_ppln_axes );

            axes( fig_ppln_axes );
            arrow([I0/2-.1,I0/4-.1],[x_sol(t0ind,1)+.1,x_sol(t0ind,2)+.1]);
        end
 
        if include_pauses == 1 & use_two_windows
            disp( 'Press any key to continue' );
            pause;
        end
        
% if we still need to create a second window, do that, and show the
%    point in the phase plane as well
	if use_two_windows == 1
            fig2 = figure( 'OuterPosition', ...
                           [100 scrsz(4)/2 scrsz(3)/hsc scrsz(4)/2], ...
                           'Name', 'Phase Plane' );
            fig_ppln_axes = axes( 'Parent', fig2, 'Color', background_grey );
            set( fig2, 'Toolbar', 'figure' );
            
            xlabel( fig_ppln_axes, 'x1', 'FontSize', 15 );
            ylabel( fig_ppln_axes, 'x2', 'FontSize', 15 );
            title( fig_ppln_axes, 'Phase plane and trajectory', ...
                   'FontSize', 15 );
            
            hold(fig_ppln_axes);

 	end
 
        plot( fig_ppln_axes, ...
              [x_sol(t0ind,1)], [x_sol(t0ind,2)], [ pp_color '.' ], ...
              'MarkerSize', 30 );
        axis( fig_ppln_axes, [ 0 I0 0 I0/2 ] );
        text(I0/2,I0/4, ...
             [ '(x_1(' num2str(t0) '), x_2(' num2str(t0) '))' ], ...
             'FontSize', 15 );
        arrow([I0/2-.1,I0/4-.1],[x_sol(t0ind,1)+.1,x_sol(t0ind,2)+.1]);
        
        if include_pauses
            disp( 'Press any key to continue' );
            pause
        end
 
        % finally, show the trajectory
        plot( fig_ppln_axes, x_sol(:,1), x_sol(:,2), [ pp_color '-' ], ...
              'LineWidth', 2 );
        arrind = round(t0ind/4)+1;
        arrow( [x_sol(arrind,1),x_sol(arrind,2)], ...
               [x_sol(arrind+1,1),x_sol(arrind+1,2)] );
        
    end
end
% all done
%-------------------------------------------------------------------------------
