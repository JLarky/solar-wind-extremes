program test

implicit real*8 (a-h, o-z)
real*8 :: avg(6)

print *, 'start'

open(unit=1, file='../data2/omni_ts05_5m.dat', form='formatted', access='sequential')
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

! 1 %
Pdyn_min = 0.45
Pdyn_max = 8.55
SYMH_min = -79.25
SYMH_max = 19.38
BYGSM_min = -9.57
BYGSM_max = 9.95
BZGSM_min = -8.43
BZGSM_max = 8.68
Speed_min = 280.19
Speed_max = 723.47

! 0.1 %
Pdyn_min = 0.13
Pdyn_max = 18.69
SYMH_min = -167.60
SYMH_max = 36.95
BYGSM_min = -16.51
BYGSM_max = 18.94
BZGSM_min = -16.78
BZGSM_max = 16.99
Speed_min = 258.45
Speed_max = 811.27


! 5min 0.1%

Pdyn_min = 0.12
Pdyn_max = 19.78
SYMH_min = -171.40
SYMH_max = 38.80
BYGSM_min = -17.43
BYGSM_max = 19.86
BZGSM_min = -17.91
BZGSM_max = 17.87
Speed_min = 258.35
Speed_max = 815.91


if (Pdyn.le.Pdyn_min) then
    print *, ih !, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH
    write (2, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (Pdyn.ge.Pdyn_max) then
    write (3, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (SYMH.le.SYMH_min) then
    write (4, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (SYMH.ge.SYMH_max) then
    write (5, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (BYGSM.le.BYGSM_min) then
    write (6, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (BYGSM.ge.BYGSM_max) then
    write (7, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (BZGSM.le.BZGSM_min) then
    write (8, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (BZGSM.ge.BZGSM_max) then
    write (9, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (Speed.le.Speed_min) then
    write (10, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if
if (Speed.ge.Speed_max) then
    write (11, *) ih, num, Pdyn, Speed, DEN, BZGSM, BYGSM, SYMH, W1, W2, W3, W4, W5, W6
end if

end do

1 continue

print *, 'end'

end program
