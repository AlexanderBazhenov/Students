% PLOT_Influence_Diagram_Empty
%xxlim = [0.5 1.5]
% plot ouliers area
       vertices = [0 -1 ; xxlim(2) (-xxlim(2)-1); 0 (-xxlim(2)-1); 0 -1 ];
        PP = patch (vertices(:,1), vertices(:,2), 0.7*[1 1 1]);
        set(PP, 'edgecolor', [ 0 0 0]); set(PP, 'facecolor', 0.9*[1 1 0]);
        vertices = [0 1 ; xxlim(2) (xxlim(2)+1); 0 (xxlim(2)+1); 0 1];
        PP = patch (vertices(:,1), vertices(:,2), 0.70*[1 1 1]);
        set(PP, 'edgecolor', [ 0 0 0]); set(PP, 'facecolor', 0.9*[1 1 0]);
        %
               vertices = [0 -1 ; xxlim(1) (-xxlim(2)-1); 0 (-xxlim(2)-1); 0 -1 ];
        PP = patch (vertices(:,1), vertices(:,2), 0.7*[1 1 1]);
        set(PP, 'edgecolor', [ 0 0 0]); set(PP, 'facecolor', 0.7*[1 1 0]);
        vertices = [0 1 ; xxlim(1) (xxlim(2)+1); 0 (xxlim(2)+1); 0 1];
        PP = patch (vertices(:,1), vertices(:,2), 0.7*[1 1 1]);
        set(PP, 'edgecolor', [ 0 0 0]); set(PP, 'facecolor', 0.7*[1 1 0]);
        %
        xx= [-1.5 1.5]
        yy = [2.5 2.5]
        ll = plot(xx, yy, '-w')
        set(ll, 'linewidth', 2)

        yy = [-2.5 -2.5]
        ll = plot(xx, yy, '-w')
        set(ll, 'linewidth', 2)
        % /plot ouliers area
% text(0.6, 2.2, 'Ouliers', 'Fontsize', 14);
% text(0.6, -2.2, 'Ouliers', 'Fontsize', 14);
% plot internal area
       vertices = [0 -1 ; 1 0; 0 1; 0 -1 ];
        PP = patch (vertices(:,1), vertices(:,2), [0 0 0]);
        set(PP, 'edgecolor', [ 0 0 0]); set(PP, 'facecolor', 0.9*[0 1 0]);
        % plot external area
        %
       vertices = [0 -1 ; -1 0; 0 1; 0 -1 ];
        PP = patch (vertices(:,1), vertices(:,2), [0 0 0]);
        set(PP, 'edgecolor', [ 0 0 0]); set(PP, 'facecolor', 0.7*[0 1 0]);
% /plot internal area


