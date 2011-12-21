program test

implicit real*8 (a-h, o-z)
real*8 :: avg(6)

print *, 'start'

open(unit=1, file='../data2/omni_1h.dat', form='formatted', access='sequential')
open(unit=2, file='data.dat')

 count = 0
 ih_old = 0.0
 ih = 0.0
 avg = 0.
 num = 0

do
read (1, *, end=1) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6

 count = count +1

!if (Pdyn.le.0.45) then
!if (Pdyn.ge.8.55) then
!if (SYMH.le.-79.25) then
!if (SYMH.ge.19.38) then
!if (BYGSM.le.-9.57) then
!if (BYGSM.ge.9.95) then
!if (BZGSM.le.-8.43) then
!if (BZGSM.ge.8.68) then
!if (Speed.le.280.19) then
if (Speed.ge.723.47) then
    print *, ih !, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH
    write (2, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if

end do

1 continue

print *, 'end'

end program
