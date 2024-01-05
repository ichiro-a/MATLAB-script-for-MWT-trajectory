%%Drawing trajectories
clearvars
close all

files = dir('*.blobs');
fNames = {files.name}.';
fNum = height(struct2table(files));
b = [];
for i=1:fNum
    A{i,1} = readmatrix(fNames{i},'FileType','text',...
                        'delimiter', ' ',...
                        'ConsecutiveDelimitersRule','join',...
                        'CommentStyle','%');
    b = [b; A{i,1}];
end
b2 = b(:,1) > 0;
%% 
b3= b(b2,:);
t1 = 840; %from
t2 = 1020; %to
b3= b3(b3(:,2) > t1,:);
b3= b3(b3(:,2) < t2,:);
t= b3(:,2); x = b3(:,3); y = b3(:,4);
tMax = max(t);
c = colormap(jet);

F = figure('Position',[0 0 400 180]);
fname = 'N2';
% hold on
tiledlayout(1,2);
nexttile
% for i= t1:fix(tMax)
%     b4 = b3(round(t)==i,1:4);
%     scatter(b4(:,3),b4(:,4),10,c(ceil(256*(b4(:,2)-t1)/(tMax-t1)),:),'filled');
%     set(gca,'Color','k','xlim',[0,2000],'ylim',[0,2000]);
%     title(string(i));
%     pause(0.0001);
% end

nexttile
scatter(x,y,1,c(ceil(256*(t-t1)/(tMax-t1)),:),'filled');
% set(gca,'Color','k','xlim',[0,2000],'ylim',[0,2000]);
xticklabels([])
yticklabels([])
exportgraphics(F,strcat(fname,".pdf"),'ContentType','vector')