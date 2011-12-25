program prog
	implicit none
	integer :: iopt
	real*8 :: parmod(10),ps,x,y,z,bx,by,bz
	real*8 :: AB(10),SPS,CPS,ABB(3),PS,CD(18)
	COMMON /GEOPACK1/ AB(10),SPS,CPS,ABB(3),PS,CD(18) ! call recalc_08
	external t04_s

	print *, 'Start'

	call plot_trace(t04_s, "linesg.dat")

	stop

	iopt = 1
	parmod = 0.3
	x = 0.0
	y = 0.
	z = 5.
	ps = 0.
        do
		print *, ps,x,y,z,bx,by,bz
		call t04_s (iopt,parmod,ps,x,y,z,bx,by,bz)
	end do

end program


      subroutine plot_trace(modfun,o_file)
      implicit real * 8 (a - h, o - z)
      character         o_file*(*)
      external modfun

      character*12 lin_out,num_out
      character*12 c,d

      dimension xc(5000),yc(5000),zc(5000),storex(10000),storey(10000),&
       storez(10000),numpnt(200)
!
	real*8 :: parmod(10)

      common /geopack1/ ab(10),sps,cps,abb(3),ps,cd(18) ! call recalc_08

      external dip_08, null_field

      call recalc_08 (2008,47,04,45,0,-400.d0,0.d0,0.d0) !  here just to specifiy the earth's dipole moment

      lin_out= 'lines.dat'
      num_out='numpnt.dat'
      open(unit=2,file="inputfile.dat")
      open(unit=3,file=o_file) ! linesg.dat

       print *, '    enter tilt angle (degrees)'
!       read *, psi
	psi=0.0
	ps=psi*0.01745329
	sps=dsin(ps)
	cps=dcos(ps)

	x=1.0;y=2.0;z=3.0;
	parmod = 0.
	parmod(1) = 2. ! p_dyn
	parmod(2) = -10. ! dst
	parmod(3) =   2. ! By
	parmod(4) =   -2. ! Bz

	read (2, *) parmod

	if (.false.) then
	do
		print *, 'put x,y,z'
		x=1.0;y=2.0;z=3.0;
		read *, x, y, z
		call modfun (iopt,parmod,ps,x,y,z,bx,by,bz)
		print *, bx,by,bz
		stop
	end do
	end if

      dist=30.
      y=0.

      indd=0
!
      do 1 i=1,31

      t=59.+i*1.
      te=t*0.01745329
      cost=cos(te)
      do 1 k=1,2
      if (i.eq.31.and.k.eq.2) goto 2
      f=180.*(k-1)
      fi=f*0.01745329
      x=cost*cos(fi)
      z=sin(te)
      xi=x*cps+z*sps
      zi=z*cps-x*sps
!
      call trace_08(xi,y,zi,1.d0,1.0d0,1.d-5,dist,1.d0,iopt,parmod,&
       modfun,dip_08,xf,yf,zf,xc,yc,zc,lp,5000)
!
        print *, '  i=', i, ' (of 31)'
!
        iline=iline+1
        numpnt(iline)=lp
          do n=1,lp
           ipoint=ipoint+1
           storex(ipoint)=xc(n)
           storey(ipoint)=yc(n)
           storez(ipoint)=zc(n)
           write(3, *) xc(n),yc(n),zc(n)
          end do
          write (3, *) ''
!
      if(abs(xf)+abs(zf).gt.5.) goto 1
      xmi=1.
!
      if (k.eq.1.and.indd.eq.0) then
         do 1380 ilm=1,lp
         if (xc(ilm).lt.xmi) xmi=xc(ilm)
 1380    continue
         if (xmi.gt.-5.) goto 110
            indd=1
            goto 113
      endif
      if (indd.eq.1.and.k.eq.1) goto 1
!
!   in some cases the first open line for k=1 (a bit poleward from the
!   cusp) appears to be closed. in such a case xf1 could be assigned
!   to the nightside field line, rather than to the dayside one (as it
!   must be). to avoid this, we control the minimal value of the x coor-
!   dinate (xmi).  xmi>-10 and k=1 means that the lines starting at noon
!   meridian still belong entirely to the dayside sector.
!
      if (indd.eq.1) goto 1
 113  xf2=xf
      zf2=zf
      go to 1
 110  xf1=xf
      zf1=zf
!
!   the above quantities (xf1,zf1 and xf2,zf2) specify the coordinates of
!   the landing points in the southern hemisphere corresponding, respectively,
!   to the dayside and nightside last closed field lines.
!
   1  continue
   2  continue

      print *, '  xf1,xf2,zf1,zf2,sps,cps=',xf1,xf2,zf1,zf2,sps,cps

      xl1=atan2((xf1*sps+zf1*cps),(xf1*cps-zf1*sps))
      xl2=atan2((xf2*sps+zf2*cps),(xf2*cps-zf2*sps))
      dl=xl1-xl2
      sdl=1.d0*dl/.01745329 !1.d0 means 1 degree interval in footpoint latitude
      ll=sdl-0.2
       if (ll.lt.1) goto 13
      dtet=dl/(ll+1)
!
      do 11 i=1,ll
      te=xl1-i*dtet
      x=cos(te)
      z=sin(te)
      xi=x*cps+z*sps
      zi=z*cps-x*sps

      call trace_08 (xi,y,zi,-1.d0,1.0d0,1.d-5,dist,1.d0,iopt,parmod,&
       modfun, dip_08,xf,yf,zf,xc,yc,zc,lp,5000)

       print *, '  i=', i, ' (of ',ll,')'
!
        iline=iline+1
        numpnt(iline)=lp
          do n=1,lp
           ipoint=ipoint+1
           storex(ipoint)=xc(n)
           storey(ipoint)=yc(n)
           storez(ipoint)=zc(n)
           write(3, *) xc(n),yc(n),zc(n)
          end do
          write (3, *) ''
!
  11  continue
!
  13   continue
!
            open(unit=1,file=lin_out)
            write(1,888) (storex(n),storey(n),storez(n),n=1,ipoint)
  888       format(3(1x,f7.2))
            close(unit=1)
!
           do i=1,iline
             i1=iline+2-i
             i2=i1-1
             numpnt(i1)=numpnt(i2)
           end do
!
             numpnt(1)=iline
!
             open(unit=1,file=num_out)
             write(1,777) numpnt
             close(unit=1)
 777         format(i3)
        close(unit=3)
!
!
999   end subroutine plot_trace
!
