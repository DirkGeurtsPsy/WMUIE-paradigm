

text={['Oefen trial ',num2str(ptrial)], ['Goed:',num2str(round(score*100)),'%']};
displaytext(text,wd,wdw,wdh,white,0,0);


%............. DRAW STIMULI
rectr=1; %set for time-measurement to 1, is counter.
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
% Start with iti
WaitSecs(T.iti);

Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
%----------------------------------------------------------------------------
%        Target set presentation
%----------------------------------------------------------------------------

% Present target unless it is a Nx_update ptrial (3)
if DesignTablePract.TypeOfTrial(ptrial) ~= 3
    % which places to present
    % place = 1 --> rect 1 and 2
    % place = 6 --> rect 3 and 4
    % place = 2 --> rect 1 and 3
    % place = 5 --> rect 2 and 4
    % place = 3 --> rect 1 and 4
    % place = 4 --> rect 2 and 3
    Screen('DrawTexture',wd,img{DesignTablePract.Face1(ptrial),DesignTablePract.EoT(ptrial),DesignTablePract.Gender(ptrial),DesignTablePract.SoF(ptrial)},[],rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),:));
    Screen('DrawTexture',wd,img{DesignTablePract.Face2(ptrial),DesignTablePract.EoT(ptrial),DesignTablePract.Gender(ptrial),DesignTablePract.SoF(ptrial)},[],rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),:));
    Screen('TextSize',wd,tsize);
    Screen('DrawText',wd,['T'],[coor.xcntext], [coor.ycntext],white);
    Screen('TextSize',wd,txtsize);
    % flip screen to present
    Screen('Flip',wd);
    
    if DesignTablePract.TypeOfTrial(ptrial) == 2 || DesignTablePract.TypeOfTrial(ptrial) == 4
        correct= Posmat(DesignTablePract.PresPEoT(ptrial),DesignTablePract.Probe(ptrial));
    end
    
else
    % % Draw the fixation cross in white, set it to the center of our screen and
    % % set good quality antialiasing
    Screen('DrawLines', wd, [rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),[1 3 1 1 1 3 3 3]); rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),[2 2 2 4 4 4 4 2])], 2, white)
    Screen('DrawLines', wd, [rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),[1 3 1 1 1 3 3 3]); rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),[2 2 2 4 4 4 4 2])], 2, white)
%     Screen('DrawLines', wd, [rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),:); rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),:)], 2, blue);
    Screen('DrawLines', wd, allCoords,...
        lineWidthPix, white, [coor.xcnt coor.ycnt], 2);
    % Flip to the screen
    Screen('Flip', wd);
    
end
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
WaitSecs(T.targ);
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement

% present fixation cross
% Draw the fixation cross in white, set it to the center of our screen and
% set good quality antialiasing
Screen('DrawLines', wd, allCoords,...
    lineWidthPix, white, [coor.xcnt coor.ycnt], 2);

% Flip to the screen
Screen('Flip', wd);

% Wait inter ptrial duration target --> update/ignore
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
WaitSecs(T.itiu);
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement

%----------------------------------------------------------------------------
%       Update/ignore set presentation
%----------------------------------------------------------------------------

% Present second set of stimuli unless it is an Nx ignore ptrial (4)
if DesignTablePract.TypeOfTrial(ptrial)==4
    Screen('DrawLines', wd, [rect(Posmat(DesignTablePract.PresPEUI(ptrial),1),[1 3 1 1 1 3 3 3]); rect(Posmat(DesignTablePract.PresPEUI(ptrial),1),[2 2 2 4 4 4 4 2])], 2, white)
    Screen('DrawLines', wd, [rect(Posmat(DesignTablePract.PresPEUI(ptrial),2),[1 3 1 1 1 3 3 3]); rect(Posmat(DesignTablePract.PresPEUI(ptrial),2),[2 2 2 4 4 4 4 2])], 2, white)
    %     Screen('DrawLines', wd, [rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),:); rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),:)], 2, blue);
    Screen('DrawLines', wd, allCoords,...
        lineWidthPix, white, [coor.xcnt coor.ycnt], 2);
    Screen('Flip',wd,[],0);
else
    Screen('DrawTexture',wd,img{DesignTablePract.Face3(ptrial),DesignTablePract.EoUI(ptrial),DesignTablePract.Gender(ptrial),DesignTablePract.SoF(ptrial)},[],rect(Posmat(DesignTablePract.PresPEUI(ptrial),1),:));
    Screen('DrawTexture',wd,img{DesignTablePract.Face4(ptrial),DesignTablePract.EoUI(ptrial),DesignTablePract.Gender(ptrial),DesignTablePract.SoF(ptrial)},[],rect(Posmat(DesignTablePract.PresPEUI(ptrial),2),:));
    if DesignTablePract.TypeOfTrial(ptrial) == 1 || DesignTablePract.TypeOfTrial(ptrial) == 3 %update
        txt={'T'};
        Screen('TextSize',wd,tsize);
        Screen('DrawText',wd,['T'],[coor.xcntext], [coor.ycntext],white);
        Screen('TextSize',wd,txtsize);
        
        correct= Posmat(DesignTablePract.PresPEUI(ptrial),DesignTablePract.Probe(ptrial));
        Screen('Flip',wd,[],0);
    else
        Screen('DrawLines', wd, allCoords,...
            lineWidthPix, white, [coor.xcnt coor.ycnt], 2);
        Screen('Flip',wd,[],0);
    end
    % flip screen to present
    
end

% Wait inter ptrial duration target --> update/ignore
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
WaitSecs(T.iu);
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement

% Draw the fixation cross in white, set it to the center of our screen
Screen('DrawLines', wd, allCoords,...
    lineWidthPix, white, [coor.xcnt coor.ycnt], 2);

% Flip to the screen
Screen('Flip', wd);

% Wait inter ptrial duration target --> update/ignore
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
WaitSecs(T.itp);
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement

%----------------------------------------------------------------------------
%       Probe presentation
%----------------------------------------------------------------------------
% Draw Boxes
for r=1:4
    % Screen('DrawTextures', wd, img{1,1,1}, [], rect(1,:));
    Screen('DrawLines', wd, [rect(r,[1 3 1 1 1 3 3 3]); rect(r,[2 2 2 4 4 4 4 2])], 2, blue);
end

% Draw Probe (update = 1, ignore =2, Nx upd=3, Nx ign = 4)
if DesignTablePract.TypeOfTrial(ptrial) == 1 || DesignTablePract.TypeOfTrial(ptrial) == 3 %update
    % select face3 or face4 by Prope:
    if DesignTablePract.Probe(ptrial)==1
        tpimg = DesignTablePract.Face3(ptrial);
    elseif DesignTablePract.Probe(ptrial)==2
        tpimg = DesignTablePract.Face4(ptrial);
    end
    tmpemo = DesignTablePract.EoUI(ptrial);
    Screen('DrawTexture',wd,img{tpimg,tmpemo,DesignTablePract.Gender(ptrial),DesignTablePract.SoF(ptrial)},[],rect(5,:));
    
elseif DesignTablePract.TypeOfTrial(ptrial) == 2 || DesignTablePract.TypeOfTrial(ptrial) == 4 % ignore
    if DesignTablePract.Probe(ptrial)==1
        tpimg = DesignTablePract.Face1(ptrial);
    elseif DesignTablePract.Probe(ptrial)==2
        tpimg = DesignTablePract.Face2(ptrial);
    end
    tmpemo = DesignTablePract.EoT(ptrial);
    Screen('DrawTexture',wd,img{tpimg,tmpemo,DesignTablePract.Gender(ptrial),DesignTablePract.SoF(ptrial)},[],rect(5,:));
end

% Flip to the screen
Screen('Flip', wd,[],1);

Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement

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
        Op.choice{ptrial} = KbName(keyCode);
        Screen('DrawLines', wd, [rect(answer,[1 3 1 1 1 3 3 3]); rect(answer,[2 2 2 4 4 4 4 2])], 2, orange);
        Screen('Flip', wd,[],0);
    end
end

Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
%record reactin time
if goodkey
    Op.rt(ptrial) = secs-t0;
else
    Op.rt(ptrial) = NaN;
end

% check wether answer was correct
if strcmp(KbName(keyCode),buttons{correct})
    Op.correct(ptrial) = 1;
else
    Op.correct(ptrial) = 0;
end

Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
t1=GetSecs;
WaitSecs(T.p-(t1-t0));
Trec.ptrial(ptrial,rectr)= GetSecs; rectr=rectr+1; %time measurement
Screen('Flip', wd,[],0);

thres = Op.correct(~isnan(Op.correct));
if ptrial<11
    threshold = mean(thres);
    score=mean(thres);
else
    threshold = mean(thres(ptrial-10:ptrial));
    score=mean(thres);
end
