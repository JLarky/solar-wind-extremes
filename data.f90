program test

implicit real*8 (a-h, o-z)
real*8 :: avg(6)

100 format(2I4,4I3,3I4,2I7,F6.2,I7,8F8.2,4F8.1,F7.2,F9.0,F6.2,2F7.2,F6.1,6F8.2,7I6,F7.2,3F9.2)
print *, 'sdfsdf'

open(unit=1, file='omni_filtered.dat', form='formatted', access='sequential')
open(unit=2, file='omni_new.dat')
open(unit=3, file='omni_1h.dat')


 count = 0
 ih_old = 0.0
 ih = 0.0
 avg = 0.
 num = 0

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


ih = (IYEAR*1000+IDAY)*100+IHOUR
if (ih_old.eq.ih) then
    ! same hour
    num = num +1
    avg(1) = avg(1)+Flow_pressure
    avg(2) = avg(2)+Speed
    avg(3) = avg(3)+Proton_Density
    avg(4) = avg(4)+BZ_GSM
    avg(5) = avg(5)+BY_GSM
    avg(6) = avg(6)+Alfven_mach_number
else
    ! new hour
    if (num.ne.0) then
	avg = avg/num
	write (3,*) ih, num, avg
    end if

    ! reset
    ih_old = ih
    avg = 0.
    num = 0
end if

write (2,*) Flow_pressure, Speed, Proton_Density, BZ_GSM, BY_GSM, Alfven_mach_number

end do

1 continue

print *, 'end'

end program
