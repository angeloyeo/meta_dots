% clear; close all; clc;

load('C:\Psych\meta_dots\perceptData\perceptDataYDH.mat')
% load('C:\Psych\meta_dots\perceptData\perceptDataNNK.mat')
n_Ratings = 5;
varnames = {'nC_rS1', 'nI_rS1', 'nC_rS2', 'nI_rS2'};
clear res
for i_block = 1:length(DATA)
    nC_rS1 = zeros(1, n_Ratings + 1); % 1로 대답 & correct
    nI_rS1 = zeros(1, n_Ratings + 1); % 1로 대답 & incorrect
    nC_rS2 = zeros(1, n_Ratings + 1); % 2로 대답 & correct
    nI_rS2 = zeros(1, n_Ratings + 1); % 2로 대답 & incorrect
    
    ii= 1;
    for i_res = 1:2
        for i_cor = [1, 0]
            idx = DATA(i_block).results.response == i_res & DATA(i_block).results.correct == i_cor;
%             temp = round(fun_map(DATA(i_block).results.responseConf(idx), 0.2, 1, 0, 1) * n_Ratings);
            temp = round(DATA(i_block).results.responseConf(idx) * n_Ratings);
            temp(isnan(temp)) = 0; % 왜 NaN이 들어가지?
            for i = 1:length(temp)
                eval([varnames{ii},'(temp(i) + 1) = ', varnames{ii},'(temp(i) + 1) + 1;']);
            end
            
            ii=ii+1;
        end
    end
    
    
    res(i_block).responses.nR_S1 = [fliplr(nC_rS1), nI_rS2];
    res(i_block).responses.nR_S2 = [fliplr(nI_rS1), nC_rS2];
end
