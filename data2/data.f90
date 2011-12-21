program test

implicit real*8 (a-h, o-z)
real*8 :: avg(12)

100 format(I4,I4,I3,I3,F8.2,F8.2,F8.2,F8.1,F8.1,F8.1,F7.2,F9.0,F7.1,3X,I2,3X,I2,F8.4,F7.2,F7.2,F7.2,F7.2,F7.2,F7.2,F7.2)
print *, 'start'

open(unit=1, file='omni_ts05.dat', form='formatted', access='sequential')
open(unit=3, file='omni_1h.dat')


 count = 0
 ih_old = 0.0
 ih = 0.0
 avg = 0.
 num = 0

do
read (1, 100, end=1) IYEAR, IDAY, IHOUR, MIN, BXGSM, BYGSM, BZGSM, VXGSE, VYGSE, VZGSE, DEN, TEMP, SYMH,&
 IMFFLAG, ISWFLAG, TILT, Pdyn, W1, W2, W3, W4, W5, W6

 count = count +1

!print *, IYEAR, IDAY, IHOUR, MIN, BXGSM, BYGSM, BZGSM, VXGSE, VYGSE, VZGSE, DEN, TEMP, SYMH,&
! IMFFLAG, ISWFLAG, TILT, Pdyn, W1, W2, W3, W4, W5, W6

Speed = sqrt(Vxgse**2+Vygse**2+Vzgse**2)

ih = (IYEAR*1000+IDAY)*100+IHOUR
if (ih_old.eq.ih) then
    ! same hour
    num = num +1
    avg(1) = avg(1)+Pdyn
    avg(2) = avg(2)+Speed
    avg(3) = avg(3)+DEN
    avg(4) = avg(4)+BZGSM
    avg(5) = avg(5)+BYGSM
    avg(6) = avg(6)+SYMH
    avg(7) = W1 ! last win
    avg(8) = W2 ! last win
    avg(9) = W3 ! last win
    avg(10)= W4 ! last win
    avg(11)= W5 ! last win
    avg(12)= W6 ! last win
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

end do

1 continue

print *, 'end'

end program
