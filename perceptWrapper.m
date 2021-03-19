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
% 처음부터 DrawText 해주게 되면 글이 center로 오지 않는 bug 있음.
DrawText(p.frame.ptr,{' '},'c');

Screen('Flip', p.frame.ptr);
WaitSecs(0.01)

%% 슬라이드 1: Introduction

InstructName = '슬라이드1';
instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
% 
% DrawText(p.frame.ptr,{...
%     double('안녕하세요!'), ' ' ,...
%     double('성신여자대학교 임상신경심리연구실에 오신 것을 환영합니다.'), ' ' , ' ', ...
%     double('지금부터 귀하께서 참여하실 실험에 대해 설명해드리겠습니다.'),' ', ...
%     double('자세히 읽어보시고, 궁금한 점은 실험자에게 문의해주시길 바랍니다..'),' ', ' ',...
%     double('스페이스 바를 눌러서 계속 진행합니다.')},'c');
% Screen('Flip', p.frame.ptr);
% WaitSecs(2);
% WaitAnyPress(KbName('space'));

%% 슬라이드 2: Example Stimuli 소개

InstructName = '슬라이드2';
instructScreen = imread(['지시문/' InstructName], 'tif');
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
%  
% DrawText(p.frame.ptr,{...
%     double('먼저 화면에 두 개의 원이 나타날 것입니다..'), ' ' ,...
%     double('두 개의 원 안에는 여러 개의 흰색 점이 있습니다.'), ' ' , ' ', ...
%     double('귀하께서는 두 개의 원 중 어느 쪽에 점이 더 많은지 맞혀야 합니다'),' ', ' ', ...
%     double('이후 귀하께서는 자신의 판단을 얼마나 확신하는지.'),' ', ...
%     double('점수를 매겨야 합니다.'),' ',' ',...
%     double('스페이스 바를 눌러서 계속 진행합니다.')},'c');
% Screen('Flip', p.frame.ptr);
% WaitSecs(2);
% WaitAnyPress(KbName('space'));

%% 슬라이드 3: 예를 들어, 다음과 같이 화면에 두 개의 원이 나타납니다

InstructName = '슬라이드3';
instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);

%% 슬라이드 4에서 표현하고자 했던 것
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

%% 슬라이드 5

InstructName = '슬라이드5';
instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
%  
% DrawText(p.frame.ptr,{...
%     double('귀하께서 가장 먼저 해야 할 것은'), ' ', ...
%     double('어떤 원에 점이 더 많은지 판단하여 선택하는 것입니다.'),' ',' ',...
%     double('왼쪽 원에 점이 더 많으면 "A"키를,'), ' ', ...
%     double('오른쪽 원에 점이 더 많으면 "D"키를 눌러주세요.'), ' ',' ',...
%     double('스페이스 바를 눌러서 계속 진행합니다.')},'c');
% 
% Screen('Flip', p.frame.ptr);
% WaitSecs(2);
% WaitAnyPress(KbName('space'));

%% 슬라이드 6

InstructName = '슬라이드6';
instructScreen = imread(['지시문/' InstructName], 'tif');
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));

%% 슬라이드 7
% 연습시행 시작 전 실험자 부르기.

InstructName = '슬라이드7';
instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
%% Training on task, no confidence rating
% put into function with arguments feedback, confidence,
% converge or continuous

% 연습 시행 시행 하겠다는 문구 송출
InstructName = '슬라이드8';
instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
 
feedback = 1;
conf = 0;
% conf = 1; % 테스트용
ntrials = Inf; % 원래 세팅
% ntrials = 2; % 테스트
staircase_reversal = 8;
stepsize = 4;
adapt  = 1;
start_x = round(.5*p.stim.REF); % start at REF+50%REF
results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);
xc=median(results.contrast(results.i_trial_lastreversal:end)); % contrast at end of block

%% 슬라이드 9~14: confidence rating 소개

for i = 9 :14
    InstructName = ['슬라이드',num2str(i)];
    instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
    Screen('Flip',p.frame.ptr);
    Screen(p.frame.ptr,'PutImage',instructScreen);
    Screen('Flip',p.frame.ptr);
    WaitSecs(2);
     WaitAnyPress(KbName('space'));
end

% 연습 trial 2번째 시작(feedback 없고, confidence score 매기는 경우)
feedback = 0;
conf = 1;
ntrials = 10; % 원래 세팅
% ntrials = 2; % 테스트용
staircase_reversal = Inf;
start_x = xc; 
stepsize = 1;
adapt = 0;
results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);

%% 슬라이드 16: 연습 종료를 알리는 슬라이드
InstructName = '슬라이드16';
instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
 
%% 슬라이드 17: Main task blocks (8 blocks of 25 trials)
InstructName = '슬라이드17';
instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
Screen('Flip',p.frame.ptr);
Screen(p.frame.ptr,'PutImage',instructScreen);
Screen('Flip',p.frame.ptr);
WaitSecs(2);
 WaitAnyPress(KbName('space'));
 
% DrawText (p.frame.ptr, {...
%     double('이제 연습에서와 같이 각각 25 번의 시도로 구성된 8 개의 블록을 수행하겠습니다.'),' ', ' ',...
%     double('질문이 있으면 지금 실험자에게 물어보세요!'),' ' ,...
%     double('스페이스 바를 누르면 실험이 시작됩니다.')}, 'c');
% Screen('Flip', p.frame.ptr);
% WaitSecs(0.5);
% WaitAnyPress(KbName('space'));

nblocks = 8;
feedback = 0;
conf = 1;
ntrials = 25; % 원래 값
% ntrials = 2; % 테스트용
staircase_reversal = Inf;
stepsize = 1;
adapt = 0;
for b = 1:nblocks
    start_x = xc;
    results = perceptRunBlock(p, feedback, conf, ntrials, staircase_reversal, stepsize, adapt, start_x);
    xc=round(median(results.contrast(results.i_trial_lastreversal:end))); % contrast at end of block
    
    %% 슬라이드 22~29
    InstructName = ['슬라이드',num2str(21+b)];
    instructScreen = imread(['지시문/' InstructName], 'tif'); % 그림 사이즈 보다는 스크린 사이즈가 더 커야만 화면에 나옴.
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
