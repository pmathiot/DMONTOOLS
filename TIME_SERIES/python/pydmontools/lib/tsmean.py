#!/usr/bin/env python
#=======================================================================
#                        General Documentation

"""tsmean : domain average temperature and salinity budgets for drakkar runs
"""
#-----------------------------------------------------------------------
#                       Additional Documentation
#
# Modification History:
#  - May 2010: Original module by R. Dussin and J. Le Sommer
#
# Copyright (c) 2010, R. Dussin and J. Le Sommer. For licensing, distribution
# conditions, contact information, and additional documentation see the wiki :
# https://servforge.legi.grenoble-inp.fr/projects/DMONTOOLS/wiki/TIME_SERIES/python.
#=======================================================================

#-----------------------------------------------------------------------

#- Module General Import and Declarations

import sys,os
import numpy as npy
import pydmontools 
from pydmontools import __readtools__ as rs
from pydmontools import __plottools__ as ps
plt = ps.plt 

myargs = pydmontools.default_argdict
osp = os.sep

#- parameters

plot_name = 'tsmean'
fig_size =  [15.,18.]
plt.rcParams.update({'figure.figsize': fig_size})

#=======================================================================
#--- Reading the data 
#=======================================================================

def read(argdict=myargs,fromfiles=[]):
    if fromfiles!=[]:                      # diagnostic mode... 
       if fromfiles[0].endswith('.nc'):    # if ncfile name is provided
          if not(len(fromfiles)==1):
             print 'please provide one netcdf filename'
             sys.exit() 
          return _readnc(fromfiles[0])
       elif fromfiles[0].endswith('.mtl'): # if mtlfile name is provided
          print 'mtl files are no longer supported'
	  sys.exit()
       else:                               
          pass
    elif fromfiles==[]:                    # production mode... 
       filenc   = _get_ncname(argdict=argdict)
       # first try to open a netcdf file
       if os.path.isfile(filenc):
          return _readnc(filenc) 
       else:
          print '>>> tsmean.py : No files found for frequency : ' + argdict['monitor_frequency'] ; exit()
          
def _get_ncname(argdict=myargs):
    #
    if rs.check_freq_arg(argdict['monitor_frequency']):

        filename = argdict['datadir'] + osp + argdict['config'] + '-' \
                 + argdict['case'] + '_' + argdict['monitor_frequency'] + '_TSMEAN.nc'

    return filename


#======================================================================= 

def _readnc(filenc=None):
    outdict = {} # creates the dictionnary which will contain the arrays 
    outdict['tmean']    = rs.readfilenc(filenc,'mean_3Dvotemper') 
    outdict['smean']    = rs.readfilenc(filenc,'mean_3Dvosaline') 
    outdict['sshmean']  = rs.readfilenc(filenc,'mean_3Dsossheig') 
    outdict['levels']   = rs.readfilenc(filenc,'gdept')           
    outdict['date']     = rs.get_datetime(filenc) 
    outdict['tmodel']   = rs.readfilenc(filenc,'mean_votemper')
    outdict['smodel']   = rs.readfilenc(filenc,'mean_vosaline')  
    return outdict # return the dictionnary of values 

#=======================================================================
#--- Plotting the data 
#=======================================================================

def plot(argdict=myargs,figure=None,color='r',tmean=None,smean=None,sshmean=None,levels=None,date=None,tmodel=None,smodel=None,compare=False):
   
    _date = ps.mdates.date2num(date) # now a numerical value

    if figure is None: # by default create a new figure
          figure = plt.figure()
    
    list3Dmean = ['tmean', 'smean', 'sshmean']
    titles3Dmean = ['3D Global T Mean', '3D Global S Mean', '3D Global SSH Mean']
    nb3Dmean=len(list3Dmean)

    for k in range(nb3Dmean) :
            ax1 = figure.add_subplot(3,nb3Dmean,k+1)
            ax1.plot(date, vars()[list3Dmean[k]], color + '.-')
            ax1.grid(True)
            ax1.axis([min(_date), max(_date),min(vars()[list3Dmean[k]]),max(vars()[list3Dmean[k]])])
            ps.set_dateticks(ax1)
            if not(compare) and k == 1 :
                plt.title(argdict['config'] + '-' + argdict['case']+'\n'+titles3Dmean[k])
            else :
                plt.title(titles3Dmean[k])

    ### 2) 2D PLOTS
    limits_temper=[-0.4, 0.4] ; step_temper = 0.005 ; step_tticks = step_temper * 10
    contours_temper=npy.arange(limits_temper[0],limits_temper[1]+step_temper,step_temper)
    ticks_temper=npy.arange(limits_temper[0],limits_temper[1]+step_tticks,step_tticks)

    limits_salin=[-0.07, 0.07] ; step_salin = 0.001 ; step_sticks = step_salin * 10
    contours_salin=npy.arange(limits_salin[0],limits_salin[1]+step_salin,step_salin)
    ticks_salin=npy.arange(limits_salin[0],limits_salin[1]+step_sticks,step_sticks)
    
    plt.subplot(3,nb3Dmean,nb3Dmean+1)
    plt.semilogy((tmodel[-1,:]-tmodel[0,:]),levels,color)
    plt.grid(True)
    plt.axis([min(tmodel[-1,:]-tmodel[0,:]), max(tmodel[-1,:]-tmodel[0,:]),max(levels),min(levels)])
    plt.ylabel('Log Depth')
    plt.title('Global change in T')

    plt.subplot(3,nb3Dmean,2*nb3Dmean+1)
    plt.semilogy((smodel[-1,:]-smodel[0,:]),levels,color)
    plt.grid(True)
    plt.axis([min(smodel[-1,:]-smodel[0,:]), max(smodel[-1,:]-smodel[0,:]),max(levels),min(levels)])
    plt.ylabel('Log Depth')
    plt.title('Global change in S')

    if not(compare):
       ax2 = figure.add_subplot(3,nb3Dmean,nb3Dmean+2)
       plt.contourf(date, levels, npy.transpose(tmodel[:,:]-tmodel[0,:]),contours_temper,extend='both')
       plt.colorbar(ticks=ticks_temper)
       ax2.grid(True)
       plt.yscale('log')
       ax2.axis([ min(_date), max(_date), max(levels),min(levels) ])
       plt.ylabel('Temperature anomaly')
       ps.set_dateticks(ax2)

       ax3 = figure.add_subplot(3,nb3Dmean,2*nb3Dmean+2)
       plt.contourf(date, levels, npy.transpose(smodel[:,:]-smodel[0,:]),contours_salin, extend='both')
       plt.colorbar(ticks=ticks_salin)
       ax3.grid(True)
       plt.yscale('log')
       ax3.axis([ min(_date), max(_date), max(levels),min(levels) ])
       plt.ylabel('Salinity anomaly')
       ps.set_dateticks(ax3)
    #
    return figure

#=======================================================================
#--- Save the plot 
#=======================================================================

def save(argdict=myargs,figure=None):
    if figure is None:
       figure = plt.gcf()
    plotdir, config, case = argdict['plotdir'], argdict['config'], argdict['case']
    monit_freq = argdict['monitor_frequency']
    plotdir_confcase = plotdir + '/' + config + '/PLOTS/' + config + '-' + case + '/TIME_SERIES/'
    figure.savefig(plotdir_confcase + '/' + config + '-' + case + '_' + monit_freq + '_tsmean.png')

#=======================================================================
#--- main 
#=======================================================================

def main(): 
   # get arguments
   parser = pydmontools.standard_pydmt_script_parser()
   (options, args) = parser.parse_args()
   # default argument dictionnary
   argdict = myargs 
   # updated with the command line options
   argdict.update(vars(options))
   #
   infiles = args     # default value is an empty list
   # read, plot and save   
   values = read(argdict=argdict,fromfiles=infiles)
   fig = plot(**values)
   if len(args)==0:
      save(argdict=argdict,figure=fig)
   else:
      fig.savefig('./tsmean.png')

if __name__ == '__main__':
    sys.exit(main() or 0)

