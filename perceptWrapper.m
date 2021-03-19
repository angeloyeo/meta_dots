function perceptWrapper
% Dots task for perceptual metacognition
% Sebastien Massoni, modified by SF 2013

clear
clc
% addpath('C:\Psych\Psychtoolbox\')
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

%% �����̵� 1: Introduction

InstructName = '�����̵�1';
instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
% 
% DrawText(p.frame.ptr,{...
%     double('�ȳ��ϼ���!'), ' ' ,...
%     double('���ſ��ڴ��б� �ӻ�Ű�ɸ������ǿ� ���� ���� ȯ���մϴ�.'), ' ' , ' ', ...
%     double('���ݺ��� ���ϲ��� �����Ͻ� ���迡 ���� �����ص帮�ڽ��ϴ�.'),' ', ...
%     double('�ڼ��� �о�ð�, �ñ��� ���� �����ڿ��� �������ֽñ� �ٶ��ϴ�..'),' ', ' ',...
%     double('�����̽� �ٸ� ������ ��� �����մϴ�.')},'c');
% Screen('Flip', p.frame.ptr);
% WaitSecs(2);
% WaitAnyPress(KbName('space'));

%% �����̵� 2: Example Stimuli �Ұ�

InstructName = '�����̵�2';
instructScreen = imread(['���ù�/' InstructName], 'tif');
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
%  
% DrawText(p.frame.ptr,{...
%     double('���� ȭ�鿡 �� ���� ���� ��Ÿ�� ���Դϴ�..'), ' ' ,...
%     double('�� ���� �� �ȿ��� ���� ���� ��� ���� �ֽ��ϴ�.'), ' ' , ' ', ...
%     double('���ϲ����� �� ���� �� �� ��� �ʿ� ���� �� ������ ������ �մϴ�'),' ', ' ', ...
%     double('���� ���ϲ����� �ڽ��� �Ǵ��� �󸶳� Ȯ���ϴ���.'),' ', ...
%     double('������ �Űܾ� �մϴ�.'),' ',' ',...
%     double('�����̽� �ٸ� ������ ��� �����մϴ�.')},'c');
% Screen('Flip', p.frame.ptr);
% WaitSecs(2);
% WaitAnyPress(KbName('space'));

%% �����̵� 3: ���� ���, ������ ���� ȭ�鿡 �� ���� ���� ��Ÿ���ϴ�

InstructName = '�����̵�3';
instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);

%% �����̵� 4���� ǥ���ϰ��� �ߴ� ��
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

%% �����̵� 5

InstructName = '�����̵�5';
instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
%  
% DrawText(p.frame.ptr,{...
%     double('���ϲ��� ���� ���� �ؾ� �� ����'), ' ', ...
%     double('� ���� ���� �� ������ �Ǵ��Ͽ� �����ϴ� ���Դϴ�.'),' ',' ',...
%     double('���� ���� ���� �� ������ "A"Ű��,'), ' ', ...
%     double('������ ���� ���� �� ������ "D"Ű�� �����ּ���.'), ' ',' ',...
%     double('�����̽� �ٸ� ������ ��� �����մϴ�.')},'c');
% 
% Screen('Flip', p.frame.ptr);
% WaitSecs(2);
% WaitAnyPress(KbName('space'));

%% �����̵� 6

InstructName = '�����̵�6';
instructScreen = imread(['���ù�/' InstructName], 'tif');
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));

%% �����̵� 7
% �������� ���� �� ������ �θ���.

InstructName = '�����̵�7';
instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
%% Training on task, no confidence rating
% put into function with arguments feedback, confidence,
% converge or continuous

% ���� ���� ���� �ϰڴٴ� ���� ����
InstructName = '�����̵�8';
instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
 
feedback = 1;
conf = 0;
% conf = 1; % �׽�Ʈ��
ntrials = Inf; % ���� ����
% ntrials = 2; % �׽�Ʈ
staircase_reversal = 8;
stepsize = 4;
adapt  = 1;
start_x = round(.5*p.stim.REF); % start at REF+50%REF
results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);
xc=median(results.contrast(results.i_trial_lastreversal:end)); % contrast at end of block

%% �����̵� 9~14: confidence rating �Ұ�

for i = 9 :14
    InstructName = ['�����̵�',num2str(i)];
    instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
    Screen('Flip',p.frame.ptr);
    Screen(p.frame.ptr,'PutImage',instructScreen);
    Screen('Flip',p.frame.ptr);
    WaitSecs(2);
     WaitAnyPress(KbName('space'));
end

% ���� trial 2��° ����(feedback ����, confidence score �ű�� ���)
feedback = 0;
conf = 1;
ntrials = 10; % ���� ����
% ntrials = 2; % �׽�Ʈ��
staircase_reversal = Inf;
start_x = xc; 
stepsize = 1;
adapt = 0;
results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);

%% �����̵� 16: ���� ���Ḧ �˸��� �����̵�
InstructName = '�����̵�16';
instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
 
%% �����̵� 17: Main task blocks (8 blocks of 25 trials)
InstructName = '�����̵�17';
instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
 
% DrawText (p.frame.ptr, {...
%     double('���� ���������� ���� ���� 25 ���� �õ��� ������ 8 ���� ����� �����ϰڽ��ϴ�.'),' ', ' ',...
%     double('������ ������ ���� �����ڿ��� �������!'),' ' ,...
%     double('�����̽� �ٸ� ������ ������ ���۵˴ϴ�.')}, 'c');
% Screen('Flip', p.frame.ptr);
% WaitSecs(0.5);
% WaitAnyPress(KbName('space'));

nblocks = 8;
feedback = 0;
conf = 1;
ntrials = 25; % ���� ��
% ntrials = 2; % �׽�Ʈ��
staircase_reversal = Inf;
stepsize = 1;
adapt = 0;
for b = 1:nblocks
    start_x = xc;
    results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);
    xc=round(median(results.contrast(results.i_trial_lastreversal:end))); % contrast at end of block
    
    %% �����̵� 22~29
    InstructName = ['�����̵�',num2str(21+b)];
    instructScreen = imread(['���ù�/' InstructName], 'tif'); % �׸� ������ ���ٴ� ��ũ�� ����� �� Ŀ�߸� ȭ�鿡 ����.
    Screen('Flip',p.frame.ptr);
    Screen(p.frame.ptr,'PutImage',instructScreen);
    Screen('Flip',p.frame.ptr);
    WaitSecs(2);
    WaitAnyPress(KbName('space'));
    
    DATA(b).results = results;
    
    save(p.filename,'DATA');
end

%% Save the data and exit
Screen('Closeall')
