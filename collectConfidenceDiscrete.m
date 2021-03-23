function [conf, RT]=collectConfidenceDiscrete(window,p)

curWindow = window;
center = [p.mx p.my];
% keys = [KbName('LeftArrow') KbName('RightArrow') KbName('Space')];
keys = [KbName('1'), KbName('2'), KbName('3'), KbName('4'), KbName('5'), KbName('6')];

%% Initialise VAS scale
VASwidth=p.stim.VASwidth_inPixels;
% VASheight=p.stim.VASheight_inPixels;
VASoffset=p.stim.VASoffset_inPixels;
% arrowwidth=p.stim.arrowWidth_inPixels;
% arrowheight=arrowwidth*1.2;
% l = VASwidth/2;
deadline = 0;

% Collect rating
start_time = GetSecs;
secs = start_time;
% max_x = center(1) + l;
% min_x = center(1) - l;
% range_x = max_x - min_x;

% while (secs - start_time) < p.times.confDuration_inSecs
while(1) % Duration 제한 두는 케이스에서 until response로 수정 
    WaitSecs(.07);
    [~,~,keyCode] = KbCheck(-1);
    secs = GetSecs;
    if sum(keyCode)==1
        direction = find(keyCode(keys));
        
        if direction>0 % 1~6중 어떤 숫자라도 들어온다면 deadline으로 넘겨버리기.
            deadline = 1;
            break;
        end
        
    end
    
    % Draw line
    Screen('DrawLine',curWindow,[255 255 255],center(1)-VASwidth/2,center(2)+VASoffset,center(1)+VASwidth/2,center(2)+VASoffset);
    % Draw left major tick
    Screen('DrawLine',curWindow,[255 255 255],center(1)-VASwidth/2,center(2)+VASoffset+20,center(1)-VASwidth/2,center(2)+VASoffset);
    % Draw right major tick
    Screen('DrawLine',curWindow,[255 255 255],center(1)+VASwidth/2,center(2)+VASoffset+20,center(1)+VASwidth/2,center(2)+VASoffset);
    
    % % Draw minor ticks
    tickMark = center(1) + linspace(-VASwidth/2,VASwidth/2,6);
    Screen('TextSize', curWindow, 24);
    tickLabels = {'1','2','3','4','5','6'};
    for tick = 1:length(tickLabels)
        Screen('DrawLine',curWindow,[255 255 255],tickMark(tick),center(2)+VASoffset+10,tickMark(tick),center(2)+VASoffset);
        DrawFormattedText(curWindow,tickLabels{tick},tickMark(tick)-10,center(2)+VASoffset-30,[255 255 255]);
    end
    DrawFormattedText(curWindow,double('얼마나 확신하시나요?'), 'center',  center(2)+VASoffset+75, [255, 255, 255]);

    Screen('Flip', curWindow);
end

if deadline == 0
    disp('deadline 0으로 와버림. 에러 있음. 수정할 것.');
    conf = NaN;
    RT = NaN;
    % Draw confidence text
%     DrawFormattedText(curWindow,'Too late!','center',center(2)+VASoffset+75,[255 255 255]);
    DrawFormattedText(curWindow,double('시간이 초과되었습니다!'), 'center',  center(2)+VASoffset+75, [255, 255, 255]);
    Screen('Flip', curWindow);
    pause(p.times.confFBDuration_inSecs);

elseif deadline == 1
%     conf = ((xpos-(center(1)-l))./range_x);
    conf = direction;
    RT = secs - start_time;
    
    %% Show confirmation arrow
    
     % Draw line
    Screen('DrawLine',curWindow,[255 255 255],center(1)-VASwidth/2,center(2)+VASoffset,center(1)+VASwidth/2,center(2)+VASoffset);
    % Draw left major tick
    Screen('DrawLine',curWindow,[255 255 255],center(1)-VASwidth/2,center(2)+VASoffset+20,center(1)-VASwidth/2,center(2)+VASoffset);
    % Draw right major tick
    Screen('DrawLine',curWindow,[255 255 255],center(1)+VASwidth/2,center(2)+VASoffset+20,center(1)+VASwidth/2,center(2)+VASoffset);
    
    % % Draw minor ticks
    tickMark = center(1) + linspace(-VASwidth/2,VASwidth/2,6);
    Screen('TextSize', curWindow, 24);
    tickLabels = {'1','2','3','4','5','6'};
    for tick = 1:length(tickLabels)
        Screen('DrawLine',curWindow,[255 255 255],tickMark(tick),center(2)+VASoffset+10,tickMark(tick),center(2)+VASoffset);
        DrawFormattedText(curWindow,tickLabels{tick},tickMark(tick)-10,center(2)+VASoffset-30,[255 255 255]);
    end
    DrawFormattedText(curWindow,double('얼마나 확신하시나요?'), 'center',  center(2)+VASoffset+75, [255, 255, 255]);
%     DrawFormattedText(curWindow,'Confidence?','center',center(2)+VASoffset+75,[255 255 255]);

    % Show arrow
%     arrowPoints = [([-0.5 0 0.5]'.*arrowwidth)+xpos ([1 0 1]'.*arrowheight)+center(2)+VASoffset];
%     Screen('FillPoly',curWindow,[255 0 0],arrowPoints);
    Screen('Flip', curWindow);
    pause(p.times.confFBDuration_inSecs);
end

