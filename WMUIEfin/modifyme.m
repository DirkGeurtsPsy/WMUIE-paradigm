%----------------------------------------------------------------------------
%        MAIN FILE TO EDIT
%
%        This is the only file that should demand any changes!!!
%
%----------------------------------------------------------------------------
fprintf('............ Setting basic parameters according to \n')
fprintf('............            MODIFYME.M\n'); fprintf('............ \n')
% clear all;     % Tabula rasa


%----------------------------------------------------------------------------
%        To save or not to save
%        This should ALWAYS be set to 1 when doing experiments obviously
%----------------------------------------------------------------------------
doinstr=1;
dosave=1;
debug =0;

%----------------------------------------------------------------------------
%        Subject's first name
%        NB: in single quotes!
%----------------------------------------------------------------------------

name = num2str(sID); %'A099'


%----------------------------------------------------------------------------
%        SUBJECT NUMBER
%       NB: in single quotes!
% 			all subjects starting from 1000... difference btw ctrls and patients
% 			explicitly above 
%----------------------------------------------------------------------------
subjn = sID;	

rootdir         = 'C:\MyPrograms\WMUIE\';
logdir = fullfile(rootdir,'Log','MINDstudy',num2str(sID),num2str(day));
if ~exist(fullfile(logdir),'dir')
    mkdir(fullfile(logdir));
end
%----------------------------------------------------------------------------
%        EXPERIMENTAL PARAMETERS
%----------------------------------------------------------------------------
if debug
Z.Npcell    =    8;             % number of trials per cell  [8 for debug];
else
Z.Npcell    =    20;             % number of trials per cell  [8 for debug];
end

Z.Nval      =    2;				% 2 valences (neutral/aversive)
Z.TotTr     = (2*Z.Nval*Z.Nval + 2*Z.Nval)*Z.Npcell;
Z.Nprespos  =    4;				% 4 positions:  (1) upper left;  (2) upper right;
                                %               (3) lower left;  (4) lower right;

Z.Nbreaks   =   3;                 % number of breaks
Z.Ntrbr     =   ceil(Z.TotTr/(Z.Nbreaks+1)); %number of trials before break, with N breaks
Z.Breaktrials = Z.Ntrbr:Z.Ntrbr-1:Z.TotTr-Z.Ntrbr;     

Z.Npersons  =   19;             % persons per gender per set
Z.Ngenblck  =   floor(Z.Npersons/4);             % 4 faces per trial
Z.ComPres   =    6;             % 6 possible options for two presented stimuli to be presented on 4 positions        
Z.Nset      =    2;
T.iti       =     1;            % inter trial interval
T.targ      =     2;            % duration of target presentation
T.itiu      =     1;            % duration between target and ignore/update
T.iu        =     1.5;            % duration of ignore/update set presentation
T.itp       =     1;          % duration between ignore/update and probe
T.p         =     2;          % duration of probe presentation.
 
buttons = {'d','k','c','m'};
%----------------------------------------------------------------------------
%        Language
%----------------------------------------------------------------------------
lang = 1;
if lang == 1
english=0;					
dutch=1;
german = 0;
elseif lang ==2
english=1;					
dutch=0;
german = 0;
elseif lang ==3
english=0;					
dutch=0;
german = 1;    
end

%----------------------------------------------------------------------------
%        IMAGE
%        Resolution: Should use min 50 for experiment, otherwise 
%        images are low quality. However, might need to adjust this... 
%        Color: Use anything you like 
%----------------------------------------------------------------------------
% txtsize=30;            % Size of text in pixels; this needs adjustment when
							  % screen size changes. For a screen that's 1024x767, use
							  % 40, for a large 1900x2100 screen use up to 65
