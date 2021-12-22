text={};
text{1}={'Dat was het oefen gedeelte.',...
    'U haalde een goede score!',...
    'Gaat u zo door! (2x drukken)'};


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
