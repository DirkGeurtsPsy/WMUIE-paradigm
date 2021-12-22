fprintf('............ Setting up the screen   \n');

if debug
ShowCursor('Arrow');
else
HideCursor
end

    recre=1; % for time recording start.
    
%................... colours in RBG coordinates 
bgcol(1)=80;
bgcol(2)=200;
white=[200 200 200]; 
orange=[255 100 50]; 
red=[255 20 20]; 
blue=[100 100 255]; 
green=[100 255 100]; 
grey  = [0.85 0.85 0.85];
%................... open a screen
Screen('Preference', 'ConserveVRAM',4096);
Screen('Preference','Verbosity',0);
Screen('Preference','VBLTimestampingMode',-1);%
Screen('Preference', 'SkipSyncTests', 1);
% Get the screen numbers
screens = Screen('Screens');
% Draw to the external screen if avaliable
screenNumber = max(screens);
black = BlackIndex(screenNumber);

if debug
[wd, wdrect] = Screen('OpenWindow',0,black,[10 10 100 100]);
else
[wd, wdrect] = Screen('OpenWindow',0,black);
end
black = Screen('Maketexture',wd,black);

%---------------------------------------------------------------------------
%                    SCREEN LAYOUT
%---------------------------------------------------------------------------
[wdw, wdh]=Screen('WindowSize', wd);	% Get screen size 

% text size 1/20 of y
% txtsize = round(wdh/30);
% tsize = round(wdh/10);
txtsize = round(wdh/45); %aangepast - text fits screen
tsize = round(wdh/15); %aangepast


%  		% Get Screen. This is always size of the display. ,bgcol(1)
Screen('TextSize',wd,txtsize);				% Set size of text

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', wd, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');


fprintf('............ Loading images   \n');
% Here we load in the image files.
for stimset = 1:2; Stimset = {'S','T'};
    for gend = 1:2; Gend = {'M','F'};
        for pers = 1:Z.Npersons
            for emo = 1:2; Emo = {'NE','SA'};
                pictflnm = fullfile('StimFin',['B',Gend{gend},sprintf('%02d', pers),Emo{emo},Stimset{stimset},'.JPG']);
%                 if gend ==1
%                     persnr = pers;
%                 elseif gend ==2
%                     persnr = pers + Z.Npersons;
%                 end
                %             copyfile(pictflnm,fullfile('stimselect',['B',Gend{gend},sprintf('%02d', pers),Emo{emo},'S.JPG']));
                theImage{pers,emo,gend,stimset} = imread(pictflnm);
                
                % Make the image into a texture
                img{pers,emo,gend,stimset} = Screen('MakeTexture', wd, theImage{pers,emo,gend,stimset});
            end
        end
    end
end

% Get the size of the image
[h, w, s3] = size(theImage{1,1,1});
aspectRatio = h / w; 

%................... Presentation coordinates 
% coordinates for faces and probe
[coor.xcnt, coor.ycnt]  =    RectCenter(wdrect); % for probe
% coor.x{1}                =    wdw/4; % yleft
% coor.y{1}                =    wdh/4; % yup
% coor.x{2}                =    wdw-wdw/4; % xright
% coor.y{2}                =    wdh-wdh/4; % ylow
% for close to center presentation
coor.x{1}                =    coor.xcnt-0.5*min([wdh, wdw])/4-5; % yleft
coor.y{1}                =    coor.ycnt-0.5*(min([wdh, wdw])/4)*aspectRatio-5; % yup
coor.x{2}                =    coor.xcnt+0.5*min([wdh, wdw])/4+5;; % xright
coor.y{2}                =    coor.ycnt+0.5*(min([wdh, wdw])/4)*aspectRatio+5; % ylow

%coor.xcntext = coor.xcnt-txtsize;
%coor.ycntext = coor.ycnt;
coor.xcntext = coor.xcnt-txtsize-17;  %aangepast - T in center
coor.ycntext = coor.ycnt-40; %aangepast
% make five rectangles to present 
rect(1,:) = CenterRectOnPoint([0 0 min([wdh, wdw])/4 (min([wdh, wdw])/4)*aspectRatio],  coor.x{1},coor.y{1});
rect(2,:) = CenterRectOnPoint([0 0 min([wdh, wdw])/4 (min([wdh, wdw])/4)*aspectRatio],  coor.x{2},coor.y{1});
rect(3,:) = CenterRectOnPoint([0 0 min([wdh, wdw])/4 (min([wdh, wdw])/4)*aspectRatio],  coor.x{1},coor.y{2});
rect(4,:) = CenterRectOnPoint([0 0 min([wdh, wdw])/4 (min([wdh, wdw])/4)*aspectRatio],  coor.x{2},coor.y{2});
rect(5,:) = CenterRectOnPoint([0 0 min([wdh, wdw])/4 (min([wdh, wdw])/4)*aspectRatio],  coor.xcnt,coor.ycnt);
% 
% 
% 
for r= 1:4
linrect{r}= [rect(r,[1 3 1 1 1 3 3 3]); rect(r,[2 2 2 4 4 4 4 2])];
end
% 
% for r=1:5
% Screen('DrawTextures', wd, [img{r,1}], [], [rect(r,:)]);
% % Flip to the scree
% Screen('Flip', wd);
% WaitSecs(0.1);
% end
% 
% % draw boxes
for r=1:5
% Screen('DrawTextures', wd, img{1,1,1}, [], rect(1,:));
Screen('DrawLines', wd, [rect(r,[1 3 1 1 1 3 3 3]); rect(r,[2 2 2 4 4 4 4 2])], 2, blue);
% Flip to the screen
Screen('Flip', wd,[],1);
WaitSecs(0.1);
end

 Screen('TextSize',wd,tsize);
    Screen('DrawText',wd,['T'],[coor.xcntext], [coor.ycntext],white);
    Screen('TextSize',wd,txtsize);
    % flip screen to present
    Screen('Flip',wd);
% 
% 
% for i = 1:10
% 	text = {'Experiment start',num2str(i)};
% 	displaytext(text,wd,wdw,wdh,orange,0,0);
% end
% % 	checkabort;
% %---------------------------------------------------------------------------
% %                    Fixation cross
% %---------------------------------------------------------------------------

% Here we set the size of the arms of our fixation cross
fixCrossDimPix = round(wdh/20);

% Now we set the coordinates (these are all relative to zero we will let
% the drawing routine center the cross in the center of our monitor for us)
xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

% Set the line width for our fixation cross
lineWidthPix = 4;

% Draw the fixation cross in white, set it to the center of our screen and
% set good quality antialiasing
Screen('DrawLines', wd, allCoords,...
    lineWidthPix, white, [coor.xcnt coor.ycnt], 2);

% Flip to the screen
Screen('Flip', wd);

fprintf('............ Save stuff   \n');

eval(['save(fullfile(logdir,''', namestring ,'preps.mat''));']);


