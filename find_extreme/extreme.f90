program test

implicit real*8 (a-h, o-z)
real*8 :: avg(6)

print *, 'start'

open(unit=1, file='../data2/omni_1h.dat', form='formatted', access='sequential')
open(unit=2, file='data_pdyn_low.dat')
open(unit=3, file='data_pdyn_hight.dat')
open(unit=4, file='data_symh_low.dat')
open(unit=5, file='data_symh_hight.dat')
open(unit=6, file='data_bygsm_low.dat')
open(unit=7, file='data_bygsm_hight.dat')
open(unit=8, file='data_bzgsm_low.dat')
open(unit=9, file='data_bzgsm_hight.dat')
open(unit=10, file='data_speed_low.dat')
open(unit=11, file='data_speed_hight.dat')

 count = 0
 ih_old = 0.0
 ih = 0.0
 avg = 0.
 num = 0

do
read (1, *, end=1) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6

 count = count +1

if (Pdyn.le.0.45) then
    print *, ih !, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH
    write (2, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (Pdyn.ge.8.55) then
    write (3, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (SYMH.le.-79.25) then
    write (4, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (SYMH.ge.19.38) then
    write (5, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (BYGSM.le.-9.57) then
    write (6, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (BYGSM.ge.9.95) then
    write (7, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (BZGSM.le.-8.43) then
    write (8, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (BZGSM.ge.8.68) then
    write (9, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (Speed.le.280.19) then
    write (10, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (Speed.ge.723.47) then
    write (11, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if

end do

1 continue

print *, 'end'

end program
