% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%% For debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bgcol(1)=80;
% bgcol(2)=200;
% white=[200 200 200]; 
% orange=[255 100 50]; 
% red=[255 20 20]; 
% blue=[100 100 255]; 
% green=[100 255 100]; 
% 
% %................... open a screen
% Screen('Preference', 'ConserveVRAM',4096);
% Screen('Preference','Verbosity',0);
% Screen('Preference','VBLTimestampingMode',-1);%
% % Get the screen numbers
% screens = Screen('Screens');
% % Draw to the external screen if avaliable
% screenNumber = max(screens);
% black = BlackIndex(screenNumber);
% 
% [wd, wdrect] = Screen('OpenWindow',0,black,[600 300 1300 800]);
% 
% 
% %---------------------------------------------------------------------------
% %                    SCREEN LAYOUT
% %---------------------------------------------------------------------------
% [wdw, wdh]=Screen('WindowSize', wd);	% Get screen size 
% 
% % text size 1/20 of y
% txtsize = round(wdh/20);
% 
% 
% %  		% Get Screen. This is always size of the display. ,bgcol(1)
% Screen('TextSize',wd,txtsize);				% Set size of text
% 
% % Set up alpha-blending for smooth (anti-aliased) lines
% Screen('BlendFunction', wd, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
% 
% 
% 
% text={};
% text{1}={'U ziet dus bijvoorbeeld het volgende:'};
% displaytext(text{1},wd,wdw,wdh,white,0,0);
% % DrawFormattedText(wd, 'Hello World', 'bottom',...
% %     wdh * 0.25, [1 0 0]);
% 
% 
% nrow=length(text);
% for k=1:nrow
%     wt=[];
% 	[wt]=Screen(wd,'TextBounds',text{1}{1});
% 	xpos=wdw/2-wt(3)/2;
% 	ypos=wdh/2+2*(k-1-nrow/2)*wt(4);
% 	Screen('Drawtext',wd,text{1}{1},xpos,ypos);
% end
% Screen('Flip',wd);

%%%%%%%%%%%%%%%%%%%%%%%%%% For debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

text{1}={'Nogmaals bedankt dat u mee wilt doen aan dit onderzoek!',...
    'Wij vragen u zodadelijk een geheugentaak uit te gaan voeren.',...
    'U krijgt foto''s van gezichten te zien',...
    'Uw taak is om doel-gezichten te onthouden en om'...
    'andere gezichten niet te onthouden.',...
    '(U kunt in deze introductie telkens verder gaan door',...
    '2x op een knop te drukken)'};
text{2}={'Bij de doel-gezichten die u moet onthouden staat een',...
    'hoofdletter ''T'' in het midden van het beeld.',...
    'Dus als er een ''T'' in het beeld staat, moet u de gezichten onthouden',...
    'die op dat moment in beeld zijn !',...
    '(Drukt u 2x op een knop om verder te gaan)'};
text{3}={'Als er geen ''T'' in beeld staat, ziet u een kruisje in het midden',...
    'van het scherm.',...
    'Kijkt u dan alstublieft gewoon naar het scherm.',...
    'De gezichten die dan getoond worden hoeft u niet te onthouden.',...
    '(U kunt in deze introductie telkens verder gaan door',...
    '2x op een knop te drukken)'};


for i=1:length(text)
displaytext(text{i},wd,wdw,wdh,white,0,0);
KbStrokeWait;
KbStrokeWait;
end

% Now show a trial example:
text={};
text{1}={'U ziet dus bijvoorbeeld het volgende (2x drukken):'};
xpos = 0+txtsize;
ypos = 2*txtsize;
Screen('Drawtext',wd,text{1}{1},xpos,ypos);
Screen('Flip',wd,[],0);
KbStrokeWait;
KbStrokeWait;

text{2}={'De ''T'' in het midden van het scherm betekent dus dat,',...
    'U deze gezichten moet onthouden.(2x drukken)'};%,...
   % 'deze gezichten doel-gezichten zijn en moeten worden onthouden.'};
  %[nx, ny, textbounds, wordbounds] = DrawFormattedText(win, tstring [, sx][, sy][, color][, wrapat][, flipHorizontal][, flipVertical][, vSpacing][, righttoleft][, winRect])
ptrial =1;
 Screen('DrawTexture',wd,img{DesignTablePract.Face1(1),DesignTablePract.EoT(ptrial)},[],rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),:));
    Screen('DrawTexture',wd,img{DesignTablePract.Face2(ptrial),DesignTablePract.EoT(ptrial)},[],rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),:));
    Screen('TextSize',wd,tsize);
    Screen('DrawText',wd,['T'],[coor.xcntext], [coor.ycntext],white);
    Screen('TextSize',wd,txtsize);
    % flip screen to present
    Screen('Flip',wd,[],1);
    
  
xpos = 0+txtsize;
ypos = wdh-4*txtsize
Screen('Drawtext',wd,text{2}{1},xpos,ypos);
% Screen('Drawtext',wd,text{2}{2},xpos,ypos+txtsize);
Screen('Drawtext',wd,text{2}{2},xpos,ypos+txtsize+10); %aangepast
Screen('Flip',wd);   

KbStrokeWait;
KbStrokeWait;
    
% Instruct on update/ignore trials    
   % Na deze trial kunt u  
    text={};
text{1}={'Na het voorgaande beeld kan het zijn dat er nog 2 foto''s',...
    'getoond worden. Als er geen ''T'' bij staat, hoeft u deze',...
    ' NIET te onthouden.',...
    'Als er wel een ''T'' bij staat, moet u deze wel onthouden en',...
    'de vorige doel-gezichten vergeten!'};
for i=1:length(text)
displaytext(text{i},wd,wdw,wdh,white,0,0);
KbStrokeWait;
KbStrokeWait;
end

% Now show a trial example:
text={};
text{1}={'U ziet dan dus bijvoorbeeld het volgende:'};
xpos = 0+txtsize;
ypos = 2*txtsize;
Screen('Drawtext',wd,text{1}{1},xpos,ypos);
Screen('Flip',wd,[],0);
KbStrokeWait;
KbStrokeWait;

text{2}={'De ''T'' in het midden van het scherm betekent dus dat,',...
    'U nu deze gezichten moet onthouden.',...
    'En de vorige kan vergeten!'};%,...
   % 'deze gezichten doel-gezichten zijn en moeten worden onthouden.'};
  %[nx, ny, textbounds, wordbounds] = DrawFormattedText(win, tstring [, sx][, sy][, color][, wrapat][, flipHorizontal][, flipVertical][, vSpacing][, righttoleft][, winRect])
ptrial =1;
 Screen('DrawTexture',wd,img{DesignTablePract.Face3(ptrial),DesignTablePract.EoT(ptrial)},[],rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),:));
    Screen('DrawTexture',wd,img{DesignTablePract.Face4(ptrial),DesignTablePract.EoT(ptrial)},[],rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),:));
    Screen('TextSize',wd,tsize);
    Screen('DrawText',wd,['T'],[coor.xcntext], [coor.ycntext],white);
    % flip screen to present
    Screen('Flip',wd,[],1);
    Screen('TextSize',wd,txtsize);
    
xpos = 0+txtsize;
ypos = wdh-4*txtsize;
Screen('Drawtext',wd,text{2}{1},xpos,ypos-20);
% Screen('Drawtext',wd,text{2}{2},xpos,ypos+txtsize);
Screen('Drawtext',wd,text{2}{2},xpos,ypos+txtsize-10); %aangepst
%Screen('Drawtext',wd,text{2}{3},xpos,ypos+2*txtsize);
Screen('Drawtext',wd,text{2}{3},xpos,ypos+2*(txtsize)); %aangepast
Screen('Flip',wd);   

KbStrokeWait;
KbStrokeWait;

text={};
text{1}={'Het kan ook zijn dat u het volgende getoond wordt:'};
xpos = 0+txtsize;
ypos = 2*txtsize;
Screen('Drawtext',wd,text{1}{1},xpos,ypos);
Screen('Flip',wd,[],0);
KbStrokeWait;
KbStrokeWait;

text{2}={'Het ontbreken van de ''T'', betekent dat u',...
    'deze gezichten NIET moet onthouden.',...
    'Maar juist de vorige in gedachten moet houden.'};%,...
   % 'deze gezichten doel-gezichten zijn en moeten worden onthouden.'};
  %[nx, ny, textbounds, wordbounds] = DrawFormattedText(win, tstring [, sx][, sy][, color][, wrapat][, flipHorizontal][, flipVertical][, vSpacing][, righttoleft][, winRect])
ptrial =1;
 Screen('DrawTexture',wd,img{DesignTablePract.Face3(ptrial),DesignTablePract.EoT(ptrial)},[],rect(Posmat(DesignTablePract.PresPEoT(ptrial),1),:));
    Screen('DrawTexture',wd,img{DesignTablePract.Face4(ptrial),DesignTablePract.EoT(ptrial)},[],rect(Posmat(DesignTablePract.PresPEoT(ptrial),2),:));
    % % Draw the fixation cross in white, set it to the center of our screen and
    % % set good quality antialiasing
    Screen('DrawLines', wd, allCoords,...
        lineWidthPix, white, [coor.xcnt coor.ycnt], 2);
    % flip screen to present
    Screen('Flip',wd,[],1);
    
KbStrokeWait;
KbStrokeWait;
    
  
xpos = 0+txtsize;
ypos = wdh-4*txtsize
Screen('Drawtext',wd,text{2}{1},xpos,ypos-20);
% Screen('Drawtext',wd,text{2}{2},xpos,ypos+txtsize);
% Screen('Drawtext',wd,text{2}{3},xpos,ypos+2*txtsize);
Screen('Drawtext',wd,text{2}{2},xpos,ypos+txtsize-10); %aangepst
Screen('Drawtext',wd,text{2}{3},xpos,ypos+2*(txtsize)); %aangepast

Screen('Flip',wd);   KbStrokeWait;
KbStrokeWait;
% Instruct on probe 
   % Na deze trial kunt eu  
       text={};
text{1}={'Tot slot wordt u één van de voorgaande foto''s getoond.',...
    'Uw opdracht is om aan te geven waar deze foto in beeld stond.',...
    'Dit kunt u doen door een van de volgende knoppen in te drukken:',...
    '''D'' als u denkt dat de foto linksboven stond,',...
    '''K'' als u denkt dat de foto rechtsboven stond,',...
    '''C'' als u denkt dat de foto linksonder stond,',...
    '''M'' als u denkt dat de foto rechtsonder stond.',...
    ' ',...
    'Als u geen antwoord geeft binnen de tijdslimiet,',...
    'dan rekenen we het antwoord niet goed!',...
    'Probeer dus goed en snel te reageren!',...
    };
for i=1:length(text)
displaytext(text{i},wd,wdw,wdh,white,0,0);
KbStrokeWait;
KbStrokeWait;
end

% Instruct on probe 
       text={};
text{1}={'Hieropvolgend ziet u een voorbeeld hoe dit er uitziet.',...
    'De D,K,M,C letters worden in het echte spel overigens niet getoond.'};

for i=1:length(text)
displaytext(text{i},wd,wdw,wdh,white,0,0);
KbStrokeWait;
KbStrokeWait;
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
    Screen('DrawTexture',wd,img{tpimg,tmpemo},[],rect(5,:));
    
elseif DesignTablePract.TypeOfTrial(ptrial) == 2 || DesignTablePract.TypeOfTrial(ptrial) == 4 % ignore
    if DesignTablePract.Probe(ptrial)==1
        tpimg = DesignTablePract.Face1(ptrial);
    elseif DesignTablePract.Probe(ptrial)==2
        tpimg = DesignTablePract.Face2(ptrial);
    end
    tmpemo = DesignTablePract.EoUI(ptrial);
    Screen('DrawTexture',wd,img{tpimg,tmpemo},[],rect(5,:));
end

% Draw Boxes
for r=1:4
    % Screen('DrawTextures', wd, img{1,1,1}, [], rect(1,:));
    Screen('DrawLines', wd, [rect(r,[1 3 1 1 1 3 3 3]); rect(r,[2 2 2 4 4 4 4 2])], 2, blue);
    Screen('Drawtext',wd,'D',coor.x{1},coor.y{1});
    Screen('Drawtext',wd,'K',coor.x{2},coor.y{1});
    Screen('Drawtext',wd,'C',coor.x{1},coor.y{2});
    Screen('Drawtext',wd,'M',coor.x{2},coor.y{2});
end

% Flip to the screen
Screen('Flip', wd);
KbStrokeWait;
KbStrokeWait;
% U krijgt nu eerst een aantal oefentrials 
       text={};
text{1}={'U krijgt nu eerst een aantal oefen mogelijkheden.',...
    'Probeert u dit alstublieft zo goed mogelijk te doen.',...
    'Als u voldoende scoort, dan gaat u automatisch door naar',...
    'het echte spel.',...
    'In het begin zal het heel moeilijk lijken,',...
    'Ga rustig door, want ervaring leert,',...
    'dat het helemaal goed komt.',...
    'Zet uw vingers alvast op de toetsen C, D, K en M',...
    'Het spel gaat redelijk snel! (2x drukken)'};
for i=1:length(text)
displaytext(text{i},wd,wdw,wdh,white,0,0);
KbStrokeWait;
KbStrokeWait;
end

       text={};
text{1}={'Heeft u nog vragen aan de onderzoeker?',...
    'Stel deze dan nu.'};
for i=1:length(text)
displaytext(text{i},wd,wdw,wdh,white,0,0);
KbStrokeWait;
KbStrokeWait;
end

for i=1:10
       text={};
text{1}={'Het spel start over ',num2str(10-i),' seconden'};
for i=1:length(text)
displaytext(text{i},wd,wdw,wdh,white,0,0);
WaitSecs(1);
end
end


