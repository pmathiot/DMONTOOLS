CDF   $   
      time_counter       x         y         gdept               history      �Fri Jun 25 16:35:31 2010: ncks -F --append -v votemper_NINO4 ORCA025-G70_NINO4.nc -o ORCA025-G70_NINO.nc
Fri Jun 25 16:35:31 2010: ncks -F --append -v votemper_NINO3 ORCA025-G70_NINO3.nc -o ORCA025-G70_NINO.nc
Fri Jun 25 16:35:31 2010: ncks -F --append -v votemper_NINO34 ORCA025-G70_NINO34.nc -o ORCA025-G70_NINO.nc
Fri Jun 25 16:35:31 2010: ncrename -v mean_votemper,votemper_NINO12 ORCA025-G70_NINO12.nc
Fri Jun 25 16:35:31 2010: ncatted -O -a time_origin,time_counter,o,c,A.D. ORCA025-G70_NINO12.nc
Fri Jun 25 16:35:31 2010: ncatted -O -a units,time_counter,o,c,years ORCA025-G70_NINO12.nc
Fri Jun 25 16:35:31 2010: ncap -F -O -s time_counter = (time_counter / 31536000 ) + 1958 ORCA025-G70_NINO12.nc ORCA025-G70_NINO12.nc
Fri Jun 25 16:35:31 2010: ncrcat -O ORCA025-G70_y2002_NINO12.nc ORCA025-G70_y2003_NINO12.nc ORCA025-G70_y2004_NINO12.nc -o ORCA025-G70_NINO12.nc
Mon Apr 19 14:20:34 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:20:26 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:20:17 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:20:08 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:20:00 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:19:54 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:19:47 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:19:40 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:19:34 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:19:26 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc
Mon Apr 19 14:19:20 2010: ncrcat -A ORCA025-G70_y2002_NINO12.nc cdfmean.nc -o ORCA025-G70_y2002_NINO12.nc      nco_openmp_thread_number            NCO       	20100625          	   time_counter                units         years      time_origin       A.D.            �   nav_lon                   units         degrees_east   	valid_min         �4     	valid_max         C4     	long_name         	Longitude      	nav_model         Default grid        �   nav_lat                   units         degrees_north      	valid_min         ´     	valid_max         B�     	long_name         Latitude   	nav_model         Default grid        �   gdept                         �   votemper_NINO12                       units         C      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_Potential_Temperature     
short_name        mean_votemper      online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                     �   mean_3Dvotemper                       units         C      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_3DPotential_Temperature   
short_name        mean_3Dvotemper    online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                     �   votemper_NINO34                       units         C      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_Potential_Temperature     
short_name        mean_votemper      online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                     �   votemper_NINO3                        units         C      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_Potential_Temperature     
short_name        mean_votemper      online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                     �   votemper_NINO4                        units         C      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_Potential_Temperature     
short_name        mean_votemper      online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                     �        @B�SD�A�Aǜ�Aǜ�A�A�A4A���D�C�A��7A��7A��DA�qA�m�D�F�A��A��A��=A�T�A��:D�ImA�:IA�:IA�.&A��1A��D�LA�B�A�B�A�M�A��A�ӆD�N�A�͏A�͏A��A��fA��vD�QQA���A���A��A�e�A��D�S�A��IA��IA��4A�9�A��D�V�A���A���Aޣ�A��A��D�Y5A���A���A�k�A���A��	D�[�A��UA��UA��A��A�D�^�A¦EA¦EA��A�B\A�D�a�A˝�A˝�AਬAק�A�}�D�c�A�[�A�[�A���Aړ�A��D�f�Aؤ�Aؤ�A�joA��=A�ZD�imA�'^A�'^A��A�mJA�G�D�lA��A��Aޡ�A�$A�`�D�n�A���A���A�țA�GRA��nD�qQA���A���A���A�$A��D�s�A�L�A�L�A�ɂA̔qA�VZD�v�A�%A�%A�7A�t�A���D�y5A���A���Aن�A��A�,D�{�A�،A�،A��AΏMA���D�~�A���A���A�9�A��qA��UD���A��A��A�?�A�`"A��D���A�X�A�X�A�D�AւRA�v1D���Aٴ�Aٴ�Aܘ�Aۮ�A�T�D��mA��VA��VA�Aܟ�A��!D��A��A��A�?�A�.�A��D���A�mCA�mCA�K3Aӷ�A�FD��QA��}A��}A�CA�11A�e�D���A�aA�aA۬�Aː�A�eD���A�VA�VA�jIA�< A��8D��5A��A��A� �A�c�AꕲD���A���A���A�M�A�m�A�fD���A��aA��aAڎ�AϸNA��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            