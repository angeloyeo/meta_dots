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
% ó������ DrawText ���ְ� �Ǹ� ���� center�� ���� �ʴ� bug ����.
DrawText(p.frame.ptr,{' '},'c');

Screen('Flip', p.frame.ptr);
WaitSecs(0.01)

%% Introduction

DrawText(p.frame.ptr,{'���迡 ���� ���� ȯ���մϴ�!',' ',' ', '�����̽� �ٸ� �����ð� � ���� ������ ������� �˾ƺ��ô�!'},'c');

Screen('Flip', p.frame.ptr);
WaitSecs(2);
WaitAnyPress(KbName('space'));

%% Example stimul i

DrawText(p.frame.ptr,{'ȭ�鿡 �� ���� ���� ���� �� �����ǰ̴ϴ�.', ' ' ,'�� ������ �������� ������ ���������.', ' ' , ...
    ' ', '�������� �Ͻ� ���� �� �� �� � ����',' ', '�� ���� ������ ��� �ִ��� ���ߴ� ���Դϴ�..',...
    ' ', '�׸��� �� �������� �������� �������� ���ÿ� ����',' ','�󸶳� �ڽ��ִ����� ����ȭ ���ּ���..', ...
    ' ', '�����̽� �ٸ� ������ ��� �����մϴ�.'},'c');
Screen('Flip', p.frame.ptr);
WaitSecs(2);
WaitAnyPress(KbName('space'));

DrawText(p.frame.ptr,'���� �̷� ������ ������ ���ɴϴ�.', 'c');
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

DrawText(p.frame.ptr,{'ó������ ������ ������', ' ', '�� ���� ������ ����ִ� ���� �����ϴ� ���Դϴ�.',' ',...
    '�������� �ش� ��Ʈ�� �ͼ����� ���ô�.', ' ',...
    'Ȥ�ó� �ʹ� ����� �ϴ� ���� �ƴѰ��ϰ� ���������� ������.', ' ', '����� ����� �����Դϴ�!', ...
    ' ',' ','�����̽� �ٸ� ������ ��� �����մϴ�.'},'c');

% DrawText(p.frame.ptr,{'The first part of the task is to choose', 'which circle contains the most points.',...
%     'We will next familiarise you with this part of the task.' , ...
%     'Don''t worry if some of your decisions feel like guesses - it is a hard task!', ...
%     ' ','Press the space bar to continue'},'c');

Screen('Flip', p.frame.ptr);
WaitSecs(2);
WaitAnyPress(KbName('space'));

DrawText(p.frame.ptr,{'�����غ��ô�!',' ',' ','(�����̽� �ٸ� ������ ��� �����մϴ�.)'},'c');
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
% ntrials = 2; % ���Ƿ� ������ ����
ntrials = Inf; % ���� ����
staircase_reversal = 8;
stepsize = 4;
adapt  = 1;
start_x = round(.5*p.stim.REF); % start at REF+50%REF
results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);
xc=median(results.contrast(results.i_trial_lastreversal:end)); % contrast at end of block

%% Training on task with confidence rating

DrawFormattedText(p.frame.ptr, [ '���� �ŷڵ� ô�� ��� ������ �غ��ڽ��ϴ�. \n\n ���� / ������ �� �� � ���� ������ �� ������ ������ �� \n'...
     '���� ���ο� ���� �ڽŰ��� ���� ���ִ� �����̵� ô���� ǥ�õ˴ϴ�. \n\n'...
     '���� �� ������ ȭ��ǥ Ű�� ����Ͽ� ���ݿ��� Ŀ���� �̵��� �� �ֽ��ϴ�. \n'...
     'ô���� ���� ���� ��Һ��� �ڽŰ��� ���ٴ� ���� �ǹ��ϰ� \n'...
     'ô���� ������ ���� ���ú��� �� �ڽŰ��� ������ �ǹ��մϴ�. \n\n'...
     '������ ����� ���̶�� ���� ��� ���ּ���. �ڽ��ְ� ������ Ȯ���ϴ� ���� �年�ϴ�! \n'...
     '������� �ŷ� ��ȭ�� ������ �����Ƿ� ��ü ô���� ����ϴ� ���� �����ϴ�. \n\n'...
     '(�� 1������ 6������ ��� ������ �̿����ּ���)\n\n',...
     '������ ���� ������ �׸����� ���� �ǵ���� �� �̻� ���� ���Դϴ�! \n\n'...
     '(����Ϸ��� �����̽� �ٸ� �����ʽÿ�.)'], 'center', 'center');
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
% ntrials = 2; % ���Ƿ� ������ ����
ntrials = 10; % ���� ����
staircase_reversal = Inf;
start_x = xc; 
stepsize = 1;
adapt = 0;
results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);

%% Main task blocks (8 blocks of 25 trials)
DrawFormattedText (p.frame.ptr, [ '���� ���������� ���� ���� 25 ���� �õ��� ������ 8 ���� ����� �����ϰڽ��ϴ�. \n\n'...
     '������ ������ ���� �����ڿ��� �������! \n\n '...
     '�����̽� �ٸ� ������ ������ ���۵˴ϴ�.'], 'center', 'center');
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
    DrawFormattedText(p.frame.ptr, ['��� �����? \n\n' ...
        '���� ����� ������ �غ� �Ǽ����� �����̽��ٸ� �����ּ���...'], 'center', 'center');
%     DrawFormattedText(p.frame.ptr, ['Take a break! \n\n' ...
%         'Please press the space bar to start the next block when you are ready...'], 'center', 'center');
    Screen('Flip', p.frame.ptr);
    WaitSecs(0.5);
    WaitAnyPress(KbName('space'));    
    DATA(b).results = results;
    
    save(p.filename,'DATA');
end

% �Ʒ��� �ӽ� �ڵ�
DATA(1).results = results;
save(p.filename,'DATA');
%% Save the data and exit
Screen('Closeall')
