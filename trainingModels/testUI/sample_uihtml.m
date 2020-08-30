% Copyright (c) 2020 Michio Inoue
fig = uifigure('Position', [100,100,400,500]);
h = uihtml(fig);
h.HTMLSource = fullfile(pwd,'index.html');
h.Position = [25,25,350,450];