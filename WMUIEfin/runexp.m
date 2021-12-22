clear all
userinp = inputdlg({'Subject ID','Testdag (1 of 2)'},'Test informatie',[1 24;1 17])
sID         = str2num(userinp{1});
day         = str2num(userinp{2});

modifyme;	% set the main experimental parameters
preps; 		% setup for stimulus presentation sequences and other stuff

try 	% this is important: if there's an error, psychtoolbox will crash graciously
    % and move on to the 'catch' block at the end, where all screens etc are
    % closed.
    setup; 	% setup display, stimulus coordinates, load images etc.
%     ListenChar(2);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Beginning of experiment
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Trec.runexp(recre)=GetSecs; recre =recre+1;
    WaitSecs(0.01);
    
                WMUIE_pract_instruct;
    Trec.runexp(recre)=GetSecs; recre =recre+1;

    %     practice
    ptrial =0;    threshold =0; score=0;
            while threshold < 0.7 || ptrial<10
                ptrial = ptrial+1;
                WMUIE_practice  
            end
    Trec.runexp(recre)=GetSecs; recre =recre+1;
            WMUIE_instruct;
    Trec.runexp(recre)=GetSecs; recre =recre+1;
    
    %     trial
    for trial = 1:size(DesignTable,1)
        WMUIE
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % End of experiment
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %.............. save all in two separate files .............................
    
    Trec.runexp(recre)=GetSecs; recre =recre+1;
   if dosave; eval(['save(fullfile(logdir,''', namestring ,'.mat''));']);end
    if dosave; eval(['save(fullfile(logdir,''', namestring2 ,'.mat''));']);end
    
    if dutch
        text={'Het experiment is nu ten einde. Hartelijk dank voor uw hulp.'};
        displaytext(text,wd,wdw,wdh,orange,0,1);
    else
        text={'Das Experiment ist nun zu Ende. Vielen Dank fuer Ihre Hilfe.'};
        displaytext(text,wd,wdw,wdh,orange,0,1);
    end
    
    WaitSecs(3)
    Screen('CloseAll');
    
catch % execute this if there's an error, or if we've pressed the escape key
    Trec.runexp(recre)=GetSecs; recre =recre+1;
%     ListenChar(0);
    if aborted==0;	 % if there was an error
        fprintf(' ******************************\n')
        fprintf(' **** Something went WRONG ****\n')
        fprintf(' ******************************\n')
        if dosave; eval(['save(fullfile(logdir,''', namestring ,'crashed.mat''));']);end
    elseif aborted==1; % if we've abored by pressing the escape key
        fprintf('                               \n')
        fprintf(' ******************************\n')
        fprintf(' **** Experiment aborted ******\n')
        fprintf(' ******************************\n')
        if dosave; eval(['save(fullfile(logdir,''', namestring ,'aborted.mat''));']);end
    end
    Screen('CloseAll'); % close psychtoolbox, return screen control to OSX
    rethrow(lasterror)
    ShowCursor;
end
% ListenChar(0);

