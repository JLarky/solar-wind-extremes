program test

implicit real*8 (a-h, o-z)

100 format(2I4,4I3,3I4,2I7,F6.2,I7,8F8.2,4F8.1,F7.2,F9.0,F6.2,2F7.2,F6.1,6F8.2,7I6,F7.2,3F9.2)
print *, 'sdfsdf'

open(unit=1, file='omni_filtered.dat', form='formatted', access='sequential')
open(unit=2, file='omni_new.dat')

 count = 0
do
read (1, 100, end=1) IYEAR, IDAY, IHOUR, MIN, ID_IMF_spacecraft, ID_SW_spacecraft, n_points_IMF, n_points_Plasma,&
     i_percent_of_interpolation, i_timeshift, iRMS_Timeshift, RMS_Min_var, iTime_btwn_observations,&
     Field_magnitude_average, BX_GSE, BY_GSE, BZ_GSE, BY_GSM, BZ_GSM, RMS_SD_B_scalar,&
     RMS_SD_field_vector, Speed, Vx_Velocity, Vy_Velocity, Vz_Velocity, Proton_Density,&
     Temperature, Flow_pressure, Electric_field, Plasma_beta, Alfven_mach_number,&
     S_C_Xgse, S_C_Ygse, S_c_Zgse, BSN_location_Xgse, BSN_location_Ygse, BSN_location_Zgse,&
     iAE_index, iAL_index, iAU_index, iSYM_D, iSYM_H, iASY_D, iASY_H, PCN_index,&
     Proton_flux_10_Mev, Proton_flux_30_Mev, Proton_flux_60_Mev

 count = count +1

!print *, IYEAR, IDAY, IHOUR, MIN, ID_IMF_spacecraft, ID_SW_spacecraft, n_points_IMF, n_points_Plasma,&
!     i_percent_of_interpolation, i_timeshift, iRMS_Timeshift, RMS_Min_var, iTime_btwn_observations,&
!     Field_magnitude_average, BX_GSE, BY_GSE, BZ_GSE, BY_GSM, BZ_GSM, RMS_SD_B_scalar,&
!     RMS_SD_field_vector, Speed, Vx_Velocity, Vy_Velocity, Vz_Velocity, Proton_Density,&
!     Temperature, Flow_pressure, Electric_field, Plasma_beta, Alfven_mach_number,&
!     S_C_Xgse, S_C_Ygse, S_c_Zgse, BSN_location_Xgse, BSN_location_Ygse, BSN_location_Zgse,&
!     iAE_index, iAL_index, iAU_index, iSYM_D, iSYM_H, iASY_D, iASY_H, PCN_index,&
!     Proton_flux_10_Mev, Proton_flux_30_Mev, Proton_flux_60_Mev

write (2,*) Flow_pressure, Speed, Proton_Density, BZ_GSM, BY_GSM, Alfven_mach_number

!if (count.gt.10) then
!    goto 1
!end if

end do

1 continue

print *, 'end'

end program



! 1995 1 0 5 50 50 1 1 100 913 0 99.99 60 1.26 0.09 0.94 -0.78 1.12 -0.50 0.00 0.00 311.4 -310.3 -1.6 25.5 18.46 17347. 3.58 0.16 70.48 53.1 4.95 35.52 15.58 11.75 -1.08 -0.98 28 -6 20 -1 10 30 9 0.59 0.32 0.07 0.03
! 1995 1 0 5 50 50 1 1 100 913 0.0E+0 99.99 60 1.26 0.09 0.94 -0.78 1.12 -0.5 0.0E+0 0.0E+0 311.4 -310.3 -1.6 25.5 18.46 17347.0 3.58 0.16 70.48 53.1 4.95 35.52 15.58 11.75 -1.08 -0.98 28 -6 20 -1 10 30 9 0.59 0.32 0.07 0.03
