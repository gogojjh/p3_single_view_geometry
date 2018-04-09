function tmouse(action)
% TMOUSE 本例展示如何以Handle Graphics来设定滑鼠事件(Mouse
% Events)的反应指令(Callbacks)
if nargin == 0, action = 'start'; end
 switch(action)
  % 开启图形视窗
  case 'start',
   axis([0 1 0 1]);% 设定图轴范围
   box on;% 将图轴加上图框
   title('Click and drag your mouse in this window!');
   % 设定滑鼠按钮被按下时的反应指令为「tmouse down」
   set(gcf, 'WindowButtonDownFcn', 'tmouse down');
  % 滑鼠按钮被按下时的反应指令
  case 'down',
   % 设定滑鼠移动时的反应指令为「tmouse move」
   set(gcf, 'WindowButtonMotionFcn', 'tmouse move');
   % 设定滑鼠按钮被释放时的反应指令为「tmouse up」
   set(gcf, 'WindowButtonUpFcn', 'tmouse up');
   % 列印「Mouse down!」讯息
   fprintf('Mouse down!\n');
  % 滑鼠移动时的反应指令
  case 'move',
   currPt = get(gca, 'CurrentPoint');
   x = currPt(1,1);
   y = currPt(1,2);
   line(x, y, 'marker', '.', 'EraseMode', 'xor');
   % 列印「Mouse is moving!」讯息及滑鼠现在位置
   fprintf('Mouse is moving! Current location = (%g, %g)\n', currPt(1,1), currPt(1,2));
  % 滑鼠按钮被释放时的反应指令
  case 'up',
   % 清除滑鼠移动时的反应指令
   set(gcf, 'WindowButtonMotionFcn', '');
   % 清除滑鼠按钮被释放时的反应指令
   set(gcf, 'WindowButtonUpFcn', '');
   % 列印「Mouse up!」讯息
   fprintf('Mouse up!\n');
 end