function [fig1]=plot_tsmean(fig,filename1,filename2,nbmin,name,figname,print_fig, style,maxyear);
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% PLOTTING ROUTINE FOR TRANSPORTS
%%%%%%%%%%%%%%%%%%%%%%%

%  $Rev$
%  $Date$
%  $Id$
%--------------------------------------------------------------
global plotdir ydeb

%%%%% Declarations
font=8;
	variable = { ...
	'3D Global T mean' ;...
	'3D Global S mean' ;...
	'Global SSH mean' ;...
	'Global change in T ' ;...
	'Global change in S ' ;...
	'Global T anomaly' ;...
	'Global S anomaly' ;...
	} ; 

nhead= 1 ;   % 1 header line
%%%%% READ
T=load(filename1) ;
yr1 = T(nhead+1, 1 ) ;
[yr2,dum] = size(T(nhead+1:end, 1 ) ) ;
dep=T(1,4:end);yr =T(nhead+1:end,1);

if maxyear ~= 0 ; if yr2 > maxyear ; yr2 = maxyear ;  yr=yr(1:yr2) ; end ; end
 nbmin=min(nbmin,yr2) ;

if yr1 < 1900 ; yr = yr + ydeb - yr1 ; end

S=load(filename2) ;


%%%%%%%% PLOTS

%-----------------------------------------------
splt1 = 3 ;splt2 = 3 ;

subplot(splt1,splt2,1);hold on;plot(yr,T(nhead+1:nhead+ yr2,3),style);set(gca,'fontsize',font);grid;title(variable(1)    ,'fontsize',font) ;
  axis tight ; grid on
subplot(splt1,splt2,2);hold on;plot(yr,S(nhead+1:nhead+ yr2,3),style);set(gca,'fontsize',font);grid;title(variable(2)    ,'fontsize',font) ;
  axis tight ; grid on
subplot(splt1,splt2,3);hold on;plot(yr,T(nhead+1:nhead+ yr2,2),style);set(gca,'fontsize',font);grid;title(variable(3)    ,'fontsize',font) ;
  axis tight ; grid on


subplot(splt1,2,3);semilogy(T(nbmin+nhead,4:end)'-T(2,4:end)',-dep,style);hold on;set(gca,'fontsize',font);grid;title(variable(4)    ,'fontsize',font) ;axis tight;ylabel('Log Depth','fontsize',font) ; grid on
subplot(splt1,2,4);semilogy(S(nbmin+nhead,4:end)'-S(2,4:end)',-dep,style);hold on;set(gca,'fontsize',font);grid;title(variable(5)    ,'fontsize',font) ;axis tight;ylabel('Log Depth','fontsize',font) ; grid on

%tmp=T(2:end,4:end)';[I J]=size(tmp);for j=2:J;tmp(:,j)=tmp(:,j)-tmp(:,1);end;tmp(:,1)=0;subplot(splt1,2,4);contourf(yr,-dep,tmp,50);set(gca,'YScale','log');colorbar;set(gca,'fontsize',font);shading flat;grid;ylabel(variable(6),'fontsize',font) ;%axis tight;
%tmp=S(2:end,4:end)';[I J]=size(tmp);for j=2:J;tmp(:,j)=tmp(:,j)-tmp(:,1);end;tmp(:,1)=0;subplot(splt1,2,6);contourf(yr,-dep,tmp,50);set(gca,'YScale','log');colorbar;set(gca,'fontsize',font);shading flat;grid;ylabel(variable(7),'fontsize',font) ;%axis tight

xlabel (name,'fontsize',10) ;
	
	
                if print_fig == 1
%                cmd=sprintf('%s  %s  %s%s%s ','print','-dpsc','tsmean1.',figname','.ps') ;
%                orient tall;eval(cmd)
   if maxyear ~= 0 
                cmd=sprintf('%s  %s  %s%s%s%s%s ','print','-djpeg100',plotdir,'/','beg_tsmean1.',figname','.jpg') ;
   else
                cmd=sprintf('%s  %s  %s%s%s%s%s ','print','-djpeg100',plotdir,'/','tsmean1.',figname','.jpg') ;
   end
                orient tall;eval(cmd)
                end
		
		
%-----------------------------------------------
fig1=fig+1;
if nargout==0,
 clear cs
end;
