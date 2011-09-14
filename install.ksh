#!/bin/ksh

### R.Dussin : installer for DMONTOOLS

#############################################################
### functions

edit_env() { echo $1 | cat >> $env_file ; }

chkdir() { if [ ! -d $1 ] ; then mkdir $1 ; fi ; }

install_pydmon() { cd $PYDMON_SRCDIR ; python setup.py install --install-lib=$PYDMON_LIBDIR --install-scripts=$PYDMON_BINDIR ; cd - ; }

#############################################################
### install yes or no

echo ''
echo '-------------------------------------------------------'
echo '>> you are about to install Drakkar MONitoring TOOLS...'
echo '>> do you want to continue (y/n) ?'

good_ans=0

while [ $good_ans == 0 ]  ; do

   read answer

   if [ $answer == 'y' ] || [ $answer == 'Y' ] ; then
      echo '>> Good choice !' ; good_ans=1
   elif [ $answer == 'n' ] || [ $answer == 'N' ] ; then
      echo '>> Oh ! Too bad' ; good_ans=1
   else
      echo '>> sorry ?!' ; good_ans=0
   fi

done

## define the DMONTOOLS ROOT DIRECTORY
DMON_ROOTDIR=$(pwd)
PYDMON_SRCDIR=$DMON_ROOTDIR/TIME_SERIES/python/pydmontools

#############################################################
### choose the custom shell

echo ''
echo '-------------------------------------------------------'
echo '>> What is your custom environnement shell ?           '
echo '>> for example .profile or .bashrc etc ( no C-shell )  '

good_ans=0

while [ $good_ans == 0 ]  ; do

   read answer

   if [ ! -f $HOME/$answer ] ; then
      echo ">> $HOME/$answer does not exists... try again, please" ; good_ans=0
   else
      good_ans=1
   fi

done

env_file=$HOME/$answer

#############################################################
### choose install directories for python bin and lib

echo ''
echo '-------------------------------------------------------'
echo '>> please choose where python binaries should be put   '
echo '>> for example /home/user/bin                          '

good_ans=0

while [ $good_ans == 0 ]  ; do

   read answer

   if [ ! -d $answer ] ; then
      echo ">> $answer does not exists... try again, please" ; good_ans=0
   else
      good_ans=1
   fi

done

PYDMON_BINDIR=$answer/pydmontools
chkdir $PYDMON_BINDIR
 

echo ''
echo '-------------------------------------------------------'
echo '>> please choose where python libraries should be put  '
echo '>> for example /home/user/lib/python                   '

good_ans=0

while [ $good_ans == 0 ]  ; do

   read answer

   if [ ! -d $answer ] ; then
      echo ">> $answer does not exists... try again, please" ; good_ans=0
   else
      good_ans=1
   fi

done

PYDMON_LIBDIR=$answer
chkdir $PYDMON_LIBDIR

if [ $PYDMON_LIBDIR == $PYDMON_BINDIR ] ; then
   echo "!!! Warning : python bin and lib are set to the same directory !!! "
fi

echo ''
echo '-------------------------------------------------------'
echo '>> python binaries will be installed in :              '
echo ">> $PYDMON_BINDIR                                      "
echo '>> python libaries will be installed in :              '
echo ">> $PYDMON_LIBDIR/pydmontools                          "

echo ''
echo '-------------------------------------------------------'
echo '>> do you want to continue (y/n) ?'

good_ans=0

while [ $good_ans == 0 ]  ; do

   read answer

   if [ $answer == 'y' ] || [ $answer == 'Y' ] ; then
      echo '>> proceeding !' ; good_ans=1
   elif [ $answer == 'n' ] || [ $answer == 'N' ] ; then
      echo '>> Oh ! Too bad' ; good_ans=1
   else
      echo '>> sorry ?!' ; good_ans=0
   fi

done

install_pydmon

edit_env ''
edit_env '#######################################################'
edit_env '### DMONTOOLS '
edit_env '#######################################################'
edit_env ''
edit_env '## set path for mkmeans and mkmonitor'
edit_env "export DMON_ROOTDIR=$DMON_ROOTDIR    "
edit_env 'export PATH=$PATH:$DMON_ROOTDIR/bin  '
edit_env ''
edit_env '## set path for python stuff         '
edit_env "export PYDMON_BINDIR=$PYDMON_BINDIR  "
edit_env "export PYDMON_LIBDIR=$PYDMON_LIBDIR  "
edit_env "export PYDMON_SRCDIR=$PYDMON_SRCDIR  "
edit_env 'export PATH=$PATH:$PYDMON_BINDIR     '
edit_env 'export PYTHONPATH=$PYTHONPATH:$PYDMON_LIBDIR'
edit_env ''
edit_env '## function for reinstall python stuff '
edit_env 'reinstall_pydmon() { cd $PYDMON_SRCDIR ; python setup.py install --install-lib=$PYDMON_LIBDIR --install-scripts=$PYDMON_BINDIR ; cd - ; }'

echo '>> to complete the install, please copy/paste and execute '
echo " cd $HOME ; . $env_file "