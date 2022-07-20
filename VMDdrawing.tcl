set io 1080;
set Ts {300.0 500.0 700.0 900.0};
set Vs {1000000 1500000 2000000 500000};
set Ks {1.0 10.0 15.0 2.0 20.0 30.0 4.0 40.0 45.0 6.0 60.0 8.0};
set Rs {0.5 0.55 0.6 0.65 0.7};
scale by 1.200000;
scale by 1.200000;
scale by 1.200000;
color Display Background white
foreach T $Ts {
foreach V $Vs {
foreach K $Ks {
foreach R $Rs {
incr io 1;
set a 1;
set a1 [expr $K+$a];
set Ec [expr $a1/2];
cd C:/Users/Dell/Desktop/MK2Dimages/sphere_vel/T$T/V$V/K$K/R$R
echo $T$V$K$R
mol addfile Edis.xyz;
scale by 1.200000;
scale by 1.200000;
scale by 1.200000;
source loadvel.tcl;
menu graphics on;
mol modcolor trajectory top User;
mol modstyle trajectory top Points 5.000000;
mol scaleminmax  top  0 0.200000 $Ec;
#mol scaleminmax  top  0 0.200000 6.0000000;
menu graphics off;
#render snapshot E:/BISHE/LammpsFile/WORK/cylinder_out/T1100.0/V1000000/K$K/R$R/1.png
#render snapshot E:/BISHE/LammpsFile/WROK/cylinder_out/T1100.0/V1000000/K$K/R$R/T1100.0-V1000000-K$K-R$R.png
#render snapshot E:/BISHE/LammpsFile/WORK/cylinder_out/images/T$T-V$V-K$K-R$R.png
render snapshot C:/Users/Dell/Desktop/MK2Dimages/2Dimages3/$io.png;
puts $io;puts $Ec;
mol delete top;
   }
  }
 }
}