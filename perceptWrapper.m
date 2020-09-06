function perceptWrapper
% Dots task for perceptual metacognition
% Sebastien Massoni, modified by SF 2013

clear all
clc
addpath('C:\Psych\Psychtoolbox\')
KbName('UnifyKeyNames');
PsychJavaTrouble()
%% Parameters
p = perceptGetParams;
Screen('TextSize',p.frame.ptr,24);

% HideCursor;
%% dummy
% 처음부터 DrawText 해주게 되면 글이 center로 오지 않는 bug 있음.
DrawText(p.frame.ptr,{' '},'c');

Screen('Flip', p.frame.ptr);
WaitSecs(0.01)

%% Introduction

DrawText(p.frame.ptr,{'실험에 오신 것을 환영합니다!',' ',' ', '스페이스 바를 누르시고 어떤 실험 내용이 진행될지 알아봅시다!'},'c');

Screen('Flip', p.frame.ptr);
WaitSecs(2);
WaitAnyPress(KbName('space'));

%% Example stimul i

DrawText(p.frame.ptr,{'화면에 두 개의 원을 보실 수 있으실겁니다.', ' ' ,'각 원에는 여러개의 점들이 들어있지요.', ' ' , ...
    ' ', '여러분이 하실 일은 두 원 중 어떤 원에',' ', '더 많은 점들이 들어 있는지 맞추는 것입니다..',...
    ' ', '그리고 그 다음에는 여러분이 여러분의 선택에 대해',' ','얼마나 자신있는지를 점수화 해주세요..', ...
    ' ', '스페이스 바를 눌러서 계속 진행합니다.'},'c');
Screen('Flip', p.frame.ptr);
WaitSecs(2);
WaitAnyPress(KbName('space'));

DrawText(p.frame.ptr,'가령 이런 식으로 원들이 나옵니다.', 'c');
Screen('Flip', p.frame.ptr);
WaitSecs(1.0);

n=[40 60];
drawDots(p, n);
DrawFormattedText(p.frame.ptr,'40 vs 60', 'center', p.my+p.stim.diam+50);
t=Screen('Flip', p.frame.ptr);
WaitSecs(3);

n=[50 30];
drawDots(p, n);
DrawFormattedText(p.frame.ptr,'50 vs 30', 'center', p.my+p.stim.diam+50);
t=Screen('Flip', p.frame.ptr);
WaitSecs(3);

n=[53 58];
drawDots(p, n);
DrawFormattedText(p.frame.ptr,'53 vs 58', 'center', p.my+p.stim.diam+50);
t=Screen('Flip', p.frame.ptr);
WaitSecs(3);

n=[35 25];
drawDots(p, n);
DrawFormattedText(p.frame.ptr,'35 vs 25', 'center', p.my+p.stim.diam+50);
t=Screen('Flip', p.frame.ptr);
WaitSecs(3);

DrawText(p.frame.ptr,{'처음으로 수행할 과제는', ' ', '더 많은 점들이 들어있는 원을 선택하는 것입니다.',' ',...
    '이제부터 해당 파트에 익숙해져 봅시다.', ' ',...
    '혹시나 너무 어림짐작 하는 것은 아닌가하고 걱정하지는 마세요.', ' ', '상당히 어려운 과제입니다!', ...
    ' ',' ','스페이스 바를 눌러서 계속 진행합니다.'},'c');

% DrawText(p.frame.ptr,{'The first part of the task is to choose', 'which circle contains the most points.',...
%     'We will next familiarise you with this part of the task.' , ...
%     'Don''t worry if some of your decisions feel like guesses - it is a hard task!', ...
%     ' ','Press the space bar to continue'},'c');

Screen('Flip', p.frame.ptr);
WaitSecs(2);
WaitAnyPress(KbName('space'));

DrawText(p.frame.ptr,{'연습해봅시다!',' ',' ','(스페이스 바를 눌러서 계속 진행합니다.)'},'c');
Screen('Flip', p.frame.ptr);
WaitSecs(0.5);
WaitAnyPress(KbName('space'));

Screen('FrameOval',p.frame.ptr,p.white,p.stim.rectL,p.stim.pen_width);
Screen('FrameOval',p.frame.ptr,p.white,p.stim.rectR,p.stim.pen_width);
t=Screen('Flip', p.frame.ptr);

%% Training on task, no confidence rating
% put into function with arguments feedback, confidence,
% converge or continuous

feedback = 1;
conf = 0;
% ntrials = 2; % 임의로 수정한 세팅
ntrials = Inf; % 원래 세팅
staircase_reversal = 8;
stepsize = 4;
adapt  = 1;
start_x = round(.5*p.stim.REF); % start at REF+50%REF
results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);
xc=median(results.contrast(results.i_trial_lastreversal:end)); % contrast at end of block

%% Training on task with confidence rating

DrawFormattedText(p.frame.ptr, [ '이제 신뢰도 척도 사용 연습을 해보겠습니다. \n\n 왼쪽 / 오른쪽 원 중 어떤 원에 점들이 더 많은지 선택한 후 \n'...
     '정답 여부에 대한 자신감을 평가할 수있는 슬라이딩 척도가 표시됩니다. \n\n'...
     '왼쪽 및 오른쪽 화살표 키를 사용하여 눈금에서 커서를 이동할 수 있습니다. \n'...
     '척도의 왼쪽 끝은 평소보다 자신감이 적다는 것을 의미하고 \n'...
     '척도의 오른쪽 끝은 평상시보다 더 자신감이 있음을 의미합니다. \n\n'...
     '하지만 어려운 일이라는 점을 기억 해주세요. 자신있게 정답을 확신하는 경우는 드뭅니다! \n'...
     '상대적인 신뢰 변화에 관심이 있으므로 전체 척도를 사용하는 것이 좋습니다. \n\n'...
     '(꼭 1점에서 6점까지 모든 점수를 이용해주세요)\n\n',...
     '선택한 것이 옳은지 그른지에 대한 피드백은 더 이상 없을 것입니다! \n\n'...
     '(계속하려면 스페이스 바를 누르십시오.)'], 'center', 'center');
% 
% DrawFormattedText(p.frame.ptr, ['We will now give you some practice at using the confidence scale. \n\n After you make a left/right choice,\n' ...
%     'you will see a sliding scale to allow you to rate your confidence in getting the right answer.\n\n'...
%     'You can move the cursor around on the scale using the left and right arrow keys\n'...
%     'The left end of the scale means that you are less confident than normal, and\n'...
%     'the right end of the scale means that you are more confident than normal.\n\n'...
%     'However, please remember that this is a difficult task - it`s rare that you will be very confident!\n'...
%     'As we are interested in relative changes in confidence, we encourage you to use the whole scale.\n\n' ...
%     'There won''t be any more feedback as to whether you are right or wrong!\n\n' ...
%     '(Press space bar to continue)'], 'center', 'center');

Screen('Flip', p.frame.ptr);
WaitSecs(0.5);
WaitAnyPress(KbName('space'));

feedback = 0;
conf = 1;
% ntrials = 2; % 임의로 수정한 세팅
ntrials = 10; % 원래 세팅
staircase_reversal = Inf;
start_x = xc; 
stepsize = 1;
adapt = 0;
results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);

%% Main task blocks (8 blocks of 25 trials)
DrawFormattedText (p.frame.ptr, [ '이제 연습에서와 같이 각각 25 번의 시도로 구성된 8 개의 블록을 수행하겠습니다. \n\n'...
     '질문이 있으면 지금 실험자에게 물어보세요! \n\n '...
     '스페이스 바를 누르면 실험이 시작됩니다.'], 'center', 'center');
% DrawFormattedText(p.frame.ptr, ['We will now ask you to do 8 blocks of 25 trials each, just like in the practice \n\n' ...
%     'If you have any questions, please ask the experimenter now! \n\n' ...
%     'Otherwise please press the space bar to start...'], 'center', 'center');
Screen('Flip', p.frame.ptr);
WaitSecs(0.5);
WaitAnyPress(KbName('space'));
nblocks = 8;
feedback = 0;
conf = 1;
ntrials = 25;
staircase_reversal = Inf;
stepsize = 1;
adapt = 0;
for b = 1:nblocks
    start_x = xc;
    results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);
    xc=round(median(results.contrast(results.i_trial_lastreversal:end))); % contrast at end of block
    DrawFormattedText(p.frame.ptr, ['잠깐 쉴까요? \n\n' ...
        '다음 블록을 시작할 준비가 되셨으면 스페이스바를 눌러주세요...'], 'center', 'center');
%     DrawFormattedText(p.frame.ptr, ['Take a break! \n\n' ...
%         'Please press the space bar to start the next block when you are ready...'], 'center', 'center');
    Screen('Flip', p.frame.ptr);
    WaitSecs(0.5);
    WaitAnyPress(KbName('space'));    
    DATA(b).results = results;
    
    save(p.filename,'DATA');
end

% 아래는 임시 코드
DATA(1).results = results;
save(p.filename,'DATA');
%% Save the data and exit
Screen('Closeall')
