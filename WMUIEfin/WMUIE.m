text={['Trial ',num2str(trial),' van ', num2str(Z.TotTr)]};
displaytext(text,wd,wdw,wdh,white,0,0)


%............. DRAW STIMULI
rectr=1; %set for time-measurement to 1, is counter.
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
% Start with iti
WaitSecs(T.iti);

Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
%----------------------------------------------------------------------------
%        Target set presentation
%----------------------------------------------------------------------------

% Present target unless it is a Nx_update trial (3)
if DesignTable.TypeOfTrial(trial) ~= 3
    % which places to present
    % place = 1 --> rect 1 and 2
    % place = 6 --> rect 3 and 4
    % place = 2 --> rect 1 and 3
    % place = 5 --> rect 2 and 4
    % place = 3 --> rect 1 and 4
    % place = 4 --> rect 2 and 3
    Screen('DrawTexture',wd,img{DesignTable.Face1(trial),DesignTable.EoT(trial),DesignTable.Gender(trial),DesignTable.SoF(trial)},[],rect(Posmat(DesignTable.PresPEoT(trial),1),:));
    Screen('DrawTexture',wd,img{DesignTable.Face2(trial),DesignTable.EoT(trial),DesignTable.Gender(trial),DesignTable.SoF(trial)},[],rect(Posmat(DesignTable.PresPEoT(trial),2),:));
    Screen('TextSize',wd,tsize);
    Screen('DrawText',wd,['T'],[coor.xcntext], [coor.ycntext],white);
    Screen('TextSize',wd,txtsize);
    % flip screen to present
    Screen('Flip',wd);
    
    if DesignTable.TypeOfTrial(trial) == 2 || DesignTable.TypeOfTrial(trial) == 4 %ignore
        correct= Posmat(DesignTable.PresPEoT(trial),DesignTable.Probe(trial));
    end
    
else
    % % Draw the fixation cross in white, set it to the center of our screen and
    % % set good quality antialiasing
    Screen('DrawLines', wd, [rect(Posmat(DesignTable.PresPEoT(trial),1),[1 3 1 1 1 3 3 3]); rect(Posmat(DesignTable.PresPEoT(trial),1),[2 2 2 4 4 4 4 2])], 2, white)
    Screen('DrawLines', wd, [rect(Posmat(DesignTable.PresPEoT(trial),2),[1 3 1 1 1 3 3 3]); rect(Posmat(DesignTable.PresPEoT(trial),2),[2 2 2 4 4 4 4 2])], 2, white)
    Screen('DrawLines', wd, allCoords,...
        lineWidthPix, white, [coor.xcnt coor.ycnt], 2);
    % Flip to the screen
    Screen('Flip', wd);
    
end
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
WaitSecs(T.targ);
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement

% present fixation cross
% Draw the fixation cross in white, set it to the center of our screen and
% set good quality antialiasing
Screen('DrawLines', wd, allCoords,...
    lineWidthPix, white, [coor.xcnt coor.ycnt], 2);

% Flip to the screen
Screen('Flip', wd);

% Wait inter trial duration target --> update/ignore
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
WaitSecs(T.itiu);
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement

%----------------------------------------------------------------------------
%       Update/ignore set presentation
%----------------------------------------------------------------------------

% Present second set of stimuli unless it is an Nx ignore trial (4)
if DesignTable.TypeOfTrial(trial)==4
    Screen('DrawLines', wd, [rect(Posmat(DesignTable.PresPEUI(trial),1),[1 3 1 1 1 3 3 3]); rect(Posmat(DesignTable.PresPEUI(trial),1),[2 2 2 4 4 4 4 2])], 2, white)
    Screen('DrawLines', wd, [rect(Posmat(DesignTable.PresPEUI(trial),2),[1 3 1 1 1 3 3 3]); rect(Posmat(DesignTable.PresPEUI(trial),2),[2 2 2 4 4 4 4 2])], 2, white)
    %     Screen('DrawLines', wd, [rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),:); rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),:)], 2, blue);
    Screen('DrawLines', wd, allCoords,...
        lineWidthPix, white, [coor.xcnt coor.ycnt], 2);
    Screen('Flip',wd,[],0);
else
    Screen('DrawTexture',wd,img{DesignTable.Face3(trial),DesignTable.EoUI(trial),DesignTable.Gender(trial),DesignTable.SoF(trial)},[],rect(Posmat(DesignTable.PresPEUI(trial),1),:));
    Screen('DrawTexture',wd,img{DesignTable.Face4(trial),DesignTable.EoUI(trial),DesignTable.Gender(trial),DesignTable.SoF(trial)},[],rect(Posmat(DesignTable.PresPEUI(trial),2),:));
    if DesignTable.TypeOfTrial(trial) == 1 || DesignTable.TypeOfTrial(trial) == 3 %update
        txt={'T'};
        Screen('TextSize',wd,tsize);
        Screen('DrawText',wd,['T'],[coor.xcntext], [coor.ycntext],white);
        Screen('TextSize',wd,txtsize);
        
        correct= Posmat(DesignTable.PresPEUI(trial),DesignTable.Probe(trial));
        Screen('Flip',wd,[],0);
    else
        Screen('DrawLines', wd, allCoords,...
            lineWidthPix, white, [coor.xcnt coor.ycnt], 2);
        Screen('Flip',wd,[],0);
    end
    % flip screen to present
    
end

% Wait inter trial duration target --> update/ignore
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
WaitSecs(T.iu);
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement

% Draw the fixation cross in white, set it to the center of our screen
Screen('DrawLines', wd, allCoords,...
    lineWidthPix, white, [coor.xcnt coor.ycnt], 2);

% Flip to the screen
Screen('Flip', wd);

% Wait inter trial duration target --> update/ignore
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
WaitSecs(T.itp);
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement

%----------------------------------------------------------------------------
%       Probe presentation
%----------------------------------------------------------------------------
% Draw Boxes
for r=1:4
    % Screen('DrawTextures', wd, img{1,1,1}, [], rect(1,:));
    Screen('DrawLines', wd, [rect(r,[1 3 1 1 1 3 3 3]); rect(r,[2 2 2 4 4 4 4 2])], 2, blue);
end
% Draw Probe (update = 1, ignore =2, Nx upd=3, Nx ign = 4)
if DesignTable.TypeOfTrial(trial) == 1 || DesignTable.TypeOfTrial(trial) == 3 %update
    % select face3 or face4 by Prope:
    if DesignTable.Probe(trial)==1
        tpimg = DesignTable.Face3(trial);
    elseif DesignTable.Probe(trial)==2
        tpimg = DesignTable.Face4(trial);
    end
    tmpemo = DesignTable.EoUI(trial);
    Screen('DrawTexture',wd,img{tpimg,tmpemo,DesignTable.Gender(trial),DesignTable.SoF(trial)},[],rect(5,:));
    
elseif DesignTable.TypeOfTrial(trial) == 2 || DesignTable.TypeOfTrial(trial) == 4 % ignore
    if DesignTable.Probe(trial)==1
        tpimg = DesignTable.Face1(trial);
    elseif DesignTable.Probe(trial)==2
        tpimg = DesignTable.Face2(trial);
    end
    tmpemo = DesignTable.EoT(trial);
    Screen('DrawTexture',wd,img{tpimg,tmpemo,DesignTable.Gender(trial),DesignTable.SoF(trial)},[],rect(5,:));
end



% Flip to the screen
Screen('Flip', wd,[],1);

Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement

t0=GetSecs; t1=t0; goodkey=0; keyCode=1; answer=[];
% Check which button is pressed and record time
while (t1-t0 < T.p) && ~goodkey;
    [keyIsDown, secs, keyCode, deltaSecs] = KbCheck;
    t1=GetSecs;
    if sum(keyCode)==1
        answer = find(strcmp(KbName(keyCode),buttons));
    end
    if answer
        goodkey=1;
        O.choice{trial} = KbName(keyCode);
        Screen('DrawLines', wd, [rect(answer,[1 3 1 1 1 3 3 3]); rect(answer,[2 2 2 4 4 4 4 2])], 2, orange);
        Screen('Flip', wd,[],0);
    end
end

Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
%record reaction time
if goodkey
    O.rt(trial) = secs-t0;
else
    O.rt(trial) = NaN;
end

% check wether answer was correct
if strcmp(KbName(keyCode),buttons{correct})
    O.correct(trial) = 1;
else
    O.correct(trial) = 0;
end

Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
t1=GetSecs;
WaitSecs(T.p-(t1-t0));
Trec.trial(trial,rectr)= GetSecs; rectr=rectr+1; %time measurement
Screen('Flip', wd,[],0);

if any(Z.Breaktrials==trial)
Break_instruct
end
